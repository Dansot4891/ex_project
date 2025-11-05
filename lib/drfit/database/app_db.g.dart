// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_db.dart';

// ignore_for_file: type=lint
class $DriftItemTableTable extends DriftItemTable
    with TableInfo<$DriftItemTableTable, DriftItemTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DriftItemTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 6,
      maxTextLength: 32,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _contentMeta = const VerificationMeta(
    'content',
  );
  @override
  late final GeneratedColumn<String> content = GeneratedColumn<String>(
    'body',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [id, title, content, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'drift_item_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<DriftItemTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('body')) {
      context.handle(
        _contentMeta,
        content.isAcceptableOrUnknown(data['body']!, _contentMeta),
      );
    } else if (isInserting) {
      context.missing(_contentMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DriftItemTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DriftItemTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      content: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}body'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      ),
    );
  }

  @override
  $DriftItemTableTable createAlias(String alias) {
    return $DriftItemTableTable(attachedDatabase, alias);
  }
}

class DriftItemTableData extends DataClass
    implements Insertable<DriftItemTableData> {
  final int id;
  final String title;
  final String content;
  final DateTime? createdAt;
  const DriftItemTableData({
    required this.id,
    required this.title,
    required this.content,
    this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    map['body'] = Variable<String>(content);
    if (!nullToAbsent || createdAt != null) {
      map['created_at'] = Variable<DateTime>(createdAt);
    }
    return map;
  }

  DriftItemTableCompanion toCompanion(bool nullToAbsent) {
    return DriftItemTableCompanion(
      id: Value(id),
      title: Value(title),
      content: Value(content),
      createdAt: createdAt == null && nullToAbsent
          ? const Value.absent()
          : Value(createdAt),
    );
  }

  factory DriftItemTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DriftItemTableData(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      content: serializer.fromJson<String>(json['content']),
      createdAt: serializer.fromJson<DateTime?>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'content': serializer.toJson<String>(content),
      'createdAt': serializer.toJson<DateTime?>(createdAt),
    };
  }

  DriftItemTableData copyWith({
    int? id,
    String? title,
    String? content,
    Value<DateTime?> createdAt = const Value.absent(),
  }) => DriftItemTableData(
    id: id ?? this.id,
    title: title ?? this.title,
    content: content ?? this.content,
    createdAt: createdAt.present ? createdAt.value : this.createdAt,
  );
  DriftItemTableData copyWithCompanion(DriftItemTableCompanion data) {
    return DriftItemTableData(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      content: data.content.present ? data.content.value : this.content,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DriftItemTableData(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('content: $content, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, title, content, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DriftItemTableData &&
          other.id == this.id &&
          other.title == this.title &&
          other.content == this.content &&
          other.createdAt == this.createdAt);
}

class DriftItemTableCompanion extends UpdateCompanion<DriftItemTableData> {
  final Value<int> id;
  final Value<String> title;
  final Value<String> content;
  final Value<DateTime?> createdAt;
  const DriftItemTableCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.content = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  DriftItemTableCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    required String content,
    this.createdAt = const Value.absent(),
  }) : title = Value(title),
       content = Value(content);
  static Insertable<DriftItemTableData> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<String>? content,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (content != null) 'body': content,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  DriftItemTableCompanion copyWith({
    Value<int>? id,
    Value<String>? title,
    Value<String>? content,
    Value<DateTime?>? createdAt,
  }) {
    return DriftItemTableCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      content: content ?? this.content,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (content.present) {
      map['body'] = Variable<String>(content.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DriftItemTableCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('content: $content, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $ChatTableTable extends ChatTable
    with TableInfo<$ChatTableTable, ChatTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ChatTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _messageMeta = const VerificationMeta(
    'message',
  );
  @override
  late final GeneratedColumn<String> message = GeneratedColumn<String>(
    'message',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 6,
      maxTextLength: 32,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [id, message, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'chat_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<ChatTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('message')) {
      context.handle(
        _messageMeta,
        message.isAcceptableOrUnknown(data['message']!, _messageMeta),
      );
    } else if (isInserting) {
      context.missing(_messageMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ChatTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ChatTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      message: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}message'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      ),
    );
  }

  @override
  $ChatTableTable createAlias(String alias) {
    return $ChatTableTable(attachedDatabase, alias);
  }
}

class ChatTableData extends DataClass implements Insertable<ChatTableData> {
  final int id;
  final String message;
  final DateTime? createdAt;
  const ChatTableData({
    required this.id,
    required this.message,
    this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['message'] = Variable<String>(message);
    if (!nullToAbsent || createdAt != null) {
      map['created_at'] = Variable<DateTime>(createdAt);
    }
    return map;
  }

  ChatTableCompanion toCompanion(bool nullToAbsent) {
    return ChatTableCompanion(
      id: Value(id),
      message: Value(message),
      createdAt: createdAt == null && nullToAbsent
          ? const Value.absent()
          : Value(createdAt),
    );
  }

  factory ChatTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ChatTableData(
      id: serializer.fromJson<int>(json['id']),
      message: serializer.fromJson<String>(json['message']),
      createdAt: serializer.fromJson<DateTime?>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'message': serializer.toJson<String>(message),
      'createdAt': serializer.toJson<DateTime?>(createdAt),
    };
  }

  ChatTableData copyWith({
    int? id,
    String? message,
    Value<DateTime?> createdAt = const Value.absent(),
  }) => ChatTableData(
    id: id ?? this.id,
    message: message ?? this.message,
    createdAt: createdAt.present ? createdAt.value : this.createdAt,
  );
  ChatTableData copyWithCompanion(ChatTableCompanion data) {
    return ChatTableData(
      id: data.id.present ? data.id.value : this.id,
      message: data.message.present ? data.message.value : this.message,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ChatTableData(')
          ..write('id: $id, ')
          ..write('message: $message, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, message, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ChatTableData &&
          other.id == this.id &&
          other.message == this.message &&
          other.createdAt == this.createdAt);
}

class ChatTableCompanion extends UpdateCompanion<ChatTableData> {
  final Value<int> id;
  final Value<String> message;
  final Value<DateTime?> createdAt;
  const ChatTableCompanion({
    this.id = const Value.absent(),
    this.message = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  ChatTableCompanion.insert({
    this.id = const Value.absent(),
    required String message,
    this.createdAt = const Value.absent(),
  }) : message = Value(message);
  static Insertable<ChatTableData> custom({
    Expression<int>? id,
    Expression<String>? message,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (message != null) 'message': message,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  ChatTableCompanion copyWith({
    Value<int>? id,
    Value<String>? message,
    Value<DateTime?>? createdAt,
  }) {
    return ChatTableCompanion(
      id: id ?? this.id,
      message: message ?? this.message,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (message.present) {
      map['message'] = Variable<String>(message.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ChatTableCompanion(')
          ..write('id: $id, ')
          ..write('message: $message, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $DriftItemTableTable driftItemTable = $DriftItemTableTable(this);
  late final $ChatTableTable chatTable = $ChatTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    driftItemTable,
    chatTable,
  ];
}

typedef $$DriftItemTableTableCreateCompanionBuilder =
    DriftItemTableCompanion Function({
      Value<int> id,
      required String title,
      required String content,
      Value<DateTime?> createdAt,
    });
typedef $$DriftItemTableTableUpdateCompanionBuilder =
    DriftItemTableCompanion Function({
      Value<int> id,
      Value<String> title,
      Value<String> content,
      Value<DateTime?> createdAt,
    });

class $$DriftItemTableTableFilterComposer
    extends Composer<_$AppDatabase, $DriftItemTableTable> {
  $$DriftItemTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get content => $composableBuilder(
    column: $table.content,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$DriftItemTableTableOrderingComposer
    extends Composer<_$AppDatabase, $DriftItemTableTable> {
  $$DriftItemTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get content => $composableBuilder(
    column: $table.content,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$DriftItemTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $DriftItemTableTable> {
  $$DriftItemTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get content =>
      $composableBuilder(column: $table.content, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$DriftItemTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $DriftItemTableTable,
          DriftItemTableData,
          $$DriftItemTableTableFilterComposer,
          $$DriftItemTableTableOrderingComposer,
          $$DriftItemTableTableAnnotationComposer,
          $$DriftItemTableTableCreateCompanionBuilder,
          $$DriftItemTableTableUpdateCompanionBuilder,
          (
            DriftItemTableData,
            BaseReferences<
              _$AppDatabase,
              $DriftItemTableTable,
              DriftItemTableData
            >,
          ),
          DriftItemTableData,
          PrefetchHooks Function()
        > {
  $$DriftItemTableTableTableManager(
    _$AppDatabase db,
    $DriftItemTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DriftItemTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DriftItemTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DriftItemTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String> content = const Value.absent(),
                Value<DateTime?> createdAt = const Value.absent(),
              }) => DriftItemTableCompanion(
                id: id,
                title: title,
                content: content,
                createdAt: createdAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String title,
                required String content,
                Value<DateTime?> createdAt = const Value.absent(),
              }) => DriftItemTableCompanion.insert(
                id: id,
                title: title,
                content: content,
                createdAt: createdAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$DriftItemTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $DriftItemTableTable,
      DriftItemTableData,
      $$DriftItemTableTableFilterComposer,
      $$DriftItemTableTableOrderingComposer,
      $$DriftItemTableTableAnnotationComposer,
      $$DriftItemTableTableCreateCompanionBuilder,
      $$DriftItemTableTableUpdateCompanionBuilder,
      (
        DriftItemTableData,
        BaseReferences<_$AppDatabase, $DriftItemTableTable, DriftItemTableData>,
      ),
      DriftItemTableData,
      PrefetchHooks Function()
    >;
typedef $$ChatTableTableCreateCompanionBuilder =
    ChatTableCompanion Function({
      Value<int> id,
      required String message,
      Value<DateTime?> createdAt,
    });
typedef $$ChatTableTableUpdateCompanionBuilder =
    ChatTableCompanion Function({
      Value<int> id,
      Value<String> message,
      Value<DateTime?> createdAt,
    });

class $$ChatTableTableFilterComposer
    extends Composer<_$AppDatabase, $ChatTableTable> {
  $$ChatTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get message => $composableBuilder(
    column: $table.message,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ChatTableTableOrderingComposer
    extends Composer<_$AppDatabase, $ChatTableTable> {
  $$ChatTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get message => $composableBuilder(
    column: $table.message,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ChatTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $ChatTableTable> {
  $$ChatTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get message =>
      $composableBuilder(column: $table.message, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$ChatTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ChatTableTable,
          ChatTableData,
          $$ChatTableTableFilterComposer,
          $$ChatTableTableOrderingComposer,
          $$ChatTableTableAnnotationComposer,
          $$ChatTableTableCreateCompanionBuilder,
          $$ChatTableTableUpdateCompanionBuilder,
          (
            ChatTableData,
            BaseReferences<_$AppDatabase, $ChatTableTable, ChatTableData>,
          ),
          ChatTableData,
          PrefetchHooks Function()
        > {
  $$ChatTableTableTableManager(_$AppDatabase db, $ChatTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ChatTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ChatTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ChatTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> message = const Value.absent(),
                Value<DateTime?> createdAt = const Value.absent(),
              }) => ChatTableCompanion(
                id: id,
                message: message,
                createdAt: createdAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String message,
                Value<DateTime?> createdAt = const Value.absent(),
              }) => ChatTableCompanion.insert(
                id: id,
                message: message,
                createdAt: createdAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ChatTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ChatTableTable,
      ChatTableData,
      $$ChatTableTableFilterComposer,
      $$ChatTableTableOrderingComposer,
      $$ChatTableTableAnnotationComposer,
      $$ChatTableTableCreateCompanionBuilder,
      $$ChatTableTableUpdateCompanionBuilder,
      (
        ChatTableData,
        BaseReferences<_$AppDatabase, $ChatTableTable, ChatTableData>,
      ),
      ChatTableData,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$DriftItemTableTableTableManager get driftItemTable =>
      $$DriftItemTableTableTableManager(_db, _db.driftItemTable);
  $$ChatTableTableTableManager get chatTable =>
      $$ChatTableTableTableManager(_db, _db.chatTable);
}
