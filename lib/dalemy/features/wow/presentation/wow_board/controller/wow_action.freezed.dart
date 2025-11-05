// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'wow_action.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$WowAction {

 int get wow_id;
/// Create a copy of WowAction
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WowActionCopyWith<WowAction> get copyWith => _$WowActionCopyWithImpl<WowAction>(this as WowAction, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WowAction&&(identical(other.wow_id, wow_id) || other.wow_id == wow_id));
}


@override
int get hashCode => Object.hash(runtimeType,wow_id);

@override
String toString() {
  return 'WowAction(wow_id: $wow_id)';
}


}

/// @nodoc
abstract mixin class $WowActionCopyWith<$Res>  {
  factory $WowActionCopyWith(WowAction value, $Res Function(WowAction) _then) = _$WowActionCopyWithImpl;
@useResult
$Res call({
 int wow_id
});




}
/// @nodoc
class _$WowActionCopyWithImpl<$Res>
    implements $WowActionCopyWith<$Res> {
  _$WowActionCopyWithImpl(this._self, this._then);

  final WowAction _self;
  final $Res Function(WowAction) _then;

/// Create a copy of WowAction
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? wow_id = null,}) {
  return _then(_self.copyWith(
wow_id: null == wow_id ? _self.wow_id : wow_id // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [WowAction].
extension WowActionPatterns on WowAction {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( TapCommentBox value)?  tapCommentBox,required TResult orElse(),}){
final _that = this;
switch (_that) {
case TapCommentBox() when tapCommentBox != null:
return tapCommentBox(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( TapCommentBox value)  tapCommentBox,}){
final _that = this;
switch (_that) {
case TapCommentBox():
return tapCommentBox(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( TapCommentBox value)?  tapCommentBox,}){
final _that = this;
switch (_that) {
case TapCommentBox() when tapCommentBox != null:
return tapCommentBox(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( int wow_id)?  tapCommentBox,required TResult orElse(),}) {final _that = this;
switch (_that) {
case TapCommentBox() when tapCommentBox != null:
return tapCommentBox(_that.wow_id);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( int wow_id)  tapCommentBox,}) {final _that = this;
switch (_that) {
case TapCommentBox():
return tapCommentBox(_that.wow_id);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( int wow_id)?  tapCommentBox,}) {final _that = this;
switch (_that) {
case TapCommentBox() when tapCommentBox != null:
return tapCommentBox(_that.wow_id);case _:
  return null;

}
}

}

/// @nodoc


class TapCommentBox implements WowAction {
  const TapCommentBox(this.wow_id);
  

@override final  int wow_id;

/// Create a copy of WowAction
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TapCommentBoxCopyWith<TapCommentBox> get copyWith => _$TapCommentBoxCopyWithImpl<TapCommentBox>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TapCommentBox&&(identical(other.wow_id, wow_id) || other.wow_id == wow_id));
}


@override
int get hashCode => Object.hash(runtimeType,wow_id);

@override
String toString() {
  return 'WowAction.tapCommentBox(wow_id: $wow_id)';
}


}

/// @nodoc
abstract mixin class $TapCommentBoxCopyWith<$Res> implements $WowActionCopyWith<$Res> {
  factory $TapCommentBoxCopyWith(TapCommentBox value, $Res Function(TapCommentBox) _then) = _$TapCommentBoxCopyWithImpl;
@override @useResult
$Res call({
 int wow_id
});




}
/// @nodoc
class _$TapCommentBoxCopyWithImpl<$Res>
    implements $TapCommentBoxCopyWith<$Res> {
  _$TapCommentBoxCopyWithImpl(this._self, this._then);

  final TapCommentBox _self;
  final $Res Function(TapCommentBox) _then;

/// Create a copy of WowAction
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? wow_id = null,}) {
  return _then(TapCommentBox(
null == wow_id ? _self.wow_id : wow_id // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
