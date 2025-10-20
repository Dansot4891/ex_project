import 'package:flutter/material.dart';

typedef ColorProvider = Color Function();

abstract class AbstractThemeColors {
  const AbstractThemeColors();

  Color get seedColor => Colors.blue;

  Color get veryBrightGrey => Colors.grey;

  Color get drawerBg => const Color.fromARGB(255, 255, 255, 255);

  Color get scrollableItem => const Color.fromARGB(255, 57, 57, 57);

  Color get iconButton => const Color.fromARGB(255, 255, 255, 255);

  Color get iconButtonInactivate => const Color.fromARGB(255, 113, 113, 113);

  Color get inActivate => const Color.fromARGB(255, 79, 79, 79);

  Color get activate => const Color.fromARGB(255, 63, 72, 95);

  Color get badgeBg => Colors.blue;

  Color get textBadgeText => Colors.white;

  Color get badgeBorder => Colors.transparent;

  Color get divider => const Color.fromARGB(255, 80, 80, 80);

  Color get text => Colors.white;

  Color get hintText => Colors.grey;

  Color get focusedBorder => Colors.grey;

  Color get confirmText => Colors.blue;

  Color get drawerText => text;

  Color get snackbarBgColor => Colors.blue;

  Color get blueButtonBackground => Colors.blue;

  Color get appBarBackground => const Color.fromARGB(255, 16, 16, 18);

  Color get buttonBackground => const Color.fromARGB(255, 48, 48, 48);

  Color get roundedLayoutBackground => const Color.fromARGB(255, 24, 24, 24);

  Color get unreadColor => const Color.fromARGB(255, 48, 48, 48);

  Color get lessImportant => Colors.grey;

  Color get blueText => Colors.blue;

  Color get dimmedText => const Color.fromARGB(255, 171, 171, 171);

  Color get plus => const Color.fromARGB(255, 230, 71, 83);

  Color get minus => const Color.fromARGB(255, 57, 127, 228);
}
