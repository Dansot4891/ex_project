// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device_detail_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(DeviceDetailController)
const deviceDetailControllerProvider = DeviceDetailControllerFamily._();

final class DeviceDetailControllerProvider
    extends $NotifierProvider<DeviceDetailController, DeviceDetailState> {
  const DeviceDetailControllerProvider._({
    required DeviceDetailControllerFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'deviceDetailControllerProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$deviceDetailControllerHash();

  @override
  String toString() {
    return r'deviceDetailControllerProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  DeviceDetailController create() => DeviceDetailController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DeviceDetailState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DeviceDetailState>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is DeviceDetailControllerProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$deviceDetailControllerHash() =>
    r'937c39b5fd8a5a1a574afd7d055e6a654c0cd562';

final class DeviceDetailControllerFamily extends $Family
    with
        $ClassFamilyOverride<
          DeviceDetailController,
          DeviceDetailState,
          DeviceDetailState,
          DeviceDetailState,
          String
        > {
  const DeviceDetailControllerFamily._()
    : super(
        retry: null,
        name: r'deviceDetailControllerProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  DeviceDetailControllerProvider call(String deviceId) =>
      DeviceDetailControllerProvider._(argument: deviceId, from: this);

  @override
  String toString() => r'deviceDetailControllerProvider';
}

abstract class _$DeviceDetailController extends $Notifier<DeviceDetailState> {
  late final _$args = ref.$arg as String;
  String get deviceId => _$args;

  DeviceDetailState build(String deviceId);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args);
    final ref = this.ref as $Ref<DeviceDetailState, DeviceDetailState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<DeviceDetailState, DeviceDetailState>,
              DeviceDetailState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
