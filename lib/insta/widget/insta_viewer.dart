import 'dart:convert';
import 'dart:io';
import 'package:ex_project/video_cache/widget/app_video_widget.dart';
import 'package:flutter/material.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:webview_flutter/webview_flutter.dart';

class InstaViewer extends StatefulWidget {
  final String postUrl;
  const InstaViewer({super.key, required this.postUrl});

  @override
  State<InstaViewer> createState() => _InstaViewerState();
}

class _InstaViewerState extends State<InstaViewer> {
  late final WebViewController controller;
  bool isLoading = true;
  String videoUrl = "";

  String userAgent =
      "Mozilla/5.0 (iPhone; CPU iPhone OS 15_0 like Mac OS X) AppleWebKit/605.1.15";

  @override
  void initState() {
    super.initState();

    getRealUserAgent();

    controller = WebViewController()
      /// 자바스크립트 모드 설정
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          /// 페이지 시작 시
          onPageStarted: (String url) {
            print('Page started loading: $url');
          },

          /// 페이지 로딩 완료 시
          onPageFinished: (String url) async {
            final result = await controller.runJavaScriptReturningResult("""
    (function() {
      var videoUrls = [];
      
      // 모든 video 태그 찾기
      document.querySelectorAll('video').forEach(video => {
        if (video.src && video.src.includes('instagram')) {
          videoUrls.push({
            src: video.src,
            poster: video.poster || '',
            duration: video.duration || 0
          });
        }
        
        // source 태그도 확인
        video.querySelectorAll('source').forEach(source => {
          if (source.src && source.src.includes('instagram')) {
            videoUrls.push({
              src: source.src,
              type: source.type || '',
              poster: video.poster || ''
            });
          }
        });
      });
      
      return JSON.stringify(videoUrls);
    })();
  """);

            // JSON 파싱해서 사용
            final videos = json.decode(result.toString());
            print('videos: $videos');
            setState(() {
              if (videos.isNotEmpty) {
                videoUrl = videos.first['src'];
              }
              isLoading = false;
            });
            // 이 URL로 영상 다운로드 가능
          },

          /// 웹뷰 에러 시
          onWebResourceError: (WebResourceError error) {
            print('WebView error: ${error.description}');
          },
        ),
      )
      ..setUserAgent(userAgent)
      ..loadRequest(
        Uri.parse(
          'https://www.instagram.com/reel/DMWg2OENskD/?utm_source=ig_embed&amp;utm_campaign=loading',
        ),
      );
    // 릴스
    // https://www.instagram.com/reel/DLP__GbNiLx/?utm_source=ig_web_copy_link&igsh=MzRlODBiNWFlZA==
    // 포스트
    // https://www.instagram.com/p/DIHRKOiy5kq/embed/
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Center(child: CircularProgressIndicator());
    }
    return AppVideoWidget(videoUrl: videoUrl);
  }

  void getRealUserAgent() async {
    final deviceInfo = DeviceInfoPlugin();
    String userAgent =
        "Mozilla/5.0 (iPhone; CPU iPhone OS 15_0 like Mac OS X) AppleWebKit/605.1.15";

    if (Platform.isIOS) {
      final iosInfo = await deviceInfo.iosInfo;
      userAgent =
          "Mozilla/5.0 (${iosInfo.model}; CPU iPhone OS ${iosInfo.systemVersion.replaceAll('.', '_')} like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/${iosInfo.systemVersion} Mobile Safari/604.1";
    } else if (Platform.isAndroid) {
      final androidInfo = await deviceInfo.androidInfo;
      userAgent =
          "Mozilla/5.0 (Linux; Android ${androidInfo.version.release}; ${androidInfo.model}) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Mobile Safari/537.36";
    }

    print('getRealUserAgent: $userAgent');
  }
}
