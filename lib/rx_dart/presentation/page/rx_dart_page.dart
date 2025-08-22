import 'package:ex_project/rx_dart/presentation/controller/rx_dart_controller.dart';
import 'package:flutter/material.dart';

class RxDartPage extends StatefulWidget {
  const RxDartPage({super.key});

  @override
  State<RxDartPage> createState() => _RxDartPageState();
}

class _RxDartPageState extends State<RxDartPage> {
  late final RxDartController controller;

  @override
  void initState() {
    controller = RxDartController();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Text("rxdart controller ex"),
            StreamBuilder(
              stream: controller.counterStream,
              builder: (context, snapshot) {
                // 로딩 상태 (아직 데이터가 없음)
                if (!snapshot.hasData) {
                  return CircularProgressIndicator();
                }

                // 에러 상태
                if (snapshot.hasError || snapshot.data == null) {
                  return Text(
                    'Error: ${snapshot.error}',
                    style: TextStyle(color: Colors.red),
                  );
                }

                final state = snapshot.data!;

                if (state.isLoading) {
                  return CircularProgressIndicator();
                }
                final list = state.list;

                // 성공 상태 (데이터 있음)
                return Expanded(
                  child: Column(
                    children: [
                      Text(state.title),
                      Expanded(
                        child: ListView.builder(
                          itemCount: list.length,
                          itemBuilder: (context, index) {
                            final item = list[index];
                            return Text(item);
                          },
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
            TextButton(
              onPressed: () {
                controller.fetch();
              },
              child: Text("fetch"),
            ),
          ],
        ),
      ),
    );
  }
}
