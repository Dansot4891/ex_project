import 'package:flutter_blue_plus/flutter_blue_plus.dart';

class DeviceDetailState {
  final BluetoothConnectionState connectionState;
  final List<BluetoothService> services;
  final bool isConnecting;
  final bool isDiscoveringServices;

  const DeviceDetailState({
    this.connectionState = BluetoothConnectionState.disconnected,
    this.services = const [],
    this.isConnecting = false,
    this.isDiscoveringServices = false,
  });

  bool get isConnected => connectionState == BluetoothConnectionState.connected;

  DeviceDetailState copyWith({
    BluetoothConnectionState? connectionState,
    List<BluetoothService>? services,
    bool? isConnecting,
    bool? isDiscoveringServices,
  }) {
    return DeviceDetailState(
      connectionState: connectionState ?? this.connectionState,
      services: services ?? this.services,
      isConnecting: isConnecting ?? this.isConnecting,
      isDiscoveringServices: isDiscoveringServices ?? this.isDiscoveringServices,
    );
  }
}
