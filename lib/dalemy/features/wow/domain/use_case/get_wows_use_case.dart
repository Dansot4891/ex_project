import 'package:ex_project/dalemy/features/wow/domain/entity/wow_entity.dart';
import 'package:ex_project/dalemy/features/wow/domain/repository/wow_repository.dart';
import 'package:ex_project/core/module/error/result.dart';
import 'package:ex_project/core/module/exception/app_exception.dart';

// 하나의 기능을 담당하는 유스케이스
// 관련 feature의 Repository를 가져와 하나의 기능만을 담당한다.
// 공통적으로, 유스케이스내에서 try-catch 구문을 이용하여 에러를 잡는다.
class GetWowBoardsUseCase {
  final WowRepository _repo;

  GetWowBoardsUseCase(this._repo);

  Future<Result<List<WowBoardEntity>>> execute() async {
    try {
      final wowBoards = await _repo.getWowBoards();
      return Result.success(wowBoards);
    } catch (e) {
      return const Result.error(UnexpectedException());
    }
  }
}
