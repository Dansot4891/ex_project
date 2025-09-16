import 'package:ex_project/core/module/error/result.dart';
import 'package:ex_project/core/module/exception/app_exception.dart';
import 'package:ex_project/injectable/data/model/injectable_test.dart';
import 'package:ex_project/injectable/domain/repository/injetable_test_repository.dart';
import 'package:injectable/injectable.dart';

// 하나의 기능을 담당하는 유스케이스
// 관련 feature의 Repository를 가져와 하나의 기능만을 담당한다.
// 공통적으로, 유스케이스내에서 try-catch 구문을 이용하여 에러를 잡는다.
@Injectable()
class GetInjectableTestsUseCase {
  final InjectableTestRepository _repo;

  GetInjectableTestsUseCase(this._repo);

  Future<Result<List<InjectableTest>>> execute() async {
    try {
      final resp = await _repo.getInjectableTests();
      return Result.success(resp);
    } catch (e) {
      return const Result.error(UnexpectedException());
    }
  }
}
