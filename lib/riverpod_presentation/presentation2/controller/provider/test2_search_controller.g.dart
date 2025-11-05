// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'test2_search_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(Test2SearchController)
const test2SearchControllerProvider = Test2SearchControllerProvider._();

final class Test2SearchControllerProvider
    extends $NotifierProvider<Test2SearchController, TextEditingController> {
  const Test2SearchControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'test2SearchControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$test2SearchControllerHash();

  @$internal
  @override
  Test2SearchController create() => Test2SearchController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TextEditingController value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TextEditingController>(value),
    );
  }
}

String _$test2SearchControllerHash() =>
    r'b97f26d2b47cb88196a82da3cf7abd446f904eb7';

abstract class _$Test2SearchController
    extends $Notifier<TextEditingController> {
  TextEditingController build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<TextEditingController, TextEditingController>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<TextEditingController, TextEditingController>,
              TextEditingController,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
