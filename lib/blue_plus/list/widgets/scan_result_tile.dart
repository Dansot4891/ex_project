import 'package:ex_project/blue_plus/detail/device_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';

// 본딩된 기기 타일
class BondedDeviceTile extends StatelessWidget {
  final BluetoothDevice device;
  final bool isConnected;

  const BondedDeviceTile({
    required this.device,
    required this.isConnected,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final deviceName = device.platformName.isNotEmpty
        ? device.platformName
        : '알 수 없는 디바이스';

    return ListTile(
      leading: Icon(
        isConnected ? Icons.bluetooth_connected : Icons.bluetooth,
        color: isConnected ? Colors.blue : null,
      ),
      title: Text(deviceName),
      subtitle: Text(device.remoteId.toString()),
      trailing: isConnected
          ? const Chip(
              label: Text('연결됨', style: TextStyle(fontSize: 12)),
              backgroundColor: Colors.blue,
              labelStyle: TextStyle(color: Colors.white),
            )
          : null,
      onTap: () => _onTap(context, deviceName),
    );
  }

  void _onTap(BuildContext context, String deviceName) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) =>
            DeviceDetailPage(device: device, deviceName: deviceName),
        settings: const RouteSettings(name: '/DeviceScreen'),
      ),
    );
  }
}
