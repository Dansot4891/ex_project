// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'test2_action.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Test2Action {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Test2Action);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'Test2Action()';
}


}

/// @nodoc
class $Test2ActionCopyWith<$Res>  {
$Test2ActionCopyWith(Test2Action _, $Res Function(Test2Action) __);
}


/// Adds pattern-matching-related methods to [Test2Action].
extension Test2ActionPatterns on Test2Action {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( Test2ActionLike value)?  like,TResult Function( Test2ActionSearch value)?  search,required TResult orElse(),}){
final _that = this;
switch (_that) {
case Test2ActionLike() when like != null:
return like(_that);case Test2ActionSearch() when search != null:
return search(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( Test2ActionLike value)  like,required TResult Function( Test2ActionSearch value)  search,}){
final _that = this;
switch (_that) {
case Test2ActionLike():
return like(_that);case Test2ActionSearch():
return search(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( Test2ActionLike value)?  like,TResult? Function( Test2ActionSearch value)?  search,}){
final _that = this;
switch (_that) {
case Test2ActionLike() when like != null:
return like(_that);case Test2ActionSearch() when search != null:
return search(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( int id)?  like,TResult Function()?  search,required TResult orElse(),}) {final _that = this;
switch (_that) {
case Test2ActionLike() when like != null:
return like(_that.id);case Test2ActionSearch() when search != null:
return search();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( int id)  like,required TResult Function()  search,}) {final _that = this;
switch (_that) {
case Test2ActionLike():
return like(_that.id);case Test2ActionSearch():
return search();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( int id)?  like,TResult? Function()?  search,}) {final _that = this;
switch (_that) {
case Test2ActionLike() when like != null:
return like(_that.id);case Test2ActionSearch() when search != null:
return search();case _:
  return null;

}
}

}

/// @nodoc


class Test2ActionLike implements Test2Action {
  const Test2ActionLike({required this.id});
  

 final  int id;

/// Create a copy of Test2Action
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$Test2ActionLikeCopyWith<Test2ActionLike> get copyWith => _$Test2ActionLikeCopyWithImpl<Test2ActionLike>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Test2ActionLike&&(identical(other.id, id) || other.id == id));
}


@override
int get hashCode => Object.hash(runtimeType,id);

@override
String toString() {
  return 'Test2Action.like(id: $id)';
}


}

/// @nodoc
abstract mixin class $Test2ActionLikeCopyWith<$Res> implements $Test2ActionCopyWith<$Res> {
  factory $Test2ActionLikeCopyWith(Test2ActionLike value, $Res Function(Test2ActionLike) _then) = _$Test2ActionLikeCopyWithImpl;
@useResult
$Res call({
 int id
});




}
/// @nodoc
class _$Test2ActionLikeCopyWithImpl<$Res>
    implements $Test2ActionLikeCopyWith<$Res> {
  _$Test2ActionLikeCopyWithImpl(this._self, this._then);

  final Test2ActionLike _self;
  final $Res Function(Test2ActionLike) _then;

/// Create a copy of Test2Action
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? id = null,}) {
  return _then(Test2ActionLike(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class Test2ActionSearch implements Test2Action {
  const Test2ActionSearch();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Test2ActionSearch);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'Test2Action.search()';
}


}




// dart format on
