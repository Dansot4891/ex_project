import 'package:ex_project/blue_plus/detail/device_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';

class ScanResultTile extends StatelessWidget {
  final ScanResult result;

  const ScanResultTile({required this.result, super.key});

  @override
  Widget build(BuildContext context) {
    final device = result.device;
    final deviceName = result.advertisementData.advName.isNotEmpty
        ? result.advertisementData.advName
        : (device.platformName.isNotEmpty
              ? device.platformName
              : '알 수 없는 디바이스');

    return ListTile(
      leading: const Icon(Icons.bluetooth),
      title: Text(deviceName),
      subtitle: Text(device.remoteId.toString()),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(_getRssiIcon(result.rssi), color: _getRssiColor(result.rssi)),
          const SizedBox(width: 4),
          Text('${result.rssi} dBm'),
        ],
      ),
      onTap: () => _onTap(context, deviceName),
    );
  }

  void _onTap(BuildContext context, String deviceName) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) =>
            DeviceDetailPage(device: result.device, deviceName: deviceName),
        settings: const RouteSettings(name: '/DeviceScreen'),
      ),
    );
  }

  IconData _getRssiIcon(int rssi) {
    if (rssi >= -50) return Icons.signal_cellular_4_bar;
    if (rssi >= -60) return Icons.signal_cellular_alt;
    if (rssi >= -70) return Icons.signal_cellular_alt_2_bar;
    return Icons.signal_cellular_alt_1_bar;
  }

  Color _getRssiColor(int rssi) {
    if (rssi >= -50) return Colors.green;
    if (rssi >= -60) return Colors.lightGreen;
    if (rssi >= -70) return Colors.orange;
    return Colors.red;
  }
}
