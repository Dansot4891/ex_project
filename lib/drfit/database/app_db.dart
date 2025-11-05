import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:ex_project/drfit/database/table/chat_table.dart';
import 'package:ex_project/drfit/database/table/drift_item_table.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

part 'app_db.g.dart';

@DriftDatabase(tables: [DriftItemTable, ChatTable])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  /// 스키마 버전

  /// 드리프트 가져오기
  Future<List<DriftItemTableData>> getAllDriftItemTable() =>
      select(driftItemTable).get();

  /// 드리프트 삽입
  Future<void> insertDriftItemTable(
    DriftItemTableCompanion driftItemTableData,
  ) => into(driftItemTable).insert(driftItemTableData);

  /// 드리프트 업데이트
  Future<void> updateDriftItemTable(DriftItemTableData driftItemTableData) =>
      update(driftItemTable).replace(driftItemTableData);

  /// 드리프트 삭제
  Future<void> deleteDriftItemTable(int id) =>
      (delete(driftItemTable)..where((tbl) => tbl.id.equals(id))).go();

  /// 채팅 가져오기
  Future<List<ChatTableData>> getAllChatTable() => select(chatTable).get();

  /// 로컬 DB의 실제 데이터 저장 위치
  static QueryExecutor _openConnection() {
    return LazyDatabase(() async {
      final dbFolder = await getApplicationDocumentsDirectory();
      final file = File(p.join(dbFolder.path, 'db.sqlite'));
      return NativeDatabase(file);
    });
  }
}
