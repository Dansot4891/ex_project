import 'package:ex_project/riverpod_presentation/presentation2/controller/event/test2_event.dart';
import 'package:ex_project/riverpod_presentation/presentation2/controller/provider/test2_controller.dart';
import 'package:ex_project/riverpod_presentation/presentation2/widgets/list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Test2List extends ConsumerWidget with Test2Event {
  const Test2List({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(test2ControllerProvider);
    return state.when(
      data: (data) {
        return Expanded(
          child: ListView.separated(
            shrinkWrap: true,
            itemCount: data.items.length,
            itemBuilder: (context, index) {
              final item = data.items[index];
              return ListItem(
                profileUrl: item.profileUrl,
                name: item.name,
                content: item.content,
                likeStatus: item.likeStatus,
                likeCount: item.likeCount,
                commentCount: item.commentCount,
                like: () => like(ref, id: item.id),
              );
            },
            separatorBuilder: (context, index) => const SizedBox(height: 16),
          ),
        );
      },
      error: (error, stackTrace) => const Text('Error'),
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }
}
