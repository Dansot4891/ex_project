import 'package:freezed_annotation/freezed_annotation.dart';

part 'wow_action.freezed.dart';

// Todo 화면에서 이루어지는 사용자 액션을 설정하는 sealed class
@freezed
sealed class WowAction with _$WowAction {
  const factory WowAction.tapCommentBox(int wow_id) = TapCommentBox;
}
