import 'package:ex_project/core/module/media/app_video_controller.dart';
import 'package:ex_project/app/di/app_di.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class WowBoardVideoViewer extends StatefulWidget {
  final List<String> url;
  const WowBoardVideoViewer({super.key, required this.url});

  @override
  State<WowBoardVideoViewer> createState() => _WowBoardVideoViewerState();
}

class _WowBoardVideoViewerState extends State<WowBoardVideoViewer> {
  int pageIndex = 0;

  @override
  void initState() {
    super.initState();
    locator<AppVideoController>().initializeVideo(widget.url[pageIndex]);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // 이미지 영역
        Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.width + 20,
              child: PageView.builder(
                itemCount: widget.url.length,
                onPageChanged: (value) {
                  setState(() {
                    pageIndex = value;
                  });
                },
                itemBuilder: (context, pageIndex) {
                  return locator<AppVideoController>()
                          .controller!
                          .value
                          .isInitialized
                      ? AspectRatio(
                          aspectRatio: locator<AppVideoController>()
                              .controller!
                              .value
                              .aspectRatio,
                          child: VideoPlayer(
                            locator<AppVideoController>().controller!,
                          ),
                        )
                      : Container();
                },
              ),
            ),
            const SizedBox(height: 12),
            if (widget.url.length > 1)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  widget.url.length,
                  (dotIndex) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: Icon(
                      Icons.circle,
                      size: 16,
                      color: pageIndex == dotIndex
                          ? Colors.grey[600]
                          : Colors.grey[300],
                    ),
                  ),
                ),
              ),
          ],
        ),
      ],
    );
  }
}
