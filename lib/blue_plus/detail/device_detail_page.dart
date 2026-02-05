import 'package:ex_project/blue_plus/detail/device_detail_controller.dart';
import 'package:ex_project/blue_plus/detail/widgets/connection_buttons.dart';
import 'package:ex_project/blue_plus/detail/widgets/device_info_card.dart';
import 'package:ex_project/blue_plus/detail/widgets/services_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DeviceDetailPage extends ConsumerWidget {
  final BluetoothDevice device;
  final String deviceName;

  const DeviceDetailPage({
    super.key,
    required this.device,
    required this.deviceName,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final deviceId = device.remoteId.toString();
    final state = ref.watch(deviceDetailControllerProvider(deviceId));
    final controller = ref.read(deviceDetailControllerProvider(deviceId).notifier);

    return Scaffold(
      appBar: AppBar(
        title: Text(deviceName),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Icon(
              state.isConnected
                  ? Icons.bluetooth_connected
                  : Icons.bluetooth_disabled,
              color: state.isConnected ? Colors.blue : Colors.grey,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DeviceInfoCard(
              deviceName: deviceName,
              deviceId: deviceId,
              isConnected: state.isConnected,
              servicesCount: state.services.length,
            ),
            const SizedBox(height: 16),
            ConnectionButtons(
              isConnected: state.isConnected,
              isConnecting: state.isConnecting,
              isDiscoveringServices: state.isDiscoveringServices,
              onConnect: () => _handleConnect(context, controller),
              onDisconnect: () => _handleDisconnect(context, controller),
              onDiscoverServices: () => _handleDiscoverServices(context, controller),
            ),
            const SizedBox(height: 16),
            if (state.isConnected) ServicesSection(services: state.services),
          ],
        ),
      ),
    );
  }

  Future<void> _handleConnect(BuildContext context, DeviceDetailController controller) async {
    try {
      await controller.connect();
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('연결 실패: $e')),
        );
      }
    }
  }

  Future<void> _handleDisconnect(BuildContext context, DeviceDetailController controller) async {
    try {
      await controller.disconnect();
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('연결 해제 실패: $e')),
        );
      }
    }
  }

  Future<void> _handleDiscoverServices(BuildContext context, DeviceDetailController controller) async {
    try {
      await controller.discoverServices();
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('서비스 검색 실패: $e')),
        );
      }
    }
  }
}
