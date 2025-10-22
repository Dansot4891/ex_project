// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'test2_action.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$Test2Action {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int id) like,
    required TResult Function() search,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int id)? like,
    TResult? Function()? search,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int id)? like,
    TResult Function()? search,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Test2ActionLike value) like,
    required TResult Function(Test2ActionSearch value) search,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Test2ActionLike value)? like,
    TResult? Function(Test2ActionSearch value)? search,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Test2ActionLike value)? like,
    TResult Function(Test2ActionSearch value)? search,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $Test2ActionCopyWith<$Res> {
  factory $Test2ActionCopyWith(
    Test2Action value,
    $Res Function(Test2Action) then,
  ) = _$Test2ActionCopyWithImpl<$Res, Test2Action>;
}

/// @nodoc
class _$Test2ActionCopyWithImpl<$Res, $Val extends Test2Action>
    implements $Test2ActionCopyWith<$Res> {
  _$Test2ActionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Test2Action
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$Test2ActionLikeImplCopyWith<$Res> {
  factory _$$Test2ActionLikeImplCopyWith(
    _$Test2ActionLikeImpl value,
    $Res Function(_$Test2ActionLikeImpl) then,
  ) = __$$Test2ActionLikeImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int id});
}

/// @nodoc
class __$$Test2ActionLikeImplCopyWithImpl<$Res>
    extends _$Test2ActionCopyWithImpl<$Res, _$Test2ActionLikeImpl>
    implements _$$Test2ActionLikeImplCopyWith<$Res> {
  __$$Test2ActionLikeImplCopyWithImpl(
    _$Test2ActionLikeImpl _value,
    $Res Function(_$Test2ActionLikeImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Test2Action
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? id = null}) {
    return _then(
      _$Test2ActionLikeImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc

class _$Test2ActionLikeImpl implements Test2ActionLike {
  const _$Test2ActionLikeImpl({required this.id});

  @override
  final int id;

  @override
  String toString() {
    return 'Test2Action.like(id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Test2ActionLikeImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  /// Create a copy of Test2Action
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$Test2ActionLikeImplCopyWith<_$Test2ActionLikeImpl> get copyWith =>
      __$$Test2ActionLikeImplCopyWithImpl<_$Test2ActionLikeImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int id) like,
    required TResult Function() search,
  }) {
    return like(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int id)? like,
    TResult? Function()? search,
  }) {
    return like?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int id)? like,
    TResult Function()? search,
    required TResult orElse(),
  }) {
    if (like != null) {
      return like(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Test2ActionLike value) like,
    required TResult Function(Test2ActionSearch value) search,
  }) {
    return like(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Test2ActionLike value)? like,
    TResult? Function(Test2ActionSearch value)? search,
  }) {
    return like?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Test2ActionLike value)? like,
    TResult Function(Test2ActionSearch value)? search,
    required TResult orElse(),
  }) {
    if (like != null) {
      return like(this);
    }
    return orElse();
  }
}

abstract class Test2ActionLike implements Test2Action {
  const factory Test2ActionLike({required final int id}) =
      _$Test2ActionLikeImpl;

  int get id;

  /// Create a copy of Test2Action
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$Test2ActionLikeImplCopyWith<_$Test2ActionLikeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$Test2ActionSearchImplCopyWith<$Res> {
  factory _$$Test2ActionSearchImplCopyWith(
    _$Test2ActionSearchImpl value,
    $Res Function(_$Test2ActionSearchImpl) then,
  ) = __$$Test2ActionSearchImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$Test2ActionSearchImplCopyWithImpl<$Res>
    extends _$Test2ActionCopyWithImpl<$Res, _$Test2ActionSearchImpl>
    implements _$$Test2ActionSearchImplCopyWith<$Res> {
  __$$Test2ActionSearchImplCopyWithImpl(
    _$Test2ActionSearchImpl _value,
    $Res Function(_$Test2ActionSearchImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Test2Action
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$Test2ActionSearchImpl implements Test2ActionSearch {
  const _$Test2ActionSearchImpl();

  @override
  String toString() {
    return 'Test2Action.search()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$Test2ActionSearchImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int id) like,
    required TResult Function() search,
  }) {
    return search();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int id)? like,
    TResult? Function()? search,
  }) {
    return search?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int id)? like,
    TResult Function()? search,
    required TResult orElse(),
  }) {
    if (search != null) {
      return search();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Test2ActionLike value) like,
    required TResult Function(Test2ActionSearch value) search,
  }) {
    return search(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Test2ActionLike value)? like,
    TResult? Function(Test2ActionSearch value)? search,
  }) {
    return search?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Test2ActionLike value)? like,
    TResult Function(Test2ActionSearch value)? search,
    required TResult orElse(),
  }) {
    if (search != null) {
      return search(this);
    }
    return orElse();
  }
}

abstract class Test2ActionSearch implements Test2Action {
  const factory Test2ActionSearch() = _$Test2ActionSearchImpl;
}
