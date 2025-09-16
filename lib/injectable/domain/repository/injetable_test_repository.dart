import 'package:ex_project/injectable/data/model/injectable_test.dart';

// Repository의 추상 인터페이스
// 함수 선언만 하고, 실제 함수 로직은 RepositoryImpl 구현체에서 구현된다.
abstract interface class InjectableTestRepository {
  Future<List<InjectableTest>> getInjectableTests();
}
