import 'package:ex_project/core/module/error/result.dart';
import 'package:ex_project/riverpod_presentation/domain/entity/list_entity.dart';
import 'package:ex_project/riverpod_presentation/domain/use_case/test_use_case.dart';
import 'package:ex_project/riverpod_presentation/presentation2/controller/view_state/test_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'test2_controller.g.dart';

@riverpod
class Test2Controller extends _$Test2Controller {
  final useCase = TestUseCase();

  @override
  Future<Test2State> build() async {
    await Future.delayed(const Duration(seconds: 3));
    final resp = await useCase.execute();

    switch (resp) {
      case Success(data: final data):
        return Test2State(items: data);
      case Error(error: final error):
        state = AsyncError(error, StackTrace.current);
        throw error;
    }
  }

  /// 검색
  Future<void> search(Future<Result<List<ListEntity>>> items) async {
    state = const AsyncLoading();

    final result = await items;
    switch (result) {
      case Success(data: final data):
        state = AsyncData(Test2State(items: data));
      case Error(error: final error):
        state = AsyncError(error, StackTrace.current);
    }
  }

  /// 좋아요 버튼 클릭
  Future<void> like(int id) async {
    final pState = state.value;
    if (pState == null) return;

    await Future.delayed(const Duration(milliseconds: 300));
    state = AsyncValue.data(
      pState.copyWith(
        items: pState.items
            .map(
              (element) => element.id == id
                  ? element.copyWith(likeStatus: !element.likeStatus)
                  : element,
            )
            .toList(),
      ),
    );
  }
}
