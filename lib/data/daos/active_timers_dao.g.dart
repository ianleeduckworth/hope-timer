// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'active_timers_dao.dart';

// ignore_for_file: type=lint
mixin _$ActiveTimersDaoMixin on DatabaseAccessor<AppDatabase> {
  $ActiveTimersTable get activeTimers => attachedDatabase.activeTimers;
  $PublishedTimersTable get publishedTimers => attachedDatabase.publishedTimers;
  ActiveTimersDaoManager get managers => ActiveTimersDaoManager(this);
}

class ActiveTimersDaoManager {
  final _$ActiveTimersDaoMixin _db;
  ActiveTimersDaoManager(this._db);
  $$ActiveTimersTableTableManager get activeTimers =>
      $$ActiveTimersTableTableManager(_db.attachedDatabase, _db.activeTimers);
  $$PublishedTimersTableTableManager get publishedTimers =>
      $$PublishedTimersTableTableManager(
        _db.attachedDatabase,
        _db.publishedTimers,
      );
}
