// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'test2_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(Test2Controller)
const test2ControllerProvider = Test2ControllerProvider._();

final class Test2ControllerProvider
    extends $AsyncNotifierProvider<Test2Controller, Test2State> {
  const Test2ControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'test2ControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$test2ControllerHash();

  @$internal
  @override
  Test2Controller create() => Test2Controller();
}

String _$test2ControllerHash() => r'a4873e85333caaef43ad8ee3c6e80d02fa695d82';

abstract class _$Test2Controller extends $AsyncNotifier<Test2State> {
  FutureOr<Test2State> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<Test2State>, Test2State>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<Test2State>, Test2State>,
              AsyncValue<Test2State>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
