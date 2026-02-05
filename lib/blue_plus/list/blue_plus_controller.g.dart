// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'blue_plus_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(BluePlusController)
const bluePlusControllerProvider = BluePlusControllerProvider._();

final class BluePlusControllerProvider
    extends $NotifierProvider<BluePlusController, BluePlusState> {
  const BluePlusControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'bluePlusControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$bluePlusControllerHash();

  @$internal
  @override
  BluePlusController create() => BluePlusController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(BluePlusState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<BluePlusState>(value),
    );
  }
}

String _$bluePlusControllerHash() =>
    r'd50e6d6f6b58cf3917e4f254bbfc67d829412137';

abstract class _$BluePlusController extends $Notifier<BluePlusState> {
  BluePlusState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<BluePlusState, BluePlusState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<BluePlusState, BluePlusState>,
              BluePlusState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
