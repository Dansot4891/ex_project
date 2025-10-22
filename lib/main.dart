import 'package:ex_project/riverpod_presentation/presentation2/page/test2_page.dart';
import 'package:ex_project/sqllite/core/db/app_db.dart';
import 'package:ex_project/sqllite/presentation/sqflite_test_page.dart';
import 'package:ex_project/sqllite/presentation/todo/page/todo_page.dart';
import 'package:ex_project/theme/theme/custom_theme_app.dart';
import 'package:ex_project/injectable/injection/app_injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/services.dart';

void main() async {
  // 위젯 바인딩 초기화 : 웹뷰와 플러터 엔진과의 상호작용을 위함
  WidgetsFlutterBinding.ensureInitialized();

  // diSetup();
  configureDependencies();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp, // 정방향 세로
    DeviceOrientation.portraitDown, // 역방향 세로
  ]);

  await AppDb.instance.init();

  runApp(const CustomThemeApp(child: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        builder: (context, child) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(
              textScaler: const TextScaler.linear(1.0), // ✅ 새 방식
            ),
            child: child!,
          );
        },
        home: SqfliteTestPage(),
      ),
    );
  }
}
