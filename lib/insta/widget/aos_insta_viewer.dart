import 'dart:convert';
import 'dart:io';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:ex_project/video_cache/widget/app_video_widget.dart';
import 'package:flutter/material.dart';

class AosInstaViewer extends StatefulWidget {
  final String postUrl;
  const AosInstaViewer({super.key, required this.postUrl});

  @override
  State<AosInstaViewer> createState() => _AosInstaViewerState();
}

class _AosInstaViewerState extends State<AosInstaViewer> {
  late final WebViewController controller;
  bool isLoading = true;
  String videoUrl = "";
  String? errorMessage;
  BlobVideoExtractor? extractor;

  @override
  void initState() {
    super.initState();
    _initializeWebView();
  }

  void _initializeWebView() {
    extractor = BlobVideoExtractor(
      onVideoExtracted: (String filePath) {
        setState(() {
          videoUrl = filePath;
          isLoading = false;
        });
      },
      onError: (String error) {
        setState(() {
          errorMessage = error;
          isLoading = false;
        });
      },
    );

    controller = extractor!.setupWebView();
    _loadInstagramPost();
  }

  Future<void> _loadInstagramPost() async {
    try {
      // Instagram URL 로드
      await controller.loadRequest(Uri.parse(widget.postUrl));
    } catch (e) {
      setState(() {
        errorMessage = '페이지를 로드할 수 없습니다: $e';
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Scaffold(
        appBar: AppBar(title: const Text('Instagram 영상 로딩')),
        body: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(),
              SizedBox(height: 16),
              Text('영상을 추출하는 중...'),
            ],
          ),
        ),
      );
    }

    if (errorMessage != null) {
      return Scaffold(
        appBar: AppBar(title: const Text('오류')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.error, size: 64, color: Colors.red),
              const SizedBox(height: 16),
              Text(errorMessage!, textAlign: TextAlign.center),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    isLoading = true;
                    errorMessage = null;
                  });
                  _loadInstagramPost();
                },
                child: const Text('다시 시도'),
              ),
            ],
          ),
        ),
      );
    }

    if (videoUrl.isNotEmpty) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Instagram 영상'),
          actions: [
            IconButton(
              icon: const Icon(Icons.refresh),
              onPressed: () {
                setState(() {
                  isLoading = true;
                  videoUrl = "";
                  errorMessage = null;
                });
                _loadInstagramPost();
              },
            ),
          ],
        ),
        body: AppVideoWidget(videoUrl: videoUrl),
      );
    }

    return Scaffold(
      appBar: AppBar(title: const Text('영상을 찾을 수 없음')),
      body: const Center(child: Text('영상을 찾을 수 없습니다.')),
    );
  }

  @override
  void dispose() {
    extractor?.dispose();
    super.dispose();
  }
}

class BlobVideoExtractor {
  late WebViewController controller;
  final Function(String) onVideoExtracted;
  final Function(String) onError;
  bool _isDisposed = false;

  BlobVideoExtractor({required this.onVideoExtracted, required this.onError});

