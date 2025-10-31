import 'package:ex_project/video_compress/component/video_file_widget.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:native_video_compress/controller/native_video_compressor.dart';

class VideoCompressPage extends StatefulWidget {
  const VideoCompressPage({super.key});

  @override
  State<VideoCompressPage> createState() => _VideoCompressPageState();
}

class _VideoCompressPageState extends State<VideoCompressPage> {
  String? path;
  String? outputPath;
  final picker = ImagePicker();

  void _selectVideo() async {
    final result = await picker.pickVideo(source: ImageSource.gallery);
    if (result != null) {
      setState(() {
        path = result.path;
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
                child: const Text('Select Video'),
              ),
              if (path != null)
                AppFileVideoWidget(
                  videoPath: path!,
                  width: double.infinity,
                  isAutoPlay: true,
                ),
              if (outputPath != null)
                AppFileVideoWidget(
                  videoPath: outputPath!,
                  width: double.infinity,
                  isAutoPlay: true,
                ),
              ElevatedButton(
                onPressed: () async {
                  final result = await NativeVideoController.compressVideo(
                    inputPath: path!,
                    printingInfo: true,
                  );
                  setState(() {
                    outputPath = result;
                  });
                },
                child: const Text('Compress Video'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
