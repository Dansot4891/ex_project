// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'injectable_test.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InjectableTest _$InjectableTestFromJson(Map<String, dynamic> json) =>
    InjectableTest(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      contents: json['contents'] as String,
      media: json['media'] as String,
      type: json['type'] as String,
    );

Map<String, dynamic> _$InjectableTestToJson(InjectableTest instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'contents': instance.contents,
      'media': instance.media,
      'type': instance.type,
    };

InjectableTestResponse<T> _$InjectableTestResponseFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) => InjectableTestResponse<T>(data: fromJsonT(json['data']));

Map<String, dynamic> _$InjectableTestResponseToJson<T>(
  InjectableTestResponse<T> instance,
  Object? Function(T value) toJsonT,
) => <String, dynamic>{'data': toJsonT(instance.data)};
