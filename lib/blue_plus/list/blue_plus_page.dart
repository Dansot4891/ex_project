import 'package:ex_project/blue_plus/list/blue_plus_controller.dart';
import 'package:ex_project/blue_plus/list/blue_plus_state.dart';
import 'package:ex_project/blue_plus/list/widgets/bonded_device_tile.dart';
import 'package:ex_project/blue_plus/list/widgets/scan_result_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BluePlusPage extends ConsumerStatefulWidget {
  const BluePlusPage({super.key});

  @override
  ConsumerState<BluePlusPage> createState() => _BluePlusPageState();
}

class _BluePlusPageState extends ConsumerState<BluePlusPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      setState(() {}); // FAB 업데이트
      if (_tabController.index == 1) {
        // 등록된 기기 탭으로 이동 시 목록 갱신
        ref.read(bluePlusControllerProvider.notifier).getRegisteredDevices();
      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(bluePlusControllerProvider);
    final controller = ref.read(bluePlusControllerProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Bluetooth'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Icon(
              state.adapterState == BluetoothAdapterState.on
                  ? Icons.bluetooth
                  : Icons.bluetooth_disabled,
              color: state.adapterState == BluetoothAdapterState.on
                  ? Colors.blue
                  : Colors.grey,
            ),
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: '주변 기기 스캔'),
            Tab(text: '등록된 기기'),
          ],
        ),
      ),
      body: state.adapterState != BluetoothAdapterState.on
          ? _buildBluetoothOffBody(state, controller)
          : TabBarView(
              controller: _tabController,
              children: [
                _ScanTab(state: state, controller: controller),
                _RegisteredTab(state: state, controller: controller),
              ],
            ),
      floatingActionButton:
          state.adapterState == BluetoothAdapterState.on &&
              _tabController.index == 0
          ? FloatingActionButton.extended(
              onPressed: state.isScanning
                  ? () => controller.stopScan()
                  : () => controller.startScan(),
              icon: Icon(state.isScanning ? Icons.stop : Icons.search),
              label: Text(state.isScanning ? '스캔 중지' : '스캔 시작'),
            )
          : null,
    );
  }

  Widget _buildBluetoothOffBody(
    BluePlusState state,
    BluePlusController controller,
  ) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.bluetooth_disabled, size: 64, color: Colors.grey),
          const SizedBox(height: 16),
          Text(
            '블루투스가 ${_getAdapterStateText(state.adapterState)}',
            style: const TextStyle(fontSize: 18),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () => controller.turnOnBluetooth(),
            child: const Text('블루투스 켜기'),
          ),
        ],
      ),
    );
  }

  String _getAdapterStateText(BluetoothAdapterState adapterState) {
    switch (adapterState) {
      case BluetoothAdapterState.on:
        return '켜져 있습니다';
      case BluetoothAdapterState.off:
        return '꺼져 있습니다';
      case BluetoothAdapterState.turningOn:
        return '켜지는 중입니다';
      case BluetoothAdapterState.turningOff:
        return '꺼지는 중입니다';
      case BluetoothAdapterState.unauthorized:
        return '권한이 없습니다';
      case BluetoothAdapterState.unavailable:
        return '사용할 수 없습니다';
      case BluetoothAdapterState.unknown:
        return '알 수 없는 상태입니다';
    }
  }
}

// 스캔 탭
class _ScanTab extends StatelessWidget {
  final BluePlusState state;
  final BluePlusController controller;

  const _ScanTab({required this.state, required this.controller});

  @override
  Widget build(BuildContext context) {
    if (state.scanResults.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (state.isScanning) ...[
              const CircularProgressIndicator(),
              const SizedBox(height: 16),
              const Text('디바이스 검색 중...'),
            ] else ...[
              const Icon(
                Icons.bluetooth_searching,
                size: 64,
                color: Colors.grey,
              ),
              const SizedBox(height: 16),
              const Text('스캔 버튼을 눌러 주변 기기를 검색하세요'),
            ],
          ],
        ),
      );
    }

    return ListView.builder(
      itemCount: state.scanResults.length,
      itemBuilder: (context, index) {
        final result = state.scanResults[index];
        return ScanResultTile(result: result);
      },
    );
  }
}

// 등록된 기기 탭
class _RegisteredTab extends StatelessWidget {
  final BluePlusState state;
  final BluePlusController controller;

  const _RegisteredTab({required this.state, required this.controller});

  @override
  Widget build(BuildContext context) {
    final hasBonded = state.bondedDevices.isNotEmpty;
    final hasConnected = state.systemConnectedDevices.isNotEmpty;

    if (!hasBonded && !hasConnected) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.devices, size: 64, color: Colors.grey),
            const SizedBox(height: 16),
            const Text('등록된 기기가 없습니다'),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: () => controller.getRegisteredDevices(),
              icon: const Icon(Icons.refresh),
              label: const Text('새로고침'),
            ),
          ],
        ),
      );
    }

    return RefreshIndicator(
      onRefresh: () async => controller.getRegisteredDevices(),
      child: ListView(
        children: [
          // 현재 연결된 기기
          if (hasConnected) ...[
            const Padding(
              padding: EdgeInsets.fromLTRB(16, 16, 16, 8),
              child: Text(
                '현재 연결된 기기',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
            ),
            ...state.systemConnectedDevices.map(
              (device) => BondedDeviceTile(device: device, isConnected: true),
            ),
          ],
          // 본딩된 기기
          if (hasBonded) ...[
            const Padding(
              padding: EdgeInsets.fromLTRB(16, 16, 16, 8),
              child: Text(
                '페어링된 기기 (Bonded)',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
            ),
            ...state.bondedDevices.map(
              (device) => BondedDeviceTile(device: device, isConnected: false),
            ),
          ],
        ],
      ),
    );
  }
}
