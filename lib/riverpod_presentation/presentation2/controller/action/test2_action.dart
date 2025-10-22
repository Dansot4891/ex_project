import 'package:freezed_annotation/freezed_annotation.dart';

part 'test2_action.freezed.dart';

@freezed
sealed class Test2Action with _$Test2Action {
  const factory Test2Action.like({required int id}) = Test2ActionLike;
  const factory Test2Action.search() = Test2ActionSearch;
}
