import 'dart:convert';
import 'dart:developer' as dev;
import 'package:ex_project/insta/widget/aos_insta_viewer.dart';
import 'package:ex_project/insta/widget/insta_viewer.dart';
import 'package:ex_project/video_cache/widget/app_video_widget.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class InstaExView extends StatefulWidget {
  const InstaExView({super.key});

  @override
  State<InstaExView> createState() => _InstaExViewState();
}

class _InstaExViewState extends State<InstaExView> {
  late final WebViewController controller;
  String videoUrl = "";
  final postUrl =
      "https://www.instagram.com/reel/DMWg2OENskD/?utm_source=ig_embed&amp;utm_campaign=loading";

  @override
  void initState() {
    super.initState();

    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (String url) {
            print('Page started loading: $url');
          },
          onPageFinished: (String url) async {
            print('Page finished loading: $url');
          },
          onWebResourceError: (WebResourceError error) {
            print('WebView error: ${error.description}');
          },
        ),
      )
      ..setUserAgent(
        "Mozilla/5.0 (iPhone; CPU iPhone OS 15_0 like Mac OS X) AppleWebKit/605.1.15",
      )
      ..loadRequest(Uri.parse(postUrl));
    // 릴스
    // https://www.instagram.com/reel/DLP__GbNiLx/?utm_source=ig_web_copy_link&igsh=MzRlODBiNWFlZA==
    // 포스트
    // https://www.instagram.com/p/DIHRKOiy5kq/embed/
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  width: MediaQuery.sizeOf(context).width,
                  height: MediaQuery.sizeOf(context).width + 130,
                  child: WebViewWidget(controller: controller),
                ),
                Container(
                  width: MediaQuery.sizeOf(context).width,
                  height: 130,
                  color: Colors.red.withValues(alpha: 0.5),
                ),
              ],
            ),
            // InstaViewer(postUrl: postUrl),
            // AosInstaViewer(postUrl: postUrl),
            Container(
              width: MediaQuery.sizeOf(context).width,
              height: 100,
              color: Colors.yellow,
              child: Center(child: Text('Yellow Container')),
            ),
            Container(
              width: MediaQuery.sizeOf(context).width,
              height: 100,
              color: Colors.purple,
              child: Center(child: Text('Purple Container')),
            ),
          ],
        ),
      ),
    );
  }

  //   Future<String?> getReelVideoUrl(String reelUrl) async {
  //   final response = await http.get(Uri.parse(reelUrl), headers: {
  //     'User-Agent':
  //         'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120 Safari/537.36'
  //   });

  //   if (response.statusCode == 200) {
  //     final body = response.body;
  //     final match = RegExp(r'"video_url":"([^"]+\.mp4[^"]*)"', dotAll: true)
  //         .firstMatch(body);

  //     if (match != null) {
  //       // Instagram은 유니코드 이스케이프로 &를 \u0026로 씀 → 복원
  //       return match.group(1)?.replaceAll(r'\u0026', '&');
  //     }
  //   }
  //   return null;
  // }
}
