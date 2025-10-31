import 'package:ex_project/sqllite/presentation/todo/controller/todo_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

class TodoPage extends ConsumerWidget {
  const TodoPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(todoProviderProvider);
    final notifier = ref.read(todoProviderProvider.notifier);
    return Scaffold(
      appBar: AppBar(title: const Text('Todo Page')),
      body: state.when(
        data: (data) {
          return SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      final todo = data[index];
                      return Column(
                        children: [
                          Text(todo.todoId.toString()),
                          Text(todo.title),
                          Text(todo.description),
                          Text(todo.completed.toString()),
                          Text(todo.createdAt.toString()),
                          Text(todo.updatedAt.toString()),
                          ElevatedButton(
                            onPressed: () {
                              notifier.deleteTodo(todo.todoId);
                            },
                            child: const Text('Delete Todo'),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              notifier.editTodo(todo.todoId);
                            },
                            child: const Text('Edit Todo'),
                          ),
                        ],
                      );
                    },
                  ),
                ),

                ElevatedButton(
                  onPressed: () {
                    notifier.addTodo();
                  },
                  child: const Text('Add Todo'),
                ),
              ],
            ),
          );
        },
        error: (error, stackTrace) {
          return Center(child: Text(error.toString()));
        },
        loading: () {
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
