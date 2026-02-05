import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';

class ServicesSection extends StatelessWidget {
  final List<BluetoothService> services;

  const ServicesSection({super.key, required this.services});

  @override
  Widget build(BuildContext context) {
    if (services.isEmpty) {
      return const Card(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Center(child: Text('서비스를 검색해주세요')),
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '서비스 목록',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        ...services.map((service) => ServiceTile(service: service)),
      ],
    );
  }
}

class ServiceTile extends StatefulWidget {
  final BluetoothService service;

  const ServiceTile({super.key, required this.service});

  @override
  State<ServiceTile> createState() => _ServiceTileState();
}

class _ServiceTileState extends State<ServiceTile> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: Column(
        children: [
          ListTile(
            leading: const Icon(Icons.miscellaneous_services),
            title: Text(
              _getServiceName(widget.service.uuid.toString()),
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
            subtitle: Text(
              widget.service.uuid.toString(),
              style: const TextStyle(fontSize: 10),
            ),
            trailing: Icon(_isExpanded ? Icons.expand_less : Icons.expand_more),
            onTap: () => setState(() => _isExpanded = !_isExpanded),
          ),
          if (_isExpanded)
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Characteristics (${widget.service.characteristics.length})',
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 8),
                  ...widget.service.characteristics.map(
                    (c) => CharacteristicTile(characteristic: c),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }

  String _getServiceName(String uuid) {
    final knownServices = {
      '00001800-0000-1000-8000-00805f9b34fb': 'Generic Access',
      '00001801-0000-1000-8000-00805f9b34fb': 'Generic Attribute',
      '0000180a-0000-1000-8000-00805f9b34fb': 'Device Information',
      '0000180f-0000-1000-8000-00805f9b34fb': 'Battery Service',
      '0000180d-0000-1000-8000-00805f9b34fb': 'Heart Rate',
    };
    return knownServices[uuid.toLowerCase()] ?? 'Unknown Service';
  }
}

class CharacteristicTile extends StatefulWidget {
  final BluetoothCharacteristic characteristic;

  const CharacteristicTile({super.key, required this.characteristic});

  @override
  State<CharacteristicTile> createState() => _CharacteristicTileState();
}

class _CharacteristicTileState extends State<CharacteristicTile> {
  List<int>? _value;
  bool _isReading = false;

  Future<void> _readValue() async {
    setState(() => _isReading = true);
    try {
      final value = await widget.characteristic.read();
      setState(() => _value = value);
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('읽기 실패: $e')),
        );
      }
    } finally {
      if (mounted) setState(() => _isReading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final props = widget.characteristic.properties;

    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.characteristic.uuid.toString(),
            style: const TextStyle(fontSize: 10, fontFamily: 'monospace'),
          ),
          const SizedBox(height: 4),
          Wrap(
            spacing: 4,
            children: [
              if (props.read) _buildPropertyChip('Read'),
              if (props.write) _buildPropertyChip('Write'),
              if (props.notify) _buildPropertyChip('Notify'),
              if (props.indicate) _buildPropertyChip('Indicate'),
            ],
          ),
          if (_value != null) ...[
            const SizedBox(height: 8),
            Text(
              'Value: ${_value!.map((e) => e.toRadixString(16).padLeft(2, '0')).join(' ')}',
              style: const TextStyle(fontSize: 12, fontFamily: 'monospace'),
            ),
          ],
          if (props.read) ...[
            const SizedBox(height: 8),
            SizedBox(
              height: 32,
              child: ElevatedButton(
                onPressed: _isReading ? null : _readValue,
                child: _isReading
                    ? const SizedBox(
                        width: 16,
                        height: 16,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : const Text('Read', style: TextStyle(fontSize: 12)),
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildPropertyChip(String label) {
    return Chip(
      label: Text(label, style: const TextStyle(fontSize: 10)),
      padding: EdgeInsets.zero,
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      visualDensity: VisualDensity.compact,
    );
  }
}
