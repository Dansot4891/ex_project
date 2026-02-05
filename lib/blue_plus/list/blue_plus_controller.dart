import 'dart:async';

import 'package:ex_project/blue_plus/list/blue_plus_state.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'blue_plus_controller.g.dart';

@riverpod
class BluePlusController extends _$BluePlusController {
  StreamSubscription<BluetoothAdapterState>? _adapterStateSubscription;
  StreamSubscription<List<ScanResult>>? _scanResultsSubscription;
  StreamSubscription<bool>? _isScanningSubscription;

  @override
  BluePlusState build() {
    // 블루투스 어댑터 상태 구독
    _adapterStateSubscription = FlutterBluePlus.adapterState.listen((
      adapterState,
    ) {
      state = state.copyWith(adapterState: adapterState);
    });

    // 스캔 결과 구독
    _scanResultsSubscription = FlutterBluePlus.scanResults.listen((results) {
      state = state.copyWith(scanResults: results);
    });

    // 스캔 상태 구독
    _isScanningSubscription = FlutterBluePlus.isScanning.listen((isScanning) {
      state = state.copyWith(isScanning: isScanning);
    });

    // Provider가 dispose될 때 구독 해제
    ref.onDispose(() {
      _adapterStateSubscription?.cancel();
      _scanResultsSubscription?.cancel();
      _isScanningSubscription?.cancel();
    });

    return const BluePlusState();
  }

  /// 블루투스 스캔 시작
  Future<void> startScan({
    Duration timeout = const Duration(seconds: 15),
  }) async {
    // 이미 스캔 중이면 무시
    if (state.isScanning) return;

    // 이전 스캔 결과 초기화
    state = state.copyWith(scanResults: []);

    await FlutterBluePlus.startScan(timeout: timeout);
  }

  /// 블루투스 스캔 중지
  Future<void> stopScan() async {
    await FlutterBluePlus.stopScan();
  }

  /// 디바이스에 연결
  Future<void> connectToDevice(BluetoothDevice device) async {
    try {
      await device.connect(license: License.free);
      state = state.copyWith(connectedDevice: device);

      // 서비스 검색
      final services = await device.discoverServices();
      state = state.copyWith(services: services);
    } catch (e) {
      rethrow;
    }
  }

  /// 디바이스 연결 해제
  Future<void> disconnectDevice() async {
    try {
      await state.connectedDevice?.disconnect();
      state = state.copyWith(clearConnectedDevice: true, services: []);
    } catch (e) {
      rethrow;
    }
  }

  /// 블루투스 켜기 요청 (Android 전용)
  Future<void> turnOnBluetooth() async {
    await FlutterBluePlus.turnOn();
  }

  /// 본딩(페어링)된 기기 목록 가져오기
  Future<void> getBondedDevices() async {
    final bondedDevices = await FlutterBluePlus.bondedDevices;
    state = state.copyWith(bondedDevices: bondedDevices);
  }

  /// 시스템에 연결된 기기 목록 가져오기
  Future<void> getSystemConnectedDevices() async {
    final connectedDevices = FlutterBluePlus.connectedDevices;
    state = state.copyWith(systemConnectedDevices: connectedDevices);
  }

  /// 본딩 + 연결된 기기 모두 가져오기
  void getRegisteredDevices() {
    getBondedDevices();
    getSystemConnectedDevices();
  }
}
