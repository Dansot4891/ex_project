import 'package:ex_project/app/di/app_di.dart';
import 'package:ex_project/dalemy/features/wow/presentation/wow_board/page/wow_page_root.dart';
import 'package:ex_project/insta/view/insta_ex_view.dart';
import 'package:ex_project/isolate/page/isolate_page.dart';
import 'package:ex_project/method_channel/method_channel_page.dart';
import 'package:ex_project/rx_dart/presentation/page/rx_dart_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/services.dart';

void main() async {
  diSetup();

  // 위젯 바인딩 초기화 : 웹뷰와 플러터 엔진과의 상호작용을 위함
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp, // 정방향 세로
    DeviceOrientation.portraitDown, // 역방향 세로
  ]);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ProviderScope(child: MaterialApp(home: RxDartPage()));
  }
}
