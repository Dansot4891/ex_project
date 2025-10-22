import 'package:ex_project/riverpod_presentation/presentation2/controller/provider/test2_controller.dart';
import 'package:ex_project/riverpod_presentation/presentation2/controller/provider/test2_search_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

mixin Test2Event {
  /// 좋아요 버튼 클릭
  void like(WidgetRef ref, {required int id}) {
    ref.read(test2ControllerProvider.notifier).like(id);
  }

  /// 검색
  void search(WidgetRef ref) async {
    final context = ref.context;
    final listState = ref.watch(test2ControllerProvider);
    if (listState is AsyncLoading) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('로딩중입니다.')));
      return;
    }
    final result = ref.read(test2SearchControllerProvider.notifier).search();
    await ref.read(test2ControllerProvider.notifier).search(result);
  }
}
