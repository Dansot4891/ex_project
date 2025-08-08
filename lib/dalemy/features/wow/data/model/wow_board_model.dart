import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

part 'wow_board_model.g.dart';

// JsonSerializable을 이용하여
// 직렬화 및 역직렬화 함수 구현
// 실제 내부 함수는 .g.dart 파일에 내장되어있음
//    => 변경 X
@JsonSerializable()
class WowBoardModel {
  final int wowId;
  final String username;
  final String userProfile;
  final List<String> url;
  final String content;
  final int likeCount;
  final int commentCount;
  final int viewCount;
  final bool isLike;
  final DateTime createdAt;
  final String? youtubeId;
  final bool isVideo;

  WowBoardModel({
    required this.wowId,
    required this.username,
    required this.userProfile,
    required this.url,
    required this.content,
    required this.likeCount,
    required this.commentCount,
    required this.viewCount,
    required this.isLike,
    required this.createdAt,
    required this.youtubeId,
    required this.isVideo,
  });

  factory WowBoardModel.fromJson(Map<String, dynamic> json) =>
      _$WowBoardModelFromJson(json);

  Map<String, dynamic> toJson() => _$WowBoardModelToJson(this);
}
