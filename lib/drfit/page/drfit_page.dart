import 'package:ex_project/drfit/database/app_db.dart';
import 'package:flutter/material.dart';

class DrfitPage extends StatefulWidget {
  const DrfitPage({super.key});

  @override
  State<DrfitPage> createState() => _DrfitPageState();
}

class _DrfitPageState extends State<DrfitPage> {
  final appDb = AppDatabase();
  List<DriftItemTableData> listData = [];

  @override
  void initState() {
    super.initState();
    appDb.getAllDriftItemTable().then((value) {
      print("value: $value");
      setState(() {
        listData = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Drfit Page')),
      body: SafeArea(
        child: Column(
          children: [
            Text('Drfit Page'),
            ElevatedButton(
              onPressed: () async {
                // 사용
                await appDb.insertDriftItemTable(
                  DriftItemTableData(
                    id: 0, // autoIncrement라서 실제로는 무시됨
                    title: 'My Title',
                    content: 'My Content',
                    createdAt: DateTime.now(),
                  ),
                );
              },
              child: const Text('Insert Drift Item'),
            ),
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) {
                  final data = listData[index];
                  return Text(
                    '${data.title} ${data.content} ${data.createdAt}',
                  );
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(height: 16);
                },
                itemCount: listData.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
