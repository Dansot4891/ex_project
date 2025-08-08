import 'package:ex_project/dalemy/features/wow/presentation/wow_board/controller/wow_action.dart';
import 'package:ex_project/dalemy/features/wow/presentation/wow_board/controller/wow_state.dart';
import 'package:ex_project/dalemy/features/wow/presentation/wow_board/widget/media/wow_board_media_viewer.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

class WowPage extends StatelessWidget {
  // 해당 뷰의 state
  final AsyncValue<WowState> state;
  // 해당 뷰에서 사용자가 가능한 Action
  final void Function(WowAction action) onAction;
  const WowPage({super.key, required this.state, required this.onAction});

  @override
  Widget build(BuildContext context) {
    // Riverpod 에서 제공해주는
    // AsyncValue의 when을 활용하여
    // 정상/에러/로딩 상태의 뷰를 처리
    return Scaffold(
      appBar: AppBar(
        title: const Text('와우보드'),
        actions: [
          Icon(Icons.favorite_outline),
          SizedBox(width: 12),
          Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey,
            ),
            child: Icon(Icons.add),
          ),
          SizedBox(width: 12),
        ],
      ),
      body: state.when(
        // 정상적으로 데이터가 로드됐을 때의 뷰
        data: (value) {
          return ListView.builder(
            itemCount: value.wowBoards.length,
            itemBuilder: (context, index) {
              final wowBoard = value.wowBoards[index];
              return Column(
                children: [
                  WowBoardMediaViewer(wowBoard: wowBoard),
                  Row(
                    children: [
                      Text(value.wowBoards[index].commentCount.toString()),
                      Text(value.wowBoards[index].content),
                    ],
                  ),
                ],
              );
            },
          );
        },
        // 에러가 발생했을 때의 뷰
        error: (err, stackTrace) {
          print(err);
          return Container();
        },
        // 로딩 상태일 때의 뷰
        loading: () {
          return const CircularProgressIndicator();
        },
      ),
    );
  }
}
