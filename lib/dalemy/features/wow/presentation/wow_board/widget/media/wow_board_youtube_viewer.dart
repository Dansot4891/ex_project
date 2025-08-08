import 'package:ex_project/core/module/media/app_youtube_controller.dart';
import 'package:flutter/material.dart';
import 'package:ex_project/app/di/app_di.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class WowBoardYoutubeViewer extends StatefulWidget {
  final String youtubeId;
  const WowBoardYoutubeViewer({super.key, required this.youtubeId});

  @override
  State<WowBoardYoutubeViewer> createState() => _WowBoardYoutubeViewerState();
}

class _WowBoardYoutubeViewerState extends State<WowBoardYoutubeViewer> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    _controller = _controller = YoutubePlayerController.fromVideoId(
      videoId: "IOZQ7OOm3Z8",
      autoPlay: true,
      params: const YoutubePlayerParams(showFullscreenButton: false),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // return YoutubePlayer(
    //   bottomActions: [
    //     CurrentPosition(),
    //     ProgressBar(isExpanded: true),
    //     RemainingDuration(),
    //     PlaybackSpeedButton(),
    //     FullScreenButton(),
    //   ],
    //   controller: locator<AppYoutubeController>().controller!,
    //   aspectRatio: 1 / 1,
    // );
    return YoutubePlayer(controller: _controller, aspectRatio: 1 / 1);
  }
}
