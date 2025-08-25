import 'dart:isolate';

class IsolateExecutor {
  IsolateExecutor();

  Future<T> executeIsolate<T>(Function() function) async {
    final ReceivePort receivePort = ReceivePort();

    final isolate = await Isolate.spawn(
      _isolateEntryPoint,
      _IsolateMessage(function: function, sendPort: receivePort.sendPort),
    );

    final result = await receivePort.first as T;
    receivePort.close();
    isolate.kill(priority: Isolate.immediate);
    return result;
  }

  void _isolateEntryPoint(_IsolateMessage message) async {
    final result = await message.function();
    message.sendPort.send(result);
  }
}

class _IsolateMessage {
  _IsolateMessage({required this.function, required this.sendPort});

  final dynamic Function() function;
  final SendPort sendPort;
}
