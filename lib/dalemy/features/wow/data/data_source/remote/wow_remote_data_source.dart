import 'package:ex_project/dalemy/features/wow/data/model/wow_board_model.dart';

// 원격 저장소와 통신하는 추상 인터페이스
// 함수 선언만 하고, 실제 함수 로직은 DataSourceImpl 구현체에서 구현된다.
abstract interface class WowRemoteDataSource {
  Future<List<WowBoardModel>> getWowBoards();
}
