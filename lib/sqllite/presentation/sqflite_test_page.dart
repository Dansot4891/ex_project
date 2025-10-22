import 'package:ex_project/sqllite/presentation/todo/page/todo_page.dart';
import 'package:ex_project/sqllite/presentation/user/page/user_page.dart';
import 'package:flutter/material.dart';

class SqfliteTestPage extends StatelessWidget {
  const SqfliteTestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sqflite Test Page')),
      body: SafeArea(
        child: Column(
          children: [
            Text('Sqflite Test Page'),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TodoPage()),
                );
              },
              child: Text('Todo Page'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => UserPage()),
                );
              },
              child: Text('User Page'),
            ),
          ],
        ),
      ),
    );
  }
}
