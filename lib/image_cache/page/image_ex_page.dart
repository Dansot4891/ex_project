import 'package:cached_network_image/cached_network_image.dart';
import 'package:ex_project/image_cache/widget/image_ex_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

class ImageExPage extends StatefulWidget {
  const ImageExPage({super.key});

  @override
  State<ImageExPage> createState() => _ImageExPageState();
}

class _ImageExPageState extends State<ImageExPage> {
  @override
  Widget build(BuildContext context) {
    debugInvertOversizedImages = true;
    final pixelRatio = MediaQuery.of(context).devicePixelRatio;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(
            "https://cdn.pixabay.com/photo/2024/05/26/16/49/dog-8789154_1280.jpg",
            width: 300,
            cacheWidth: (300 * pixelRatio).round(), // 기기별 최적화
          ),

          CachedNetworkImage(
            imageUrl:
                "https://cdn.pixabay.com/photo/2024/05/26/16/49/dog-8789154_1280.jpg",
            width: 300,
            memCacheWidth: (300 * pixelRatio).round(),
          ),
          TextButton(
            onPressed: () {
              setState(() {});
              printCacheStatus();
            },
            child: const Text('printCacheStatus'),
          ),
          // ImageExWidget(
          //   imageUrl:
          //       'https://m.health.chosun.com/site/data/img_dir/2024/10/16/2024101602160_0.jpg',
          // ),
        ],
      ),
    );
  }
}

Future<void> printCacheStatus() async {
  // 메모리 캐시 상태
  final imageCache = PaintingBinding.instance.imageCache;
  print('메모리 캐시: ${imageCache.currentSize}/${imageCache.maximumSize}');
  print(
    '메모리 사용량: ${imageCache.currentSizeBytes}/${imageCache.maximumSizeBytes}',
  );
}
