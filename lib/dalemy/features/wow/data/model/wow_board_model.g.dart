// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wow_board_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WowBoardModel _$WowBoardModelFromJson(Map<String, dynamic> json) =>
    WowBoardModel(
      wowId: (json['wowId'] as num).toInt(),
      username: json['username'] as String,
      userProfile: json['userProfile'] as String,
      url: (json['url'] as List<dynamic>).map((e) => e as String).toList(),
      content: json['content'] as String,
      likeCount: (json['likeCount'] as num).toInt(),
      commentCount: (json['commentCount'] as num).toInt(),
      viewCount: (json['viewCount'] as num).toInt(),
      isLike: json['isLike'] as bool,
      createdAt: DateTime.parse(json['createdAt'] as String),
      youtubeId: json['youtubeId'] as String?,
      isVideo: json['isVideo'] as bool,
    );

Map<String, dynamic> _$WowBoardModelToJson(WowBoardModel instance) =>
    <String, dynamic>{
      'wowId': instance.wowId,
      'username': instance.username,
      'userProfile': instance.userProfile,
      'url': instance.url,
      'content': instance.content,
      'likeCount': instance.likeCount,
      'commentCount': instance.commentCount,
      'viewCount': instance.viewCount,
      'isLike': instance.isLike,
      'createdAt': instance.createdAt.toIso8601String(),
      'youtubeId': instance.youtubeId,
      'isVideo': instance.isVideo,
    };
