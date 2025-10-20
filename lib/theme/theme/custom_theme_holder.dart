import 'package:ex_project/theme/theme/color/abs_theme_colors.dart';
import 'package:ex_project/theme/theme/custom_theme.dart';
import 'package:flutter/material.dart';

class CustomThemeHolder extends InheritedWidget {
  final AbstractThemeColors appColors;
  final CustomTheme theme;
  final Function(CustomTheme) changeTheme;

  CustomThemeHolder({
    required super.child,
    required this.theme,
    required this.changeTheme,
    super.key,
  }) : appColors = theme.appColors;

  @override
  bool updateShouldNotify(CustomThemeHolder oldWidget) {
    final old = oldWidget.theme;
    final current = theme;
    final need = old != current;
    return need;
  }

  static CustomThemeHolder of(BuildContext context) {
    CustomThemeHolder inherited = (context
        .dependOnInheritedWidgetOfExactType<CustomThemeHolder>())!;
    return inherited;
  }
}
