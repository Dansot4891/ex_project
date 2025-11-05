import 'package:drift/drift.dart' as drift;
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
                  DriftItemTableCompanion(
                    title: drift.Value('My Title'),
                    content: drift.Value('My Content'),
                    createdAt: drift.Value(DateTime.now()),
                  ),
                );
              },
              child: const Text('Insert Drift Item'),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) {
                  final data = listData[index];
                  return Column(
                    children: [
                      Text(data.title),
                      Text(data.content),
                      Text('${data.createdAt}'),
                      ElevatedButton(
                        onPressed: () {
                          appDb.deleteDriftItemTable(data.id);
                        },
                        child: const Text('Delete Drift Item'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          appDb.updateDriftItemTable(data);
                        },
                        child: const Text('Update Drift Item'),
                      ),
                    ],
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
