import 'package:flutter/material.dart';

class VideoCompressPage extends StatelessWidget {
  const VideoCompressPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Video Compress Page')),
      body: SafeArea(child: Column(children: [Text('Video Compress Page')])),
    );
  }
}
