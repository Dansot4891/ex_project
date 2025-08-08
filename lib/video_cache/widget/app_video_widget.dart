import 'package:flutter/material.dart';
import 'package:cached_video_player_plus/cached_video_player_plus.dart';
import 'package:video_player/video_player.dart';

class AppVideoWidget extends StatefulWidget {
  final String videoUrl;
  final Duration invalidateCacheIfOlderThan;
  final bool isCache;
  // final bool isLoop;
  final bool isAutoPlay;
  final double volume;

  const AppVideoWidget({
    super.key,
    required this.videoUrl,

    /// 캐시 만료 시간 설정
    /// 기본 30분
    this.invalidateCacheIfOlderThan = const Duration(minutes: 30),
    this.isCache = true,
    // this.isLoop = true,
    this.isAutoPlay = true,
    this.volume = 0,
  });

  @override
  State<AppVideoWidget> createState() => _AppVideoWidgetState();
}

class _AppVideoWidgetState extends State<AppVideoWidget> {
  late final CachedVideoPlayerPlus _player;
  bool isError = false;
  bool isEnded = false;

  @override
  void initState() {
    super.initState();

    /// 비디오 주소가 비어있는 경우 에러 처리
    if (widget.videoUrl.isEmpty) {
      setState(() {
        isError = true;
      });
      return;
    }

    /// 비디오 캐싱 초기화
    _player = CachedVideoPlayerPlus.networkUrl(
      Uri.parse(widget.videoUrl),
      cacheKey: _cacheKey,
      invalidateCacheIfOlderThan: widget.invalidateCacheIfOlderThan,
    );

    _player
        .initialize()
        .then((_) {
          if (mounted) {
            /// 볼륨 설정
            _controller.setVolume(widget.volume);

            setState(() {});

            /// 비디오 자동 재생 설정
            if (widget.isAutoPlay) {
              _controller.play();
            } else {
              setState(() {
                isEnded = true;
              });
            }

            /// 비디오 Listener 설정
            _controller.addListener(_handleVideoStatus);
          }
        })
        .catchError((error) {
          if (mounted) {
            setState(() {
              isError = true;
            });
          }
        });
  }

  /// 비디오 상태 처리
  void _handleVideoStatus() async {
    if (_controller.value.isCompleted && !isEnded) {
      /// 비디오 종료 시 첫 프레임으로 이동 및 정지
      await _controller.seekTo(Duration.zero);
      await _controller.pause();

      /// 비디오 종료 시 첫 프레임으로 이동 및 정지 후 150ms 딜레이
      /// => 비디오 플레이어내에서 pause 함수가 100ms 딜레이를 가지고 있음
      await Future.delayed(const Duration(milliseconds: 150));

      setState(() {
        isEnded = true;
      });
    }
  }

  /// 비디오 다시 재생
  void _replayVideo() async {
    await _controller.play();
    setState(() {
      isEnded = false;
    });
  }

  @override
  void dispose() {
    videoDispose();
    super.dispose();
  }

  void videoDispose() async {
    /// 캐시 삭제 옵션 추가
    if (!widget.isCache) {
      await CachedVideoPlayerPlus.removeFileFromCacheByKey(_cacheKey);
    }

    /// 비디오 주소가 비어있지 않은 경우 비디오 플레이어 dispose
    if (widget.videoUrl.isNotEmpty) {
      await _player.dispose();
    }
  }

  @override
  Widget build(BuildContext context) {
    /// 영상 로딩 오류 처리
    if (isError) {
      return const Center(
        child: Text(
          '영상을 불러오는 중\n오류가 발생했습니다.',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          textAlign: TextAlign.center,
        ),
      );
    }

    /// 영상 로딩 중 처리
    if (!_player.isInitialized) {
      return const Center(child: CircularProgressIndicator());
    }

    return AspectRatio(
      aspectRatio: _controller.value.aspectRatio,
      child: Stack(
        alignment: Alignment.center,
        children: [
          VideoPlayer(_controller),

          // 영상 종료 시 흐림 배경 및 ▶️ 버튼
          if (isEnded) ...[
            Container(color: Colors.black.withValues(alpha: 0.5)),
            IconButton(
              icon: const Icon(
                Icons.play_circle_fill_rounded,
                size: 64,
                color: Colors.white,
              ),
              onPressed: _replayVideo,
            ),
          ],
        ],
      ),
    );
  }

  /// 캐시 키 생성
  String get _cacheKey => widget.videoUrl.split('/').last;

  VideoPlayerController get _controller => _player.controller;
}
