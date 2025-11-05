import 'package:drift/drift.dart';

class ChatTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get message => text().withLength(min: 6, max: 32)();
  DateTimeColumn get createdAt => dateTime().nullable()();
}
