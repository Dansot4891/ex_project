import 'package:ex_project/dalemy/features/wow/data/model/wow_board_model.dart';
import 'package:ex_project/dalemy/features/wow/domain/entity/wow_entity.dart';

// Model 을 Entity로 변환해주는
// Model의 Extension
// ⚠️ 서버로 요청을 보낼 때는
//    Entity를 Model로 변환하기도 한다.
extension WowBoardModelMapper on WowBoardModel {
  WowBoardEntity toEntity() {
    return WowBoardEntity(
      wowId: wowId,
      username: username,
      userProfile: userProfile,
      url: url,
      content: content,
      likeCount: likeCount,
      commentCount: commentCount,
      viewCount: viewCount,
      isLike: isLike,
      createdAt: createdAt,
      youtubeId: youtubeId ?? '',
      playCount: 0,
      isVideo: isVideo,
    );
  }
}
