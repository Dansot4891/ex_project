import 'package:ex_project/dalemy/features/wow/domain/entity/wow_entity.dart';

// Repository의 추상 인터페이스
// 함수 선언만 하고, 실제 함수 로직은 RepositoryImpl 구현체에서 구현된다.
abstract interface class WowRepository {
  Future<List<WowBoardEntity>> getWowBoards();
}
