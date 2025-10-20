import 'package:ex_project/theme/theme/color/abs_theme_colors.dart';
import 'package:ex_project/theme/theme/custom_theme.dart';
import 'package:ex_project/theme/theme/custom_theme_holder.dart';
import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  CustomTheme get themeType => CustomThemeHolder.of(this).theme;

  Function(CustomTheme) get changeTheme =>
      CustomThemeHolder.of(this).changeTheme;

  AbstractThemeColors get themeColors => CustomThemeHolder.of(this).appColors;
}
