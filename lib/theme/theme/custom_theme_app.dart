import 'package:ex_project/theme/theme/theme_utils.dart';
import 'package:flutter/material.dart';
import 'custom_theme.dart';
import 'custom_theme_holder.dart';

class CustomThemeApp extends StatefulWidget {
  final Widget child;

  const CustomThemeApp({super.key, required this.child});

  @override
  State<CustomThemeApp> createState() => _CustomThemeAppState();
}

class _CustomThemeAppState extends State<CustomThemeApp> {
  late CustomTheme theme = savedTheme ?? defaultTheme ?? systemTheme;

  ///light, dark 테마가 준비되었고, 시스템 테마를 따라가게 하려면 해당 필드를 제거 하시면 됩니다.
  final CustomTheme? defaultTheme = CustomTheme.light;

  void handleChangeTheme(CustomTheme theme) {
    setState(() => this.theme = theme);
  }

  @override
  Widget build(BuildContext context) {
    return CustomThemeHolder(
      changeTheme: handleChangeTheme,
      theme: theme,
      child: widget.child,
    );
  }

  /// Todo: 테마 저장 기능 추가
  CustomTheme? get savedTheme => null;

  CustomTheme get systemTheme {
    switch (ThemeUtil.systemBrightness) {
      case Brightness.dark:
        return CustomTheme.dark;
      case Brightness.light:
        return CustomTheme.light;
    }
  }
}
