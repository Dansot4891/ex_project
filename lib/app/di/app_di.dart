import 'package:ex_project/core/module/media/app_video_controller.dart';
import 'package:ex_project/core/module/media/app_youtube_controller.dart';
import 'package:ex_project/dalemy/features/wow/data/data_source/remote/wow_remote_data_source.dart';
import 'package:ex_project/dalemy/features/wow/data/data_source/remote/wow_remote_data_source_impl.dart';
import 'package:ex_project/dalemy/features/wow/data/repository_impl/wow_repository_impl.dart';
import 'package:ex_project/dalemy/features/wow/domain/repository/wow_repository.dart';
import 'package:ex_project/dalemy/features/wow/domain/use_case/get_wows_use_case.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

// 앱의 의존성 주입을 전역적으로 관리
// registerSingleton - 싱글톤(인스턴스 1개)
// registerFactory - 매번 새로운 인스턴스 생성
final locator = GetIt.instance;

void diSetup() {
  // Media Controller
  locator.registerSingleton<AppVideoController>(AppVideoController());
  locator.registerSingleton<AppYoutubeController>(AppYoutubeController());

  // Data Source
  locator.registerSingleton<WowRemoteDataSource>(
    WowRemoteDataSourceImpl(Dio()),
  );

  // Repository
  locator.registerSingleton<WowRepository>(WowRepositoryImpl(locator()));

  // UseCase
  locator.registerSingleton(GetWowBoardsUseCase(locator()));
}
