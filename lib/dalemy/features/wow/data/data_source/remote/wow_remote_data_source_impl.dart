import 'package:dio/dio.dart' hide Headers;
import 'package:ex_project/dalemy/features/wow/data/data_source/remote/wow_remote_data_source.dart';
import 'package:ex_project/dalemy/features/wow/data/model/wow_board_model.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';

part 'wow_remote_data_source_impl.g.dart';

// 원격 저장소와 통신하는 실제 구현체 객체
// 실제 로컬 저장소와 통신하는 로직을 구현한다.
// => 실제 내부 코드는 'Retrofit'이라는 패키지가 대신해서 구현을 해준다.
//    => 해당 코드 내용도 .g.dart 파일에서 구현되어있다.
@RestApi(baseUrl: '')
abstract class WowRemoteDataSourceImpl implements WowRemoteDataSource {
  factory WowRemoteDataSourceImpl(Dio dio) = _WowRemoteDataSourceImpl;

  // ---------------- cards ----------------
  @override
  @GET('/todo')
  @Headers({'accessToken': 'true'})
  Future<List<WowBoardModel>> getWowBoards();
}
