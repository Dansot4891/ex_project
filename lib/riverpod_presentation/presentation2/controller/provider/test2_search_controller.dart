import 'package:ex_project/core/module/error/result.dart';
import 'package:ex_project/riverpod_presentation/domain/entity/list_entity.dart';
import 'package:ex_project/riverpod_presentation/domain/use_case/test_use_case.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'test2_search_controller.g.dart';

@riverpod
class Test2SearchController extends _$Test2SearchController {
  final TextEditingController searchController = TextEditingController();
  final useCase = TestUseCase();

  @override
  TextEditingController build() {
    ref.onDispose(searchController.dispose);

    return searchController;
  }

  /// 검색
  Future<Result<List<ListEntity>>> search() async {
    await Future.delayed(const Duration(milliseconds: 300));
    final result = useCase.execute();
    return result;
  }
}
