// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'analytics_dao.dart';

// ignore_for_file: type=lint
mixin _$AnalyticsDaoMixin on DatabaseAccessor<AppDatabase> {
  $PublishedTimersTable get publishedTimers => attachedDatabase.publishedTimers;
  AnalyticsDaoManager get managers => AnalyticsDaoManager(this);
}

class AnalyticsDaoManager {
  final _$AnalyticsDaoMixin _db;
  AnalyticsDaoManager(this._db);
  $$PublishedTimersTableTableManager get publishedTimers =>
      $$PublishedTimersTableTableManager(
        _db.attachedDatabase,
        _db.publishedTimers,
      );
}
