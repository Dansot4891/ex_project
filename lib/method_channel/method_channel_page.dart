import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// 위에서 만든 컨트롤러 import
// import 'method_channel_controller.dart';

class MethodChannelPage extends StatefulWidget {
  @override
  _MethodChannelPageState createState() => _MethodChannelPageState();
}

class _MethodChannelPageState extends State<MethodChannelPage> {
  late MethodChannel _controller;
  String _batteryLevel = 'Unknown battery level.';
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    // 컨트롤러 초기화
    _controller = MethodChannel('com.example.ex_project/battery');
  }

  Future<void> _getBatteryLevel() async {
    print("=== getBatteryLevel 시작 ===");
    setState(() {
      _isLoading = true;
    });

    try {
      print("=== callMethod 호출 전 ===");
      final int? result = await _controller.invokeMethod<int>(
        'getBatteryLevel',
      );
      print("=== callMethod 결과: $result ===");

      setState(() {
        _batteryLevel = result != null
            ? 'Battery level: $result%'
            : 'Failed to get battery level';
        _isLoading = false;
      });
    } catch (e) {
      print("=== 에러 발생: $e ===");
      setState(() {
        _batteryLevel = "Error: $e";
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Battery Info'), backgroundColor: Colors.blue),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.battery_charging_full, size: 80, color: Colors.green),
              SizedBox(height: 30),

              Card(
                elevation: 4,
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Text(
                    _batteryLevel,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),

              SizedBox(height: 30),

              ElevatedButton(
                onPressed: _isLoading ? null : _getBatteryLevel,
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                ),
                child: _isLoading
                    ? Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(
                            width: 16,
                            height: 16,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(width: 8),
                          Text('Loading...'),
                        ],
                      )
                    : Text('Get Battery Level', style: TextStyle(fontSize: 16)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
