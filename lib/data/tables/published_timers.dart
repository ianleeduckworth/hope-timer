import 'package:drift/drift.dart';

class PublishedTimers extends Table {
  TextColumn get id => text()();
  TextColumn get projectName => text()();
  IntColumn get durationMs => integer()();
  DateTimeColumn get publishedAt => dateTime()();

  @override
  Set<Column<Object>> get primaryKey => {id};
}
