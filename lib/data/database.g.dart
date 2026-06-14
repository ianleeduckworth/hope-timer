// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $ActiveTimersTable extends ActiveTimers
    with TableInfo<$ActiveTimersTable, ActiveTimer> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ActiveTimersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _projectNameMeta = const VerificationMeta(
    'projectName',
  );
  @override
  late final GeneratedColumn<String> projectName = GeneratedColumn<String>(
    'project_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _elapsedMsMeta = const VerificationMeta(
    'elapsedMs',
  );
  @override
  late final GeneratedColumn<int> elapsedMs = GeneratedColumn<int>(
    'elapsed_ms',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _isRunningMeta = const VerificationMeta(
    'isRunning',
  );
  @override
  late final GeneratedColumn<bool> isRunning = GeneratedColumn<bool>(
    'is_running',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_running" IN (0, 1))',
    ),
  );
  static const VerificationMeta _runningSinceMeta = const VerificationMeta(
    'runningSince',
  );
  @override
  late final GeneratedColumn<DateTime> runningSince = GeneratedColumn<DateTime>(
    'running_since',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    projectName,
    elapsedMs,
    isRunning,
    runningSince,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'active_timers';
  @override
  VerificationContext validateIntegrity(
    Insertable<ActiveTimer> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('project_name')) {
      context.handle(
        _projectNameMeta,
        projectName.isAcceptableOrUnknown(
          data['project_name']!,
          _projectNameMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_projectNameMeta);
    }
    if (data.containsKey('elapsed_ms')) {
      context.handle(
        _elapsedMsMeta,
        elapsedMs.isAcceptableOrUnknown(data['elapsed_ms']!, _elapsedMsMeta),
      );
    } else if (isInserting) {
      context.missing(_elapsedMsMeta);
    }
    if (data.containsKey('is_running')) {
      context.handle(
        _isRunningMeta,
        isRunning.isAcceptableOrUnknown(data['is_running']!, _isRunningMeta),
      );
    } else if (isInserting) {
      context.missing(_isRunningMeta);
    }
    if (data.containsKey('running_since')) {
      context.handle(
        _runningSinceMeta,
        runningSince.isAcceptableOrUnknown(
          data['running_since']!,
          _runningSinceMeta,
        ),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ActiveTimer map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ActiveTimer(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      projectName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}project_name'],
      )!,
      elapsedMs: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}elapsed_ms'],
      )!,
      isRunning: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_running'],
      )!,
      runningSince: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}running_since'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $ActiveTimersTable createAlias(String alias) {
    return $ActiveTimersTable(attachedDatabase, alias);
  }
}

