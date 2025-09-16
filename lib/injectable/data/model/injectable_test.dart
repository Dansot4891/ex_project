import 'package:json_annotation/json_annotation.dart';

part 'injectable_test.g.dart';

@JsonSerializable()
class InjectableTest {
  final int id;
  final String title;
  final String contents;
  final String media;
  final String type;

  InjectableTest({
    required this.id,
    required this.title,
    required this.contents,
    required this.media,
    required this.type,
  });

  factory InjectableTest.fromJson(Map<String, dynamic> json) =>
      _$InjectableTestFromJson(json);

  Map<String, dynamic> toJson() => _$InjectableTestToJson(this);
}

@JsonSerializable(genericArgumentFactories: true)
class InjectableTestResponse<T> {
  final T data;

  InjectableTestResponse({required this.data});

  factory InjectableTestResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object?) fromJsonT,
  ) => _$InjectableTestResponseFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(Object Function(T) toJsonT) =>
      _$InjectableTestResponseToJson(this, toJsonT);
}
