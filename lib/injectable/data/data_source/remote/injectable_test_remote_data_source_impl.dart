import 'package:dio/dio.dart' hide Headers;
import 'package:ex_project/injectable/data/data_source/remote/injectable_test_remote_data_source.dart';
import 'package:ex_project/injectable/data/model/injectable_test.dart';
import 'package:retrofit/retrofit.dart';

part 'injectable_test_remote_data_source_impl.g.dart';

// 원격 저장소와 통신하는 실제 구현체 객체
// 실제 로컬 저장소와 통신하는 로직을 구현한다.
// => 실제 내부 코드는 'Retrofit'이라는 패키지가 대신해서 구현을 해준다.
//    => 해당 코드 내용도 .g.dart 파일에서 구현되어있다.
@RestApi(baseUrl: 'https://ddalemy.synology.me:8072/api')
abstract class InjectableTestRemoteDataSourceImpl
    implements InjectableTestRemoteDataSource {
  factory InjectableTestRemoteDataSourceImpl(Dio dio) =
      _InjectableTestRemoteDataSourceImpl;

  // ---------------- cards ----------------
  @override
  @GET('/tutor/list/')
  @Headers({
    'Authorization':
        'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzU3NzI2Mzg2LCJpYXQiOjE3NTc1NzIwNTMsImp0aSI6IjRhZWQ0MGFmNTdhMzQyZTZiOGFkZjdkNWQyNTdhNzY1IiwidXNlcl9pZCI6MTU5fQ.yXDPEdiM-VGWLoNSygV-mpjCCbONPAYQ2cCbzBHdbbQ',
  })
  Future<InjectableTestResponse<List<InjectableTest>>> getInjectableTests();
}
