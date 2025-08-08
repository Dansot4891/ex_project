// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ex_project/core/module/media/enum/media_enum.dart';
import 'package:flutter/foundation.dart';

class WowBoardEntity {
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
  final int playCount;
  final bool isVideo;

  WowBoardEntity({
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
    required this.playCount,
    required this.isVideo,
  });

  @override
  String toString() {
    return 'WowBoardEntity(wowId: $wowId, username: $username, userProfile: $userProfile, url: $url, content: $content, likeCount: $likeCount, commentCount: $commentCount, viewCount: $viewCount, isLike: $isLike, createdAt: $createdAt, youtubeId: $youtubeId, playCount: $playCount, isVideo: $isVideo)';
  }

  @override
  bool operator ==(covariant WowBoardEntity other) {
    if (identical(this, other)) return true;

    return other.wowId == wowId &&
        other.username == username &&
        other.userProfile == userProfile &&
        listEquals(other.url, url) &&
        other.content == content &&
        other.likeCount == likeCount &&
        other.commentCount == commentCount &&
        other.viewCount == viewCount &&
        other.isLike == isLike &&
        other.createdAt == createdAt &&
        other.youtubeId == youtubeId &&
        other.playCount == playCount &&
        other.isVideo == isVideo;
  }

  @override
  int get hashCode {
    return wowId.hashCode ^
        username.hashCode ^
        userProfile.hashCode ^
        url.hashCode ^
        content.hashCode ^
        likeCount.hashCode ^
        commentCount.hashCode ^
        viewCount.hashCode ^
        isLike.hashCode ^
        createdAt.hashCode ^
        youtubeId.hashCode ^
        playCount.hashCode ^
        isVideo.hashCode;
  }

  WowBoardEntity copyWith({
    int? wowId,
    String? username,
    String? userProfile,
    List<String>? url,
    String? content,
    int? likeCount,
    int? commentCount,
    int? viewCount,
    bool? isLike,
    DateTime? createdAt,
    String? youtubeId,
    int? playCount,
    bool? isVideo,
  }) {
    return WowBoardEntity(
      wowId: wowId ?? this.wowId,
      username: username ?? this.username,
      userProfile: userProfile ?? this.userProfile,
      url: url ?? this.url,
      content: content ?? this.content,
      likeCount: likeCount ?? this.likeCount,
      commentCount: commentCount ?? this.commentCount,
      viewCount: viewCount ?? this.viewCount,
      isLike: isLike ?? this.isLike,
      createdAt: createdAt ?? this.createdAt,
      youtubeId: youtubeId ?? this.youtubeId,
      playCount: playCount ?? this.playCount,
      isVideo: isVideo ?? this.isVideo,
    );
  }

  MediaType get mediaType {
    // YouTube: videoId가 비어있지 않으면 YouTube
    if (youtubeId != null && youtubeId!.isNotEmpty) {
      return MediaType.youtube;
    }

    // URL이 있는 경우
    if (url.isNotEmpty) {
      // 동영상: isVideo가 true이고 URL에 데이터가 있으면 동영상
      if (isVideo) {
        return MediaType.video;
      }
      // 사진: isVideo가 false이고 URL에 데이터가 있으면 사진
      else {
        return MediaType.image;
      }
    }

    // 그 외의 경우는 일반
    return MediaType.none;
  }
}
