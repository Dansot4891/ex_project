// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:ex_project/injectable/data/data_source/remote/injectable_test_remote_data_source.dart'
    as _i284;
import 'package:ex_project/injectable/data/repository_impl/injetable_test_repository_impl.dart'
    as _i325;
import 'package:ex_project/injectable/domain/repository/injetable_test_repository.dart'
    as _i752;
import 'package:ex_project/injectable/domain/use_case/get_wows_use_case.dart'
    as _i247;
import 'package:ex_project/injectable/injection/module/di_module.dart' as _i67;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final registerModule = _$RegisterModule();
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => registerModule.prefs,
      preResolve: true,
    );
    gh.lazySingleton<_i361.Dio>(() => registerModule.dio);
    gh.lazySingleton<_i284.InjectableTestRemoteDataSource>(
      () => registerModule.injectableTestRemoteDataSource,
    );
    gh.factory<_i752.InjectableTestRepository>(
      () => _i325.InjectableTestRepositoryImpl(
        gh<_i284.InjectableTestRemoteDataSource>(),
      ),
    );
    gh.factory<_i247.GetInjectableTestsUseCase>(
      () =>
          _i247.GetInjectableTestsUseCase(gh<_i752.InjectableTestRepository>()),
    );
    return this;
  }
}

class _$RegisterModule extends _i67.RegisterModule {}