class ActiveTimer extends DataClass implements Insertable<ActiveTimer> {
  final String id;
  final String projectName;
  final int elapsedMs;
  final bool isRunning;
  final DateTime? runningSince;
  final DateTime createdAt;
  final DateTime updatedAt;
  const ActiveTimer({
    required this.id,
    required this.projectName,
    required this.elapsedMs,
    required this.isRunning,
    this.runningSince,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['project_name'] = Variable<String>(projectName);
    map['elapsed_ms'] = Variable<int>(elapsedMs);
    map['is_running'] = Variable<bool>(isRunning);
    if (!nullToAbsent || runningSince != null) {
      map['running_since'] = Variable<DateTime>(runningSince);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  ActiveTimersCompanion toCompanion(bool nullToAbsent) {
    return ActiveTimersCompanion(
      id: Value(id),
      projectName: Value(projectName),
      elapsedMs: Value(elapsedMs),
      isRunning: Value(isRunning),
      runningSince: runningSince == null && nullToAbsent
          ? const Value.absent()
          : Value(runningSince),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory ActiveTimer.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ActiveTimer(
      id: serializer.fromJson<String>(json['id']),
      projectName: serializer.fromJson<String>(json['projectName']),
      elapsedMs: serializer.fromJson<int>(json['elapsedMs']),
      isRunning: serializer.fromJson<bool>(json['isRunning']),
      runningSince: serializer.fromJson<DateTime?>(json['runningSince']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'projectName': serializer.toJson<String>(projectName),
      'elapsedMs': serializer.toJson<int>(elapsedMs),
      'isRunning': serializer.toJson<bool>(isRunning),
      'runningSince': serializer.toJson<DateTime?>(runningSince),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  ActiveTimer copyWith({
    String? id,
    String? projectName,
    int? elapsedMs,
    bool? isRunning,
    Value<DateTime?> runningSince = const Value.absent(),
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => ActiveTimer(
    id: id ?? this.id,
    projectName: projectName ?? this.projectName,
    elapsedMs: elapsedMs ?? this.elapsedMs,
    isRunning: isRunning ?? this.isRunning,
    runningSince: runningSince.present ? runningSince.value : this.runningSince,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  ActiveTimer copyWithCompanion(ActiveTimersCompanion data) {
    return ActiveTimer(
      id: data.id.present ? data.id.value : this.id,
      projectName: data.projectName.present
          ? data.projectName.value
          : this.projectName,
      elapsedMs: data.elapsedMs.present ? data.elapsedMs.value : this.elapsedMs,
      isRunning: data.isRunning.present ? data.isRunning.value : this.isRunning,
      runningSince: data.runningSince.present
          ? data.runningSince.value
          : this.runningSince,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ActiveTimer(')
          ..write('id: $id, ')
          ..write('projectName: $projectName, ')
          ..write('elapsedMs: $elapsedMs, ')
          ..write('isRunning: $isRunning, ')
          ..write('runningSince: $runningSince, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    projectName,
    elapsedMs,
    isRunning,
    runningSince,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ActiveTimer &&
          other.id == this.id &&
          other.projectName == this.projectName &&
          other.elapsedMs == this.elapsedMs &&
          other.isRunning == this.isRunning &&
          other.runningSince == this.runningSince &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class ActiveTimersCompanion extends UpdateCompanion<ActiveTimer> {
  final Value<String> id;
  final Value<String> projectName;
  final Value<int> elapsedMs;
  final Value<bool> isRunning;
  final Value<DateTime?> runningSince;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const ActiveTimersCompanion({
    this.id = const Value.absent(),
    this.projectName = const Value.absent(),
    this.elapsedMs = const Value.absent(),
    this.isRunning = const Value.absent(),
    this.runningSince = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ActiveTimersCompanion.insert({
    required String id,
    required String projectName,
    required int elapsedMs,
    required bool isRunning,
    this.runningSince = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       projectName = Value(projectName),
       elapsedMs = Value(elapsedMs),
       isRunning = Value(isRunning),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<ActiveTimer> custom({
    Expression<String>? id,
    Expression<String>? projectName,
    Expression<int>? elapsedMs,
    Expression<bool>? isRunning,
    Expression<DateTime>? runningSince,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (projectName != null) 'project_name': projectName,
      if (elapsedMs != null) 'elapsed_ms': elapsedMs,
      if (isRunning != null) 'is_running': isRunning,
      if (runningSince != null) 'running_since': runningSince,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ActiveTimersCompanion copyWith({
    Value<String>? id,
    Value<String>? projectName,
    Value<int>? elapsedMs,
    Value<bool>? isRunning,
    Value<DateTime?>? runningSince,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<int>? rowid,
  }) {
    return ActiveTimersCompanion(
      id: id ?? this.id,
      projectName: projectName ?? this.projectName,
      elapsedMs: elapsedMs ?? this.elapsedMs,
      isRunning: isRunning ?? this.isRunning,
      runningSince: runningSince ?? this.runningSince,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (projectName.present) {
      map['project_name'] = Variable<String>(projectName.value);
    }
    if (elapsedMs.present) {
      map['elapsed_ms'] = Variable<int>(elapsedMs.value);
    }
    if (isRunning.present) {
      map['is_running'] = Variable<bool>(isRunning.value);
    }
    if (runningSince.present) {
      map['running_since'] = Variable<DateTime>(runningSince.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ActiveTimersCompanion(')
          ..write('id: $id, ')
          ..write('projectName: $projectName, ')
          ..write('elapsedMs: $elapsedMs, ')
          ..write('isRunning: $isRunning, ')
          ..write('runningSince: $runningSince, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $PublishedTimersTable extends PublishedTimers
    with TableInfo<$PublishedTimersTable, PublishedTimer> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PublishedTimersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _projectNameMeta = const VerificationMeta(
    'projectName',
  );
  @override
  late final GeneratedColumn<String> projectName = GeneratedColumn<String>(
    'project_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _durationMsMeta = const VerificationMeta(
    'durationMs',
  );
  @override
  late final GeneratedColumn<int> durationMs = GeneratedColumn<int>(
    'duration_ms',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _publishedAtMeta = const VerificationMeta(
    'publishedAt',
  );
  @override
  late final GeneratedColumn<DateTime> publishedAt = GeneratedColumn<DateTime>(
    'published_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    projectName,
    durationMs,
    publishedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'published_timers';
  @override
  VerificationContext validateIntegrity(
    Insertable<PublishedTimer> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('project_name')) {
      context.handle(
        _projectNameMeta,
        projectName.isAcceptableOrUnknown(
          data['project_name']!,
          _projectNameMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_projectNameMeta);
    }
    if (data.containsKey('duration_ms')) {
      context.handle(
        _durationMsMeta,
        durationMs.isAcceptableOrUnknown(data['duration_ms']!, _durationMsMeta),
      );
    } else if (isInserting) {
      context.missing(_durationMsMeta);
    }
    if (data.containsKey('published_at')) {
      context.handle(
        _publishedAtMeta,
        publishedAt.isAcceptableOrUnknown(
          data['published_at']!,
          _publishedAtMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_publishedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PublishedTimer map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PublishedTimer(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      projectName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}project_name'],
      )!,
      durationMs: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}duration_ms'],
      )!,
      publishedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}published_at'],
      )!,
    );
  }

  @override
  $PublishedTimersTable createAlias(String alias) {
    return $PublishedTimersTable(attachedDatabase, alias);
  }
}

class PublishedTimer extends DataClass implements Insertable<PublishedTimer> {
  final String id;
  final String projectName;
  final int durationMs;
  final DateTime publishedAt;
  const PublishedTimer({
    required this.id,
    required this.projectName,
    required this.durationMs,
    required this.publishedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['project_name'] = Variable<String>(projectName);
    map['duration_ms'] = Variable<int>(durationMs);
    map['published_at'] = Variable<DateTime>(publishedAt);
    return map;
  }

  PublishedTimersCompanion toCompanion(bool nullToAbsent) {
    return PublishedTimersCompanion(
      id: Value(id),
      projectName: Value(projectName),
      durationMs: Value(durationMs),
      publishedAt: Value(publishedAt),
    );
  }

  factory PublishedTimer.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PublishedTimer(
      id: serializer.fromJson<String>(json['id']),
      projectName: serializer.fromJson<String>(json['projectName']),
      durationMs: serializer.fromJson<int>(json['durationMs']),
      publishedAt: serializer.fromJson<DateTime>(json['publishedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'projectName': serializer.toJson<String>(projectName),
      'durationMs': serializer.toJson<int>(durationMs),
      'publishedAt': serializer.toJson<DateTime>(publishedAt),
    };
  }

  PublishedTimer copyWith({
    String? id,
    String? projectName,
    int? durationMs,
    DateTime? publishedAt,
  }) => PublishedTimer(
    id: id ?? this.id,
    projectName: projectName ?? this.projectName,
    durationMs: durationMs ?? this.durationMs,
    publishedAt: publishedAt ?? this.publishedAt,
  );
  PublishedTimer copyWithCompanion(PublishedTimersCompanion data) {
    return PublishedTimer(
      id: data.id.present ? data.id.value : this.id,
      projectName: data.projectName.present
          ? data.projectName.value
          : this.projectName,
      durationMs: data.durationMs.present
          ? data.durationMs.value
          : this.durationMs,
      publishedAt: data.publishedAt.present
          ? data.publishedAt.value
          : this.publishedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PublishedTimer(')
          ..write('id: $id, ')
          ..write('projectName: $projectName, ')
          ..write('durationMs: $durationMs, ')
          ..write('publishedAt: $publishedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, projectName, durationMs, publishedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PublishedTimer &&
          other.id == this.id &&
          other.projectName == this.projectName &&
          other.durationMs == this.durationMs &&
          other.publishedAt == this.publishedAt);
}

class PublishedTimersCompanion extends UpdateCompanion<PublishedTimer> {
  final Value<String> id;
  final Value<String> projectName;
  final Value<int> durationMs;
  final Value<DateTime> publishedAt;
  final Value<int> rowid;
  const PublishedTimersCompanion({
    this.id = const Value.absent(),
    this.projectName = const Value.absent(),
    this.durationMs = const Value.absent(),
    this.publishedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  PublishedTimersCompanion.insert({
    required String id,
    required String projectName,
    required int durationMs,
    required DateTime publishedAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       projectName = Value(projectName),
       durationMs = Value(durationMs),
       publishedAt = Value(publishedAt);
  static Insertable<PublishedTimer> custom({
    Expression<String>? id,
    Expression<String>? projectName,
    Expression<int>? durationMs,
    Expression<DateTime>? publishedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (projectName != null) 'project_name': projectName,
      if (durationMs != null) 'duration_ms': durationMs,
      if (publishedAt != null) 'published_at': publishedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  PublishedTimersCompanion copyWith({
    Value<String>? id,
    Value<String>? projectName,
    Value<int>? durationMs,
    Value<DateTime>? publishedAt,
    Value<int>? rowid,
  }) {
    return PublishedTimersCompanion(
      id: id ?? this.id,
      projectName: projectName ?? this.projectName,
      durationMs: durationMs ?? this.durationMs,
      publishedAt: publishedAt ?? this.publishedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (projectName.present) {
      map['project_name'] = Variable<String>(projectName.value);
    }
    if (durationMs.present) {
      map['duration_ms'] = Variable<int>(durationMs.value);
    }
    if (publishedAt.present) {
      map['published_at'] = Variable<DateTime>(publishedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PublishedTimersCompanion(')
          ..write('id: $id, ')
          ..write('projectName: $projectName, ')
          ..write('durationMs: $durationMs, ')
          ..write('publishedAt: $publishedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $ActiveTimersTable activeTimers = $ActiveTimersTable(this);
  late final $PublishedTimersTable publishedTimers = $PublishedTimersTable(
    this,
  );
  late final ActiveTimersDao activeTimersDao = ActiveTimersDao(
    this as AppDatabase,
  );
  late final PublishedTimersDao publishedTimersDao = PublishedTimersDao(
    this as AppDatabase,
  );
  late final AnalyticsDao analyticsDao = AnalyticsDao(this as AppDatabase);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    activeTimers,
    publishedTimers,
  ];
}

typedef $$ActiveTimersTableCreateCompanionBuilder =
    ActiveTimersCompanion Function({
      required String id,
      required String projectName,
      required int elapsedMs,
      required bool isRunning,
      Value<DateTime?> runningSince,
      required DateTime createdAt,
      required DateTime updatedAt,
      Value<int> rowid,
    });
typedef $$ActiveTimersTableUpdateCompanionBuilder =
    ActiveTimersCompanion Function({
      Value<String> id,
      Value<String> projectName,
      Value<int> elapsedMs,
      Value<bool> isRunning,
      Value<DateTime?> runningSince,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<int> rowid,
    });

class $$ActiveTimersTableFilterComposer
    extends Composer<_$AppDatabase, $ActiveTimersTable> {
  $$ActiveTimersTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get projectName => $composableBuilder(
    column: $table.projectName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get elapsedMs => $composableBuilder(
    column: $table.elapsedMs,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isRunning => $composableBuilder(
    column: $table.isRunning,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get runningSince => $composableBuilder(
    column: $table.runningSince,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ActiveTimersTableOrderingComposer
    extends Composer<_$AppDatabase, $ActiveTimersTable> {
  $$ActiveTimersTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get projectName => $composableBuilder(
    column: $table.projectName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get elapsedMs => $composableBuilder(
    column: $table.elapsedMs,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isRunning => $composableBuilder(
    column: $table.isRunning,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get runningSince => $composableBuilder(
    column: $table.runningSince,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ActiveTimersTableAnnotationComposer
    extends Composer<_$AppDatabase, $ActiveTimersTable> {
  $$ActiveTimersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get projectName => $composableBuilder(
    column: $table.projectName,
    builder: (column) => column,
  );

  GeneratedColumn<int> get elapsedMs =>
      $composableBuilder(column: $table.elapsedMs, builder: (column) => column);

  GeneratedColumn<bool> get isRunning =>
      $composableBuilder(column: $table.isRunning, builder: (column) => column);

  GeneratedColumn<DateTime> get runningSince => $composableBuilder(
    column: $table.runningSince,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$ActiveTimersTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ActiveTimersTable,
          ActiveTimer,
          $$ActiveTimersTableFilterComposer,
          $$ActiveTimersTableOrderingComposer,
          $$ActiveTimersTableAnnotationComposer,
          $$ActiveTimersTableCreateCompanionBuilder,
          $$ActiveTimersTableUpdateCompanionBuilder,
          (
            ActiveTimer,
            BaseReferences<_$AppDatabase, $ActiveTimersTable, ActiveTimer>,
          ),
          ActiveTimer,
          PrefetchHooks Function()
        > {
  $$ActiveTimersTableTableManager(_$AppDatabase db, $ActiveTimersTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ActiveTimersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ActiveTimersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ActiveTimersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> projectName = const Value.absent(),
                Value<int> elapsedMs = const Value.absent(),
                Value<bool> isRunning = const Value.absent(),
                Value<DateTime?> runningSince = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ActiveTimersCompanion(
                id: id,
                projectName: projectName,
                elapsedMs: elapsedMs,
                isRunning: isRunning,
                runningSince: runningSince,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String projectName,
                required int elapsedMs,
                required bool isRunning,
                Value<DateTime?> runningSince = const Value.absent(),
                required DateTime createdAt,
                required DateTime updatedAt,
                Value<int> rowid = const Value.absent(),
              }) => ActiveTimersCompanion.insert(
                id: id,
                projectName: projectName,
                elapsedMs: elapsedMs,
                isRunning: isRunning,
                runningSince: runningSince,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ActiveTimersTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ActiveTimersTable,
      ActiveTimer,
      $$ActiveTimersTableFilterComposer,
      $$ActiveTimersTableOrderingComposer,
      $$ActiveTimersTableAnnotationComposer,
      $$ActiveTimersTableCreateCompanionBuilder,
      $$ActiveTimersTableUpdateCompanionBuilder,
      (
        ActiveTimer,
        BaseReferences<_$AppDatabase, $ActiveTimersTable, ActiveTimer>,
      ),
      ActiveTimer,
      PrefetchHooks Function()
    >;
typedef $$PublishedTimersTableCreateCompanionBuilder =
    PublishedTimersCompanion Function({
      required String id,
      required String projectName,
      required int durationMs,
      required DateTime publishedAt,
      Value<int> rowid,
    });
typedef $$PublishedTimersTableUpdateCompanionBuilder =
    PublishedTimersCompanion Function({
      Value<String> id,
      Value<String> projectName,
      Value<int> durationMs,
      Value<DateTime> publishedAt,
      Value<int> rowid,
    });

class $$PublishedTimersTableFilterComposer
    extends Composer<_$AppDatabase, $PublishedTimersTable> {
  $$PublishedTimersTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get projectName => $composableBuilder(
    column: $table.projectName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get durationMs => $composableBuilder(
    column: $table.durationMs,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get publishedAt => $composableBuilder(
    column: $table.publishedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$PublishedTimersTableOrderingComposer
    extends Composer<_$AppDatabase, $PublishedTimersTable> {
  $$PublishedTimersTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get projectName => $composableBuilder(
    column: $table.projectName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get durationMs => $composableBuilder(
    column: $table.durationMs,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get publishedAt => $composableBuilder(
    column: $table.publishedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$PublishedTimersTableAnnotationComposer
    extends Composer<_$AppDatabase, $PublishedTimersTable> {
  $$PublishedTimersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get projectName => $composableBuilder(
    column: $table.projectName,
    builder: (column) => column,
  );

  GeneratedColumn<int> get durationMs => $composableBuilder(
    column: $table.durationMs,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get publishedAt => $composableBuilder(
    column: $table.publishedAt,
    builder: (column) => column,
  );
}

class $$PublishedTimersTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PublishedTimersTable,
          PublishedTimer,
          $$PublishedTimersTableFilterComposer,
          $$PublishedTimersTableOrderingComposer,
          $$PublishedTimersTableAnnotationComposer,
          $$PublishedTimersTableCreateCompanionBuilder,
          $$PublishedTimersTableUpdateCompanionBuilder,
          (
            PublishedTimer,
            BaseReferences<
              _$AppDatabase,
              $PublishedTimersTable,
              PublishedTimer
            >,
          ),
          PublishedTimer,
          PrefetchHooks Function()
        > {
  $$PublishedTimersTableTableManager(
    _$AppDatabase db,
    $PublishedTimersTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PublishedTimersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PublishedTimersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PublishedTimersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> projectName = const Value.absent(),
                Value<int> durationMs = const Value.absent(),
                Value<DateTime> publishedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => PublishedTimersCompanion(
                id: id,
                projectName: projectName,
                durationMs: durationMs,
                publishedAt: publishedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String projectName,
                required int durationMs,
                required DateTime publishedAt,
                Value<int> rowid = const Value.absent(),
              }) => PublishedTimersCompanion.insert(
                id: id,
                projectName: projectName,
                durationMs: durationMs,
                publishedAt: publishedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$PublishedTimersTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PublishedTimersTable,
      PublishedTimer,
      $$PublishedTimersTableFilterComposer,
      $$PublishedTimersTableOrderingComposer,
      $$PublishedTimersTableAnnotationComposer,
      $$PublishedTimersTableCreateCompanionBuilder,
      $$PublishedTimersTableUpdateCompanionBuilder,
      (
        PublishedTimer,
        BaseReferences<_$AppDatabase, $PublishedTimersTable, PublishedTimer>,
      ),
      PublishedTimer,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$ActiveTimersTableTableManager get activeTimers =>
      $$ActiveTimersTableTableManager(_db, _db.activeTimers);
  $$PublishedTimersTableTableManager get publishedTimers =>
      $$PublishedTimersTableTableManager(_db, _db.publishedTimers);
}
