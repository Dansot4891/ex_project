import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

class ImageExWidget extends StatelessWidget {
  final String imageUrl;
  final bool isCache;
  final double? width;
  final double? height;
  final int? cacheWidth;
  final int? cacheHeight;
  final BoxFit? fit;
  final bool isNetwork;
  const ImageExWidget({
    super.key,
    required this.imageUrl,
    this.isCache = true,
    this.width,
    this.height,
    this.cacheWidth,
    this.cacheHeight,
    this.fit,
    this.isNetwork = true,
  });

  @override
  Widget build(BuildContext context) {
    if (!isNetwork) {
      return Image.asset(
        imageUrl,
        width: width,
        height: height,
        cacheWidth: cacheWidth,
        cacheHeight: cacheHeight,
        fit: fit,
        errorBuilder: (context, error, stackTrace) => _buildError(),
      );
    }

    /// 캐시 사용 여부에 따라 다르게 표시
    if (isCache) {
      return CachedNetworkImage(
        imageUrl: imageUrl,
        width: width,
        height: height,
        fit: fit,
        memCacheWidth: cacheWidth,
        memCacheHeight: cacheHeight,
        placeholder: (context, url) => _buildLoading(),
        errorWidget: (context, url, error) => _buildError(),
      );
    }

    /// 캐시 사용 여부에 따라 다르게 표시
    return Image.network(
      imageUrl,
      width: width,
      height: height,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
      fit: fit,
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress != null) {
          return _buildLoading();
        }
        return child;
      },
      errorBuilder: (context, error, stackTrace) => _buildError(),
    );
  }

  /// 로딩 중 표시
  Center _buildLoading() {
    return const Center(child: CircularProgressIndicator(color: Colors.black));
  }

  /// 에러 발생 시 표시
  Center _buildError() {
    return const Center(
      child: Text(
        '이미지를 불러오는 중\n오류가 발생했습니다.',
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
      ),
    );
  }
}

Future<void> printCacheStatus() async {
  // 디스크 캐시 개수
  await DefaultCacheManager().getFileFromCache('');

  // 메모리 캐시 상태
  final imageCache = PaintingBinding.instance.imageCache;
  debugPrint('메모리 캐시: ${imageCache.currentSize}/${imageCache.maximumSize}');
  debugPrint(
    '메모리 사용량: ${imageCache.currentSizeBytes}/${imageCache.maximumSizeBytes}',
  );
}
