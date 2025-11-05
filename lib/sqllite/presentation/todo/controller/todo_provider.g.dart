// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(TodoProvider)
const todoProviderProvider = TodoProviderProvider._();

final class TodoProviderProvider
    extends $AsyncNotifierProvider<TodoProvider, List<TodoModel>> {
  const TodoProviderProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'todoProviderProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$todoProviderHash();

  @$internal
  @override
  TodoProvider create() => TodoProvider();
}

String _$todoProviderHash() => r'40ae248c5f952c533e4cefaaf093e6c91361db56';

abstract class _$TodoProvider extends $AsyncNotifier<List<TodoModel>> {
  FutureOr<List<TodoModel>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<List<TodoModel>>, List<TodoModel>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<TodoModel>>, List<TodoModel>>,
              AsyncValue<List<TodoModel>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
