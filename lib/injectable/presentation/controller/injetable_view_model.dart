import 'package:ex_project/core/module/error/result.dart';
import 'package:ex_project/injectable/data/model/injectable_test.dart';
import 'package:ex_project/injectable/domain/use_case/get_wows_use_case.dart';
import 'package:ex_project/injectable/injection/app_injection.dart';
import 'package:ex_project/injectable/presentation/controller/injectable_state.dart';
import 'package:flutter/foundation.dart';

class InjectableViewModel with ChangeNotifier {
  InjectableState _state = InjectableState();

  InjectableViewModel();

  InjectableState get state => _state;

  void getInjectableTests() async {
    final result = await sl<GetInjectableTestsUseCase>().execute();
    switch (result) {
      case Success<List<InjectableTest>>():
        _state = _state.copyWith(
          injectableTests: result.data,
          isLoading: false,
        );
        notifyListeners();
      case Error<List<InjectableTest>>():
        _state = _state.copyWith(isError: true, isLoading: false);
        notifyListeners();
    }
  }
}
