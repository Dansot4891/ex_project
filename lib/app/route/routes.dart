import 'package:ex_project/dalemy/features/wow/presentation/wow_board/page/wow_page_root.dart';
import 'package:ex_project/image_cache/page/image_ex_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// 바텀 네비게이션바 관련 shell route key 값
final _shellNavigatorKey = GlobalKey<NavigatorState>();

final routes = [
  // RootTab을 첫 화면으로 설정
  ...WowPath.routes,
  ...ImageCachePath.routes,
];

// AppRoute들을 enum으로 정리
enum AppRoute {
  todo(path: '/todo', name: 'todo'),
  todo2(path: '/todo2', name: 'todo2'),
  home(path: '/home', name: 'home'),
  schedule(path: '/schedule', name: 'schedule'),
  board(path: '/board', name: 'board'),
  mypage(path: '/mypage', name: 'mypage'),
  wow(path: '/wow', name: 'wow'),
  imageCache(path: '/imageCache', name: 'imageCache');

  final String path;
  final String name;

  const AppRoute({required this.path, required this.name});
}

// ------------------------------------------
// feature나 특정 단위로 묶어서
// 해당 단위의 라우팅들만 설정하는 추상 객체
abstract class WowPath {
  static final List<GoRoute> routes = [
    GoRoute(
      path: AppRoute.wow.path,
      name: AppRoute.wow.name,
      builder: (context, state) {
        return const WowPageRoot();
      },
    ),
  ];
}

abstract class ImageCachePath {
  static final List<GoRoute> routes = [
    GoRoute(
      path: AppRoute.imageCache.path,
      name: AppRoute.imageCache.name,
      builder: (context, state) {
        return const ImageExPage();
      },
    ),
  ];
}

// 뒤로가기
void pop(BuildContext context) {
  context.pop();
}

// 전체 앱에서 화면 이동할 때 사용하는 함수
Future<void> navigate(
  BuildContext context, {
  required AppRoute route,
  NavigationMethod method = NavigationMethod.push,
}) async {
  final goRouter = GoRouter.of(context);

  switch (method) {
    case NavigationMethod.push:
      await goRouter.push(route.path);
      break;
    case NavigationMethod.replace:
      await goRouter.replace(route.path);
      break;
    case NavigationMethod.go:
      goRouter.go(route.path);
      break;
    case NavigationMethod.pushReplacement:
      await goRouter.pushReplacement(route.path);
      break;
  }
}

// Navigation 이동 방법
enum NavigationMethod { push, replace, go, pushReplacement }
