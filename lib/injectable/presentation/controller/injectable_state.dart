// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ex_project/injectable/data/model/injectable_test.dart';

class InjectableState {
  final List<InjectableTest> injectableTests;
  final bool isLoading;
  final bool isError;

  InjectableState({
    this.injectableTests = const [],
    this.isLoading = true,
    this.isError = false,
  });

  InjectableState copyWith({
    List<InjectableTest>? injectableTests,
    bool? isLoading,
    bool? isError,
  }) {
    return InjectableState(
      injectableTests: injectableTests ?? this.injectableTests,
      isLoading: isLoading ?? this.isLoading,
      isError: isError ?? this.isError,
    );
  }

  @override
  String toString() =>
      'InjectableState(injectableTests: $injectableTests, isLoading: $isLoading, isError: $isError)';
}
