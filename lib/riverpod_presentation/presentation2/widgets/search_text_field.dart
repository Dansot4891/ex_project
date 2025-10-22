import 'package:ex_project/riverpod_presentation/presentation2/controller/event/test2_event.dart';
import 'package:ex_project/riverpod_presentation/presentation2/controller/provider/test2_search_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchTextField extends ConsumerWidget with Test2Event {
  const SearchTextField({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchController = ref.watch(test2SearchControllerProvider);
    return TextField(
      controller: searchController,
      decoration: InputDecoration(
        hintText: '검색',
        suffixIcon: IconButton(
          onPressed: () {
            search(ref);
          },
          icon: const Icon(Icons.search),
        ),
      ),
    );
  }
}
