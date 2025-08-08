import 'package:ex_project/core/module/media/enum/media_enum.dart';
import 'package:ex_project/dalemy/features/wow/domain/entity/wow_entity.dart';
import 'package:ex_project/dalemy/features/wow/presentation/wow_board/widget/media/wow_board_image_viewer.dart';
import 'package:ex_project/dalemy/features/wow/presentation/wow_board/widget/media/wow_board_video_viewer.dart';
import 'package:ex_project/dalemy/features/wow/presentation/wow_board/widget/media/wow_board_youtube_viewer.dart';
import 'package:flutter/material.dart';

class WowBoardMediaViewer extends StatelessWidget {
  final WowBoardEntity wowBoard;
  const WowBoardMediaViewer({super.key, required this.wowBoard});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        switch (wowBoard.mediaType) {
          MediaType.youtube => WowBoardYoutubeViewer(
            youtubeId: wowBoard.youtubeId!,
          ),
          MediaType.video => WowBoardVideoViewer(url: wowBoard.url),
          MediaType.image => WowBoardImageViewer(url: wowBoard.url),
          MediaType.none => const SizedBox(child: Text('아무것도 아님')),
        },
        //
        Row(
          children: [
            Text(wowBoard.commentCount.toString()),
            Text(wowBoard.content),
          ],
        ),
      ],
    );
  }
}
