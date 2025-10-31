import 'package:flutter/material.dart';

class InheritedWidgetEx extends InheritedWidget {
  final String title;
  const InheritedWidgetEx({
    super.key,
    required super.child,
    required this.title,
  });

  @override
  bool updateShouldNotify(InheritedWidgetEx oldWidget) {
    return title != oldWidget.title;
  }

  /// 현재 컨텍스트에서 InheritedWidgetEx 위젯을 찾아서 반환
  static InheritedWidgetEx of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<InheritedWidgetEx>()!;
  }
}

class InheritedEx extends StatefulWidget {
  const InheritedEx({super.key});

  @override
  State<InheritedEx> createState() => _InheritedExState();
}

class _InheritedExState extends State<InheritedEx> {
  String title = 'InheritedEx';
  @override
  Widget build(BuildContext context) {
    debugPrint('InheritedEx build');
    return Scaffold(
      body: SafeArea(
        child: InheritedWidgetEx(
          title: title,
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    title = 'Changed';
                  });
                },
                child: const Text('Change Title'),
              ),
              const InheritedWidgetEx2(),
            ],
          ),
        ),
      ),
    );
  }
}

class InheritedWidgetEx2 extends StatelessWidget {
  const InheritedWidgetEx2({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint('InheritedWidgetEx2 build');
    return Text(
      context.dependOnInheritedWidgetOfExactType<InheritedWidgetEx>()!.title,
    );
  }
}
