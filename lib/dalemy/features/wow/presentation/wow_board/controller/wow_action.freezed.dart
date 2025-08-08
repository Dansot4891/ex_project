// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'wow_action.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$WowAction {
  int get wow_id => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int wow_id) tapCommentBox,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int wow_id)? tapCommentBox,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int wow_id)? tapCommentBox,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TapCommentBox value) tapCommentBox,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TapCommentBox value)? tapCommentBox,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TapCommentBox value)? tapCommentBox,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;

  /// Create a copy of WowAction
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WowActionCopyWith<WowAction> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WowActionCopyWith<$Res> {
  factory $WowActionCopyWith(WowAction value, $Res Function(WowAction) then) =
      _$WowActionCopyWithImpl<$Res, WowAction>;
  @useResult
  $Res call({int wow_id});
}

/// @nodoc
class _$WowActionCopyWithImpl<$Res, $Val extends WowAction>
    implements $WowActionCopyWith<$Res> {
  _$WowActionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WowAction
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? wow_id = null}) {
    return _then(
      _value.copyWith(
            wow_id: null == wow_id
                ? _value.wow_id
                : wow_id // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$TapCommentBoxImplCopyWith<$Res>
    implements $WowActionCopyWith<$Res> {
  factory _$$TapCommentBoxImplCopyWith(
    _$TapCommentBoxImpl value,
    $Res Function(_$TapCommentBoxImpl) then,
  ) = __$$TapCommentBoxImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int wow_id});
}

/// @nodoc
class __$$TapCommentBoxImplCopyWithImpl<$Res>
    extends _$WowActionCopyWithImpl<$Res, _$TapCommentBoxImpl>
    implements _$$TapCommentBoxImplCopyWith<$Res> {
  __$$TapCommentBoxImplCopyWithImpl(
    _$TapCommentBoxImpl _value,
    $Res Function(_$TapCommentBoxImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of WowAction
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? wow_id = null}) {
    return _then(
      _$TapCommentBoxImpl(
        null == wow_id
            ? _value.wow_id
            : wow_id // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc

class _$TapCommentBoxImpl implements TapCommentBox {
  const _$TapCommentBoxImpl(this.wow_id);

  @override
  final int wow_id;

  @override
  String toString() {
    return 'WowAction.tapCommentBox(wow_id: $wow_id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TapCommentBoxImpl &&
            (identical(other.wow_id, wow_id) || other.wow_id == wow_id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, wow_id);

  /// Create a copy of WowAction
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TapCommentBoxImplCopyWith<_$TapCommentBoxImpl> get copyWith =>
      __$$TapCommentBoxImplCopyWithImpl<_$TapCommentBoxImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int wow_id) tapCommentBox,
  }) {
    return tapCommentBox(wow_id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int wow_id)? tapCommentBox,
  }) {
    return tapCommentBox?.call(wow_id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int wow_id)? tapCommentBox,
    required TResult orElse(),
  }) {
    if (tapCommentBox != null) {
      return tapCommentBox(wow_id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TapCommentBox value) tapCommentBox,
  }) {
    return tapCommentBox(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TapCommentBox value)? tapCommentBox,
  }) {
    return tapCommentBox?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TapCommentBox value)? tapCommentBox,
    required TResult orElse(),
  }) {
    if (tapCommentBox != null) {
      return tapCommentBox(this);
    }
    return orElse();
  }
}

abstract class TapCommentBox implements WowAction {
  const factory TapCommentBox(final int wow_id) = _$TapCommentBoxImpl;

  @override
  int get wow_id;

  /// Create a copy of WowAction
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TapCommentBoxImplCopyWith<_$TapCommentBoxImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
