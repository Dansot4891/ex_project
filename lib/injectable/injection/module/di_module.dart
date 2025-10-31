import 'package:dio/dio.dart';
import 'package:ex_project/injectable/data/data_source/remote/injectable_test_remote_data_source.dart';
import 'package:ex_project/injectable/data/data_source/remote/injectable_test_remote_data_source_impl.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract class RegisterModule {
  @preResolve
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();

  @lazySingleton
  Dio get dio => Dio()..interceptors.add(CustomInterceptor());

  // 요게 중요: “인터페이스 타입”으로 등록
  @lazySingleton
  InjectableTestRemoteDataSource get injectableTestRemoteDataSource =>
      InjectableTestRemoteDataSourceImpl(dio);
}

class CustomInterceptor extends InterceptorsWrapper {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    debugPrint('📇 onRequest: ${options.uri}');
    super.onRequest(options, handler);
  }
}
