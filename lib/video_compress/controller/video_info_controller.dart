import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:video_player/video_player.dart';

abstract class VideoInfoController {
  /// 비디오 크기 및 해상도 출력
  static Future<void> printVideoInfo(String path) async {
    debugPrint('printVideoInfo: $path');
    final file = File(path);

    if (!await file.exists()) {
      debugPrint('⚠️ File not found: $path');
      return;
    }

    final size = await file.length();
    debugPrint('📏 파일 크기: ${(size / 1024 / 1024).toStringAsFixed(2)} MB');

    final controller = VideoPlayerController.file(file);
    try {
      await controller.initialize();

      final width = controller.value.size.width;
      final height = controller.value.size.height;
      final duration = controller.value.duration;

      debugPrint('📐 해상도: ${width.toInt()}x${height.toInt()}');
      debugPrint('⏱ 영상 길이: ${duration.inSeconds}s');
    } catch (e) {
      debugPrint('❌ 비디오 정보 읽기 실패: $e');
    } finally {
      await controller.dispose();
    }
  }
}
