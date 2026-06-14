// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'published_timers_dao.dart';

// ignore_for_file: type=lint
mixin _$PublishedTimersDaoMixin on DatabaseAccessor<AppDatabase> {
  $PublishedTimersTable get publishedTimers => attachedDatabase.publishedTimers;
  PublishedTimersDaoManager get managers => PublishedTimersDaoManager(this);
}

class PublishedTimersDaoManager {
  final _$PublishedTimersDaoMixin _db;
  PublishedTimersDaoManager(this._db);
  $$PublishedTimersTableTableManager get publishedTimers =>
      $$PublishedTimersTableTableManager(
        _db.attachedDatabase,
        _db.publishedTimers,
      );
}
