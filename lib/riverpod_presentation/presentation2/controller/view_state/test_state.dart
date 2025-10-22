import 'package:ex_project/riverpod_presentation/domain/entity/list_entity.dart';

class Test2State {
  final List<ListEntity> items;

  Test2State({required this.items});

  Test2State copyWith({List<ListEntity>? items}) {
    return Test2State(items: items ?? this.items);
  }
}