  WebViewController setupWebView() {
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setUserAgent(
        'Mozilla/5.0 (Linux; Android 10; SM-G975F) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.120 Mobile Safari/537.36',
      )
      ..addJavaScriptChannel(
        'FlutterHandler',
        onMessageReceived: (JavaScriptMessage message) {
          if (!_isDisposed) {
            _handleBlobData(message.message);
          }
        },
      )
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageFinished: (url) {
            if (!_isDisposed) {
              _extractBlobVideo();
            }
          },
          onWebResourceError: (error) {
            if (!_isDisposed) {
              onError('웹 리소스 오류: ${error.description}');
            }
          },
        ),
      );

    return controller;
  }

  Future<void> _extractBlobVideo() async {
    try {
      // 페이지가 완전히 로드될 때까지 더 긴 대기
      await Future.delayed(const Duration(seconds: 5));

      const script = '''
        (function() {
          let attempts = 0;
          const maxAttempts = 10;
          
          function findVideos() {
            attempts++;
            console.log('비디오 검색 시도:', attempts);
            
            // 다양한 방법으로 비디오 찾기
            const videos = document.querySelectorAll('video');
            const videoTags = document.getElementsByTagName('video');
            const iframes = document.querySelectorAll('iframe');
            
            console.log('Found videos:', videos.length);
            console.log('Found video tags:', videoTags.length);
            console.log('Found iframes:', iframes.length);
            
            // 현재 페이지의 모든 요소 확인
            console.log('Page title:', document.title);
            console.log('URL:', window.location.href);
            
            // Instagram 특정 셀렉터들
            const instaVideos = [
              'video[src*="blob:"]',
              'video[src*=".mp4"]',
              'article video',
              '[role="dialog"] video',
              '._aagv video', // Instagram CSS 클래스
              '._ac7v video',
              '.x1lliihq video'
            ];
            
            let foundVideo = null;
            
            for (let selector of instaVideos) {
              const videoElements = document.querySelectorAll(selector);
              console.log('Selector "' + selector + '" found:', videoElements.length);
              
              if (videoElements.length > 0) {
                foundVideo = videoElements[0];
                break;
              }
            }
            
            if (foundVideo) {
              console.log('비디오 발견!');
              console.log('Video src:', foundVideo.src);
              console.log('Video currentSrc:', foundVideo.currentSrc);
              
              const videoSrc = foundVideo.src || foundVideo.currentSrc;
              
              if (videoSrc && videoSrc.startsWith('blob:')) {
                console.log('Blob 비디오 처리 중...');
                fetch(videoSrc)
                  .then(response => response.arrayBuffer())
                  .then(buffer => {
                    const uint8Array = new Uint8Array(buffer);
                    const base64 = btoa(String.fromCharCode.apply(null, uint8Array));
                    FlutterHandler.postMessage('SUCCESS:' + base64);
                  })
                  .catch(err => {
                    console.error('Blob 변환 실패:', err);
                    FlutterHandler.postMessage('ERROR:Blob 변환 실패: ' + err.message);
                  });
              } else if (videoSrc) {
                console.log('직접 URL 비디오:', videoSrc);
                FlutterHandler.postMessage('DIRECT_URL:' + videoSrc);
              }
              return true;
            }
            
            // 비디오를 못 찾았고 아직 시도할 수 있다면
            if (attempts < maxAttempts) {
              console.log('비디오를 찾지 못함. 2초 후 재시도...');
              setTimeout(findVideos, 2000);
            } else {
              console.log('최대 시도 횟수 초과. 포기.');
              
              // 마지막으로 페이지 상태 확인
              console.log('Body innerHTML length:', document.body.innerHTML.length);
              console.log('All videos on page:');
              const allVideos = document.querySelectorAll('*');
              let videoCount = 0;
              allVideos.forEach(el => {
                if (el.tagName === 'VIDEO') {
                  videoCount++;
                  console.log('Video element:', el.outerHTML.substring(0, 200));
                }
              });
              
              if (videoCount === 0) {
                FlutterHandler.postMessage('ERROR:페이지에서 비디오를 찾을 수 없습니다. Instagram 로그인이 필요하거나 URL이 올바르지 않을 수 있습니다.');
              } else {
                FlutterHandler.postMessage('ERROR:비디오는 있지만 접근할 수 없습니다.');
              }
            }
            
            return false;
          }
          
          // 즉시 실행
          if (!findVideos()) {
            // 페이지가 완전히 로드되지 않았을 수 있으므로 추가 대기
            console.log('첫 번째 시도 실패. DOM 변화 감지 시작...');
            
            // MutationObserver로 DOM 변화 감지
            const observer = new MutationObserver(function(mutations) {
              mutations.forEach(function(mutation) {
                if (mutation.type === 'childList' && mutation.addedNodes.length > 0) {
                  // 새로운 노드가 추가되었을 때 비디오 검색
                  for (let node of mutation.addedNodes) {
                    if (node.nodeType === 1 && node.tagName === 'VIDEO') {
                      console.log('새 비디오 요소 감지됨!');
                      observer.disconnect();
                      findVideos();
                      return;
                    }
                  }
                }
              });
            });
            
            observer.observe(document.body, {
              childList: true,
              subtree: true
            });
            
            // 10초 후 observer 정리
            setTimeout(() => {
              observer.disconnect();
            }, 10000);
          }
        })();
      ''';

      await controller.runJavaScript(script);
    } catch (e) {
      if (!_isDisposed) {
        onError('JavaScript 실행 오류: $e');
      }
    }
  }

  void _handleBlobData(String message) {
    if (_isDisposed) return;

    try {
      if (message.startsWith('ERROR:')) {
        onError(message.substring(6));
        return;
      }

      if (message.startsWith('DIRECT_URL:')) {
        // 직접 URL인 경우 바로 전달
        onVideoExtracted(message.substring(11));
        return;
      }

      if (message.startsWith('SUCCESS:')) {
        final base64Data = message.substring(8);
        _saveVideoFile(base64Data);
        return;
      }

      // 기본적으로 base64 데이터로 처리
      _saveVideoFile(message);
    } catch (e) {
      onError('데이터 처리 오류: $e');
    }
  }

  Future<void> _saveVideoFile(String base64Data) async {
    try {
      final bytes = base64Decode(base64Data);

      if (bytes.isEmpty) {
        onError('비어있는 비디오 데이터');
        return;
      }

      final directory = await getApplicationDocumentsDirectory();
      final fileName = 'video_${DateTime.now().millisecondsSinceEpoch}.mp4';
      final file = File('${directory.path}/$fileName');

      await file.writeAsBytes(bytes);

      if (await file.exists()) {
        print('동영상 저장됨: ${file.path}');
        onVideoExtracted(file.path);
      } else {
        onError('파일 저장에 실패했습니다');
      }
    } catch (e) {
      onError('파일 저장 오류: $e');
    }
  }

  void dispose() {
    _isDisposed = true;
  }
}
