import 'package:flutter/material.dart';

class ConnectionButtons extends StatelessWidget {
  final bool isConnected;
  final bool isConnecting;
  final bool isDiscoveringServices;
  final VoidCallback onConnect;
  final VoidCallback onDisconnect;
  final VoidCallback onDiscoverServices;

  const ConnectionButtons({
    super.key,
    required this.isConnected,
    required this.isConnecting,
    required this.isDiscoveringServices,
    required this.onConnect,
    required this.onDisconnect,
    required this.onDiscoverServices,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton.icon(
            onPressed: isConnecting ? null : (isConnected ? onDisconnect : onConnect),
            icon: isConnecting
                ? const SizedBox(
                    width: 16,
                    height: 16,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                : Icon(isConnected ? Icons.link_off : Icons.link),
            label: Text(isConnected ? '연결 해제' : '연결'),
          ),
        ),
        if (isConnected) ...[
          const SizedBox(width: 8),
          Expanded(
            child: ElevatedButton.icon(
              onPressed: isDiscoveringServices ? null : onDiscoverServices,
              icon: isDiscoveringServices
                  ? const SizedBox(
                      width: 16,
                      height: 16,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : const Icon(Icons.search),
              label: const Text('서비스 검색'),
            ),
          ),
        ],
      ],
    );
  }
}
