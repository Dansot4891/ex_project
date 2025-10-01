import 'package:ex_project/app/di/app_di.dart';
import 'package:ex_project/dalemy/features/wow/presentation/wow_board/page/wow_page_root.dart';
import 'package:ex_project/injectable/injection/app_injection.dart';
import 'package:ex_project/injectable/presentation/controller/injetable_view_model.dart';
import 'package:ex_project/insta/view/insta_ex_view.dart';
import 'package:ex_project/isolate/page/isolate_page.dart';
import 'package:ex_project/method_channel/method_channel_page.dart';
import 'package:ex_project/rx_dart/presentation/page/rx_dart_page.dart';
import 'package:ex_project/zoom/presentation/page/zoom_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/services.dart';
import 'package:ex_project/injectable/presentation/page/injectable_page.dart';

void main() async {
  // 위젯 바인딩 초기화 : 웹뷰와 플러터 엔진과의 상호작용을 위함
  WidgetsFlutterBinding.ensureInitialized();

  // diSetup();
  configureDependencies();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp, // 정방향 세로
    DeviceOrientation.portraitDown, // 역방향 세로
  ]);

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final viewModel = InjectableViewModel();
  // This widget is the root of your application.
  @override
  void initState() {
    super.initState();
    viewModel.getInjectableTests();
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
        home: ZoomPage(),
      ),
    );
  }
}
