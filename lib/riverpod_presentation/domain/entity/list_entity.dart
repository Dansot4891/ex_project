class ListEntity {
  final int id;
  final String name;
  final String content;
  final String profileUrl;
  final bool likeStatus;
  final int likeCount;
  final int commentCount;

  ListEntity({
    required this.id,
    required this.name,
    required this.content,
    required this.profileUrl,
    required this.likeStatus,
    required this.likeCount,
    required this.commentCount,
  });

  ListEntity copyWith({
    int? id,
    String? name,
    String? content,
    String? profileUrl,
    bool? likeStatus,
    int? likeCount,
    int? commentCount,
  }) {
    return ListEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      content: content ?? this.content,
      profileUrl: profileUrl ?? this.profileUrl,
      likeStatus: likeStatus ?? this.likeStatus,
      likeCount: likeCount ?? this.likeCount,
      commentCount: commentCount ?? this.commentCount,
    );
  }

  @override
  bool operator ==(covariant ListEntity other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.content == content &&
        other.profileUrl == profileUrl &&
        other.likeStatus == likeStatus &&
        other.likeCount == likeCount &&
        other.commentCount == commentCount;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        content.hashCode ^
        profileUrl.hashCode ^
        likeStatus.hashCode ^
        likeCount.hashCode ^
        commentCount.hashCode;
  }

  @override
  String toString() {
    return 'ListEntity(id: $id, name: $name, content: $content, profileUrl: $profileUrl, likeStatus: $likeStatus, likeCount: $likeCount, commentCount: $commentCount)';
  }
}
