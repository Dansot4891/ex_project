// lib/injection.dart
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'app_injection.config.dart'; // 생성될 파일

final sl = GetIt.instance;

@InjectableInit()
Future<void> configureDependencies() async => sl.init();
