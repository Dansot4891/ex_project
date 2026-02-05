import 'package:flutter_blue_plus/flutter_blue_plus.dart';

class BluePlusState {
  final BluetoothAdapterState adapterState;
  final List<ScanResult> scanResults;
  final bool isScanning;
  final BluetoothDevice? connectedDevice;
  final List<BluetoothService> services;
  final List<BluetoothDevice> bondedDevices;
  final List<BluetoothDevice> systemConnectedDevices;

  const BluePlusState({
    this.adapterState = BluetoothAdapterState.unknown,
    this.scanResults = const [],
    this.isScanning = false,
    this.connectedDevice,
    this.services = const [],
    this.bondedDevices = const [],
    this.systemConnectedDevices = const [],
  });

  BluePlusState copyWith({
    BluetoothAdapterState? adapterState,
    List<ScanResult>? scanResults,
    bool? isScanning,
    BluetoothDevice? connectedDevice,
    List<BluetoothService>? services,
    List<BluetoothDevice>? bondedDevices,
    List<BluetoothDevice>? systemConnectedDevices,
    bool clearConnectedDevice = false,
  }) {
    return BluePlusState(
      adapterState: adapterState ?? this.adapterState,
      scanResults: scanResults ?? this.scanResults,
      isScanning: isScanning ?? this.isScanning,
      connectedDevice:
          clearConnectedDevice ? null : (connectedDevice ?? this.connectedDevice),
      services: services ?? this.services,
      bondedDevices: bondedDevices ?? this.bondedDevices,
      systemConnectedDevices: systemConnectedDevices ?? this.systemConnectedDevices,
    );
  }
}
