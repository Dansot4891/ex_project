import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class AppYoutubeController {
  // 컨트롤러 및 id 관리
  YoutubePlayerController? _controller;
  String? _currentVideoId;

  // 현재 컨트롤러 가져오기
  YoutubePlayerController? get controller => _controller;

  // 현재 비디오 ID 가져오기
  String? get currentVideoId => _currentVideoId;

  // 비디오 ID로 초기화
  void initializeWithVideoId(String videoId) {
    _currentVideoId = videoId;

    _controller?.dispose();
    _controller = YoutubePlayerController(
      initialVideoId: videoId,
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: true,
        enableCaption: false,
        // 모든 컨트롤러 숨기기
        // hideControls: true,
      ),
    );
  }

  // 비디오 변경 (비디오 ID로)
  void changeVideo(String videoId) {
    if (_currentVideoId != videoId) {
      initializeWithVideoId(videoId);
    }
  }

  // 컨트롤러 재생
  void play() {
    _controller?.play();
  }

  // 컨트롤러 일시정지
  void pause() {
    _controller?.pause();
  }

  // 컨트롤러 정지 (pause로 대체)
  void stop() {
    _controller?.pause();
  }

  // 컨트롤러 해제
  void dispose() {
    _controller?.dispose();
    _controller = null;
    _currentVideoId = null;
  }

  // 컨트롤러가 초기화되었는지 확인
  bool get isInitialized => _controller != null;

  // 현재 재생 상태 확인
  bool get isPlaying => _controller?.value.isPlaying ?? false;
}
