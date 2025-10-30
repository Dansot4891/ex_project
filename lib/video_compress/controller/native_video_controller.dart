import 'dart:io';
import 'package:ex_project/video_compress/enum/audio_codec.dart';
import 'package:ex_project/video_compress/enum/video_codec.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';

abstract class AppVideoCompressor {
  static const MethodChannel _channel = MethodChannel(
    'native_video_compressor',
  );

  /// 비디오 압축
  ///
  /// [inputPath] : 입력 비디오 경로
  /// [outputPath] : 출력 비디오 경로
  /// [bitrate] : 비디오 비트레이트 (예: 2000000 = 2Mbps)
  /// [width] : 출력 비디오 너비
  /// [height] : 출력 비디오 높이
  /// [videoCodec] : 비디오 코덱 ("h264" 또는 "h265"/"hevc"), 기본값: "h264"
  /// [audioCodec] : 오디오 코덱 ("aac", "alac", "mp3"), 기본값: "aac"
  /// [audioBitrate] : 오디오 비트레이트 (예: 128000 = 128kbps), 기본값: 128000
  /// [audioSampleRate] : 오디오 샘플레이트 (예: 44100), 기본값: 44100
  /// [audioChannels] : 오디오 채널 수 (1=모노, 2=스테레오), 기본값: 2
  static Future<String?> compressVideo({
    required String inputPath,
    required String outputPath,
    required int bitrate,
    required int width,
    required int height,
    VideoCodec videoCodec = VideoCodec.h264,
    AudioCodec audioCodec = AudioCodec.aac,
    int audioBitrate = 128000,
    int audioSampleRate = 44100,
    int audioChannels = 2,
  }) async {
    try {
      final String? result = await _channel.invokeMethod('compressVideo', {
        'input': inputPath,
        'output': outputPath,
        'bitrate': bitrate,
        'width': width,
        'height': height,
        'videoCodec': videoCodec,
        'audioCodec': audioCodec,
        'audioBitrate': audioBitrate,
        'audioSampleRate': audioSampleRate,
        'audioChannels': audioChannels,
      });
      return result;
    } on PlatformException catch (e) {
      debugPrint('비디오 압축 실패: ${e.message}');
      return null;
    }
  }

  /// 캐시 삭제
  static Future<void> clearCache() async {
    final tempDir = await getTemporaryDirectory();
    final fileName = '${tempDir.path}/$_fileName';
    if (File(fileName).existsSync()) {
      File(fileName).deleteSync();
      debugPrint("✅ 캐시 삭제 완료");
    }
  }

  /// 파일명
  static String get _fileName => 'compressed.mp4';
}
