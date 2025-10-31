import 'package:flutter/rendering.dart';
import 'package:video_player/video_player.dart';

class AppVideoController {
  // 현재 활성화된 비디오 정보
  String? _currentVideoUrl;

  // 전역 비디오 컨트롤러 (하나만 관리)
  VideoPlayerController? _videoController;

  // 현재 활성화된 비디오 정보
  String? get currentVideoUrl => _currentVideoUrl;

  // 현재 비디오 컨트롤러 접근
  VideoPlayerController? get controller => _videoController;

  // 비디오 초기화
  Future<void> initializeVideo(String videoUrl) async {
    if (videoUrl.isEmpty) return;

    try {
      // 기존 컨트롤러 해제
      _videoController?.dispose();

      // 새 컨트롤러 생성
      _videoController = VideoPlayerController.networkUrl(Uri.parse(videoUrl));
      await _videoController!.initialize();

      _setActiveVideo(videoUrl);
    } catch (e) {
      debugPrint('비디오 초기화 실패: $e');
    }
  }

  // 활성 비디오 설정
  void _setActiveVideo(String videoUrl) {
    // 기존 활성 비디오 정지
    _pauseCurrentVideo();

    // 새 활성 비디오 설정
    _currentVideoUrl = videoUrl;

    // 새 비디오 재생
    _playCurrentVideo();
  }

  // 현재 활성 비디오 재생
  void _playCurrentVideo() {
    _videoController?.play();
  }

  // 현재 활성 비디오 정지
  void _pauseCurrentVideo() {
    _videoController?.pause();
  }

  // 특정 인덱스의 비디오 활성화
  Future<void> activateVideo(String videoUrl) async {
    if (_currentVideoUrl != videoUrl) {
      await initializeVideo(videoUrl);
    }
  }

  // 현재 활성 비디오 재생
  void playCurrentVideo() {
    _playCurrentVideo();
  }

  // 현재 활성 비디오 정지
  void pauseCurrentVideo() {
    _pauseCurrentVideo();
  }

  // 리소스 정리
  void dispose() {
    _videoController?.dispose();
    _videoController = null;
    _currentVideoUrl = null;
  }

  // 현재 재생 상태 확인
  bool get isPlaying {
    return _videoController?.value.isPlaying ?? false;
  }

  // 현재 활성 비디오가 초기화되었는지 확인
  bool get isInitialized => _videoController != null;

  // 비디오 컨트롤러가 준비되었는지 확인
  bool get isReady => _videoController?.value.isInitialized ?? false;
}
