import 'package:ex_project/video_cache/widget/app_video_widget.dart';
import 'package:flutter/material.dart';

class VideoExView extends StatelessWidget {
  const VideoExView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Video Ex')),
      body: const Column(
        children: [
          const AppVideoWidget(
            videoUrl:
                'https://videos.pexels.com/video-files/27798565/12227924_1920_1080_25fps.mp4',
            isAutoPlay: false,
          ),

          const AppVideoWidget(
            videoUrl:
                'https://videos.pexels.com/video-files/27798565/12227924_1920_1080_25fps.mp4',
            isAutoPlay: true,
          ),
        ],
      ),
    );
  }
}
