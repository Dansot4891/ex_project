import 'package:ex_project/dalemy/features/wow/data/data_source/remote/wow_remote_data_source.dart';
import 'package:ex_project/dalemy/features/wow/domain/entity/wow_entity.dart';
import 'package:ex_project/dalemy/features/wow/domain/repository/wow_repository.dart';

class WowRepositoryImpl implements WowRepository {
  final WowRemoteDataSource _dataSource;

  WowRepositoryImpl(this._dataSource);

  @override
  Future<List<WowBoardEntity>> getWowBoards() async {
    // final resp = await _dataSource.getWowBoards();
    // print(resp);
    // return resp.map((e) => e.toEntity()).toList();
    return [
      // 유튜브
      WowBoardEntity(
        wowId: 1,
        username: 'username',
        userProfile: 'user_profile',
        url: [],
        content: '유튜브 테스트',
        likeCount: 1,
        commentCount: 1,
        viewCount: 1,
        isLike: true,
        createdAt: DateTime.now(),
        youtubeId: 'jF6UhCX-Cuo',
        playCount: 0,
        isVideo: true,
      ),
      // 사진 1개
      WowBoardEntity(
        wowId: 4,
        username: 'username',
        userProfile: 'user_profile',
        url: [
          "https://img1.newsis.com/2014/12/26/NISI20141226_0010474727_web.jpg",
        ],
        content: '1개 사진 테스트',
        likeCount: 1,
        commentCount: 1,
        viewCount: 1,
        isLike: true,
        createdAt: DateTime.now(),
        youtubeId: '',
        playCount: 0,
        isVideo: false,
      ),
      // 사진 2개
      WowBoardEntity(
        wowId: 4,
        username: 'username',
        userProfile: 'user_profile',
        url: [
          "https:/"
              "/www.chosun.com/resizer/v2/QAJ2DPWSNNKZHBPDWHAE7BCIZY.jpg?auth=cbf4a90cc5b266fdfbdd12dc46159ec7f696f01907a88f311688e0095667d2a8&width=616",
          "https://img1.newsis.com/2014/12/26/NISI20141226_0010474727_web.jpg",
        ],
        content: '2개 사진 테스트',
        likeCount: 1,
        commentCount: 1,
        viewCount: 1,
        isLike: true,
        createdAt: DateTime.now(),
        youtubeId: '',
        playCount: 0,
        isVideo: false,
      ),
      // 비디오 1개
      WowBoardEntity(
        wowId: 2,
        username: 'username',
        userProfile: 'user_profile',
        url: [
          "https://ddalemy.synology.me:8072/media/write_video_files/optimized_video_DN250000006_20250630_100526.mp4",
        ],
        content: '1개 비디오 테스트',
        likeCount: 1,
        commentCount: 1,
        viewCount: 1,
        isLike: true,
        createdAt: DateTime.now(),
        youtubeId: '',
        playCount: 0,
        isVideo: true,
      ),
      // 비디오 2개
      WowBoardEntity(
        wowId: 3,
        username: 'username',
        userProfile: 'user_profile',
        url: [
          "https://ddalemy.synology.me:8072/media/write_video_files/optimized_video_DN250000006_20250630_100526.mp4",
          "https://ddalemy.synology.me:8072/media/write_video_files/optimized_video_DN250000006_20250630_100526.mp4",
        ],
        content: '2개 비디오 테스트',
        likeCount: 1,
        commentCount: 1,
        viewCount: 1,
        isLike: true,
        createdAt: DateTime.now(),
        youtubeId: '',
        playCount: 0,
        isVideo: true,
      ),
      // 아무것도 없음
      WowBoardEntity(
        wowId: 4,
        username: 'username',
        userProfile: 'user_profile',
        url: [],
        content: '아무것도 없음',
        likeCount: 1,
        commentCount: 1,
        viewCount: 1,
        isLike: true,
        createdAt: DateTime.now(),
        youtubeId: '',
        playCount: 0,
        isVideo: false,
      ),
    ];
  }
}
