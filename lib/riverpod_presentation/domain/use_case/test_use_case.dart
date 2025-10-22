import 'package:ex_project/core/module/error/result.dart';
import 'package:ex_project/riverpod_presentation/domain/entity/list_entity.dart';

class TestUseCase {
  Future<Result<List<ListEntity>>> execute() async {
    await Future.delayed(const Duration(seconds: 1));
    return Result.success([
      ListEntity(
        id: 1,
        name: '김민지',
        content: '오늘 날씨 너무 좋네요! 산책하기 딱 좋은 날이에요 🌤️',
        profileUrl: 'https://i.pravatar.cc/150?img=1',
        likeStatus: false,
        likeCount: 24,
        commentCount: 5,
      ),
      ListEntity(
        id: 2,
        name: 'John Smith',
        content:
            'Just finished my new project! Check it out on my portfolio 💻',
        profileUrl: '',
        likeStatus: true,
        likeCount: 156,
        commentCount: 23,
      ),
      ListEntity(
        id: 3,
        name: '박지훈',
        content: '점심 메뉴 추천받습니다... 매일 고민이네요 😅',
        profileUrl: '2',
        likeStatus: false,
        likeCount: 8,
        commentCount: 12,
      ),
      ListEntity(
        id: 4,
        name: 'Sarah Johnson',
        content: 'Amazing sunset at the beach today! 🌅 #blessed #nature',
        profileUrl: 'https://i.pravatar.cc/150?img=5',
        likeStatus: true,
        likeCount: 342,
        commentCount: 47,
      ),
      ListEntity(
        id: 5,
        name: '이서연',
        content: '새로 오픈한 카페 다녀왔는데 분위기 대박이에요! 디저트도 맛있고 ☕️🍰',
        profileUrl: 'https://i.pravatar.cc/150?img=9',
        likeStatus: false,
        likeCount: 67,
        commentCount: 18,
      ),
      ListEntity(
        id: 6,
        name: 'Alex Chen',
        content:
            'Finally got my hands on the new iPhone! The camera quality is insane 📱',
        profileUrl: 'https://i.pravatar.cc/150?img=14',
        likeStatus: true,
        likeCount: 203,
        commentCount: 31,
      ),
      ListEntity(
        id: 7,
        name: '최유진',
        content: '주말에 부산 여행 갈 건데 맛집 추천 부탁드려요!',
        profileUrl: 'https://i.pravatar.cc/150?img=20',
        likeStatus: false,
        likeCount: 15,
        commentCount: 28,
      ),
      ListEntity(
        id: 8,
        name: 'Mike Brown',
        content:
            'Gym session done ✅ Feeling stronger every day 💪 #fitness #motivation',
        profileUrl: 'https://i.pravatar.cc/150?img=11',
        likeStatus: true,
        likeCount: 89,
        commentCount: 9,
      ),
      ListEntity(
        id: 9,
        name: '강하늘',
        content: '오랜만에 영화 보러 왔는데 꿀잼이네요 ㅋㅋ 추천합니다 🎬',
        profileUrl: 'https://i.pravatar.cc/150?img=52',
        likeStatus: false,
        likeCount: 41,
        commentCount: 7,
      ),
      ListEntity(
        id: 10,
        name: 'Emma Watson',
        content:
            'Reading is still the best way to escape reality 📚✨ What are you reading?',
        profileUrl: 'https://i.pravatar.cc/150?img=45',
        likeStatus: true,
        likeCount: 521,
        commentCount: 64,
      ),
      ListEntity(
        id: 11,
        name: '정민호',
        content: '코딩하다가 막혀서 3시간 날렸는데 오타였음... 🤦‍♂️',
        profileUrl: 'https://i.pravatar.cc/150?img=60',
        likeStatus: false,
        likeCount: 127,
        commentCount: 35,
      ),
      ListEntity(
        id: 12,
        name: 'Lisa Park',
        content: 'Homemade pasta for dinner tonight! 🍝👩‍🍳 Recipe in my bio!',
        profileUrl: 'https://i.pravatar.cc/150?img=32',
        likeStatus: true,
        likeCount: 294,
        commentCount: 42,
      ),
    ]);
  }
}
