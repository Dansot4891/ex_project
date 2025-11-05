// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(UserProvider)
const userProviderProvider = UserProviderProvider._();

final class UserProviderProvider
    extends $AsyncNotifierProvider<UserProvider, UserState> {
  const UserProviderProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'userProviderProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$userProviderHash();

  @$internal
  @override
  UserProvider create() => UserProvider();
}

String _$userProviderHash() => r'e18f4e5adbbc60a8d17dfeb427304f8369badfd6';

abstract class _$UserProvider extends $AsyncNotifier<UserState> {
  FutureOr<UserState> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<UserState>, UserState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<UserState>, UserState>,
              AsyncValue<UserState>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
