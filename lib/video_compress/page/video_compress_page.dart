import 'dart:io';
import 'package:ex_project/video_compress/controller/native_video_controller.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';

class VideoCompressPage extends StatefulWidget {
  const VideoCompressPage({super.key});

  @override
  State<VideoCompressPage> createState() => _VideoCompressPageState();
}

class _VideoCompressPageState extends State<VideoCompressPage> {
  String? path;
  final picker = ImagePicker();
  VideoPlayerController? _controller;

  void _selectVideo() async {
    final result = await picker.pickVideo(source: ImageSource.gallery);
    if (result != null) {
      setState(() {
        path = result.path;
        _controller = VideoPlayerController.file(File(path!))
          ..initialize().then((_) {
            setState(() {});
          });
      });
      debugPrint('path: $path');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Video Compress Page')),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              ElevatedButton(
                onPressed: _selectVideo,
                child: Text('Select Video'),
              ),
              if (path != null)
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: _controller != null && _controller!.value.isInitialized
                      ? AspectRatio(
                          aspectRatio: _controller!.value.aspectRatio,
                          child: VideoPlayer(_controller!),
                        )
                      : Container(),
                ),
              ElevatedButton(
                onPressed: () {
                  NativeVideoController.compressVideo(
                    inputPath: 'assets/video/test.mp4',
                    outputPath: 'assets/video/test_compressed.mp4',
                  );
                },
                child: Text('Compress Video'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
