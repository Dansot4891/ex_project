import 'package:ex_project/injectable/data/data_source/remote/injectable_test_remote_data_source.dart';
import 'package:ex_project/injectable/data/model/injectable_test.dart';
import 'package:ex_project/injectable/domain/repository/injetable_test_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: InjectableTestRepository)
class InjectableTestRepositoryImpl implements InjectableTestRepository {
  final InjectableTestRemoteDataSource _dataSource;

  InjectableTestRepositoryImpl(this._dataSource);

  @override
  Future<List<InjectableTest>> getInjectableTests() async {
    return _dataSource.getInjectableTests().then((value) => value.data);
  }
}
