// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wow_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(WowProvider)
const wowProviderProvider = WowProviderProvider._();

final class WowProviderProvider
    extends $AsyncNotifierProvider<WowProvider, WowState> {
  const WowProviderProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'wowProviderProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$wowProviderHash();

  @$internal
  @override
  WowProvider create() => WowProvider();
}

String _$wowProviderHash() => r'33bdf98cb4a3bb7e34eb8808faf63bc5aac6a470';

abstract class _$WowProvider extends $AsyncNotifier<WowState> {
  FutureOr<WowState> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<WowState>, WowState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<WowState>, WowState>,
              AsyncValue<WowState>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
