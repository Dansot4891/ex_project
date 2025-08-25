import 'package:ex_project/isolate/controller/isolate_excuter.dart';
import 'package:flutter/material.dart';

class IsolatePage extends StatefulWidget {
  const IsolatePage({super.key});

  @override
  State<IsolatePage> createState() => _IsolatePageState();
}

class _IsolatePageState extends State<IsolatePage> {
  int? calcData;
  final isolateExecutor = IsolateExecutor();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              calcData == null
                  ? const CircularProgressIndicator()
                  : Text(
                      calcData.toString(),
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
              const SizedBox(height: 24),
              GestureDetector(
                onTap: () async {
                  final result = await isolateExecutor.executeIsolate<int>(() {
                    int calculateData = 0;

                    for (int i = 0; i < 2000; i++) {
                      for (int j = 0; j < 2000; j++) {
                        for (int k = 0; k < 2000; k++) {
                          calculateData++;
                        }
                      }
                    }
                    return calculateData;
                  });
                  calcData = result;
                  setState(() {});
                },
                child: Container(
                  width: 200,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(24),
                  ),
                  alignment: Alignment.center,
                  child: const Text(
                    "계산",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
