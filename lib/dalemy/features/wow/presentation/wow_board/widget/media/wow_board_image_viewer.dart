import 'package:flutter/material.dart';

/// 와우보드 이미지 위젯
///
/// 여러 이미지를 PageView로 표시하고 하단에 페이지 인디케이터를 제공하는 위젯입니다.
/// StatefulWidget으로 구성하여 페이지 변경 시 해당 위젯만 재빌드되도록 최적화했습니다.
///
/// [url] - 표시할 이미지 URL 리스트
///
/// 특징:
/// - PageView.builder를 사용하여 이미지를 페이지별로 표시
/// - 현재 페이지를 나타내는 점 인디케이터 (이미지가 2개 이상일 때만 표시)
/// - 화면 너비에 맞춰 정사각형 형태로 이미지 표시
/// - BoxFit.cover로 이미지 비율 유지하며 화면에 맞춤
class WowBoardImageViewer extends StatefulWidget {
  final List<String> url;

  const WowBoardImageViewer({super.key, required this.url});

  @override
  State<WowBoardImageViewer> createState() => _WowBoardImageState();
}

class _WowBoardImageState extends State<WowBoardImageViewer> {
  int pageIndex = 0;

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
                  return Image.network(
                    widget.url[pageIndex],
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover,
                  );
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
