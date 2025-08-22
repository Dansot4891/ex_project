import 'package:ex_project/rx_dart/presentation/controller/rx_dart_state.dart';
import 'package:rxdart/rxdart.dart';

class RxDartController {
  final BehaviorSubject<RxDartState> _controller =
      BehaviorSubject<RxDartState>.seeded(
        RxDartState(title: "Title", list: [], isLoading: false),
      );

  Stream<RxDartState> get counterStream => _controller.stream;

  void fetch() async {
    _controller.add(_controller.value.copyWith(isLoading: true));
    await Future.delayed(Duration(seconds: 2));
    _controller.add(
      _controller.value.copyWith(
        title: "Revise",
        list: ["11123", "11123423", "11adsfa123", "11ㅇㄴㅇㅇㅇㄹ123"],
        isLoading: false,
      ),
    );
  }

  void dispose() {
    _controller.close();
  }
}
