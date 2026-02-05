import 'dart:async';

import 'package:ex_project/blue_plus/detail/device_detail_state.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'device_detail_controller.g.dart';

@riverpod
class DeviceDetailController extends _$DeviceDetailController {
  StreamSubscription<BluetoothConnectionState>? _connectionStateSubscription;
  late BluetoothDevice _device;

  @override
  DeviceDetailState build(String deviceId) {
    // deviceId로 BluetoothDevice 생성
    _device = BluetoothDevice.fromId(deviceId);

    // 연결 상태 구독
    _connectionStateSubscription = _device.connectionState.listen((connState) {
      state = state.copyWith(connectionState: connState);
      if (connState == BluetoothConnectionState.disconnected) {
        state = state.copyWith(services: []);
      }
    });

    // Provider가 dispose될 때 구독 해제
    ref.onDispose(() {
      _connectionStateSubscription?.cancel();
    });

    return const DeviceDetailState();
  }

  /// 디바이스에 연결
  Future<void> connect() async {
    state = state.copyWith(isConnecting: true);
    try {
      await _device.connect(license: License.free);
    } catch (e) {
      rethrow;
    } finally {
      state = state.copyWith(isConnecting: false);
    }
  }

  /// 디바이스 연결 해제
  Future<void> disconnect() async {
    try {
      await _device.disconnect();
    } catch (e) {
      rethrow;
    }
  }

  /// 서비스 검색
  Future<void> discoverServices() async {
    state = state.copyWith(isDiscoveringServices: true);
    try {
      final services = await _device.discoverServices();
      state = state.copyWith(services: services);
    } catch (e) {
      rethrow;
    } finally {
      state = state.copyWith(isDiscoveringServices: false);
    }
  }
}
