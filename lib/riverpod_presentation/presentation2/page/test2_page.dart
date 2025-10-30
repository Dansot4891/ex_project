import 'package:ex_project/riverpod_presentation/presentation2/widgets/search_text_field.dart';
import 'package:ex_project/riverpod_presentation/presentation2/widgets/test2_list.dart';
import 'package:flutter/material.dart';

class Test2Page extends StatelessWidget {
  const Test2Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Test2')),
      body: const SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [SearchTextField(), SizedBox(height: 16), Test2List()],
          ),
        ),
      ),
    );
  }
}
