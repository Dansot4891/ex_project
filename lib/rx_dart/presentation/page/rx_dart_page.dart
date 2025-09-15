import 'package:ex_project/rx_dart/presentation/controller/rx_dart_controller.dart';
import 'package:ex_project/rx_dart/presentation/controller/rx_dart_state.dart';
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
    controller.fetch(); // 최초 한번만
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
            Expanded(
              child: StreamBuilder<RxDartState>(
                stream: controller.stream,
                initialData: controller.current,
                builder: (context, snap) {
                  final state = snap.data!;

                  /// 로딩 상태
                  if (state.isLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  /// 데이터가 없을 때
                  final searchList = state.searchList;
                  if (searchList.isEmpty) {
                    return const Center(child: Text("데이터가 없습니다"));
                  }

                  /// 데이터가 있을 때
                  return Column(
                    children: [
                      const SizedBox(height: 8),
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: Text(
                          state.title,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: TextField(
                          decoration: const InputDecoration(
                            labelText: "검색어 (비우면 원본으로 복귀)",
                            border: OutlineInputBorder(),
                          ),
                          onChanged: controller.onQueryChanged,
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemCount: searchList.length,
                          itemBuilder: (_, i) =>
                              ListTile(title: Text(searchList[i])),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            TextButton(onPressed: controller.fetch, child: const Text("조회")),
          ],
        ),
      ),
    );
  }
}
