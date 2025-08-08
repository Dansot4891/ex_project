import 'package:ex_project/dalemy/features/wow/presentation/wow_board/controller/wow_event.dart';
import 'package:ex_project/dalemy/features/wow/presentation/wow_board/controller/wow_action.dart';
import 'package:ex_project/dalemy/features/wow/presentation/wow_board/controller/wow_provider.dart';
import 'package:ex_project/dalemy/features/wow/presentation/wow_board/page/wow_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Todo Page에서 사용되는
// 사용자 액션과 해당 뷰의 state를 할당시켜주는 root page
class WowPageRoot extends ConsumerWidget with WowEvent {
  const WowPageRoot({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(wowProviderProvider);
    // print(state);
    return WowPage(
      state: state,
      onAction: (action) => actionHandling(ref, context, action: action),
    );
  }

  // 사용자 액션 핸들링
  // 자유롭게 추가 가능
  void actionHandling(
    WidgetRef ref,
    BuildContext context, {
    required WowAction action,
  }) async {
    final provider = ref.read(wowProviderProvider.notifier);
    switch (action) {
      case TapCommentBox(:final wow_id):
        wowShowBottomSheet(context, 'bottom sheet');
    }
  }
}
