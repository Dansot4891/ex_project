import 'package:ex_project/theme/theme/theme_extension.dart';
import 'package:flutter/material.dart';

class ThemePage extends StatelessWidget {
  const ThemePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Theme Page')),
      body: SafeArea(
        child: Column(
          children: [
            Text(
              'Theme Page',
              style: TextStyle(
                fontSize: 20,
                color: context.themeColors.activate,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
