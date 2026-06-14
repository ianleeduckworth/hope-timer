import 'package:drift/drift.dart';

class ActiveTimers extends Table {
  TextColumn get id => text()();
  TextColumn get projectName => text()();
  IntColumn get elapsedMs => integer()();
  BoolColumn get isRunning => boolean()();
  DateTimeColumn get runningSince => dateTime().nullable()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();

  @override
  Set<Column<Object>> get primaryKey => {id};
}
