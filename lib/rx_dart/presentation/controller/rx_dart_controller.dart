import 'package:ex_project/rx_dart/presentation/controller/rx_dart_state.dart';
import 'package:rxdart/rxdart.dart';
import 'dart:async';

class RxDartController {
  // 초기값은 컨트롤러에서만 세팅
  final _state = BehaviorSubject<RxDartState>.seeded(
    RxDartState(
      title: "RxDart 예제",
      list: const [],
      isLoading: false,
      searchList: const [],
    ),
  );
  Stream<RxDartState> get stream => _state.stream;
  RxDartState get current => _state.value;

  RxDartController();

  // 검색 입력
  void onQueryChanged(String text) => _state.add(
    current.copyWith(
      searchList: current.list
          .where((e) => e.toLowerCase().contains(text.toLowerCase()))
          .toList(),
    ),
  );

  // 데이터 로드 (원본+상태 동시 갱신)
  Future<void> fetch() async {
    _state.add(current.copyWith(isLoading: true));
    await Future.delayed(const Duration(seconds: 1));

    // 실제 API 응답 가정
    final data = ["11123", "11123423", "11adsfa123", "11ㅇㄴㅇㅇㅇㄹ123"]; // 원본 캐시 갱신
    _state.add(
      current.copyWith(
        list: data,
        isLoading: false,
        searchList: data,
        // searchList는 위 combineLatest로 자동 반영됨
      ),
    );
  }

  void dispose() {
    _state.close();
  }
}
