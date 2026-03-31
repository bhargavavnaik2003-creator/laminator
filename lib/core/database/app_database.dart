import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';

import 'tables.dart';

part 'app_database.g.dart';

/// The single Drift database for the kiosk app.
///
/// Schema version history:
///   v1 — initial: laminates, rooms, user_designs tables.
@DriftDatabase(tables: [LaminatesTable, RoomsTable, RoomSurfacesTable, UserDesignsTable])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  /// In-memory constructor for unit tests — keeps tests isolated.
  AppDatabase.forTesting(super.executor);

  @override
  int get schemaVersion => 2;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onCreate: (m) => m.createAll(),
        onUpgrade: (m, from, to) async {
          if (from == 1) {
            // Add the new table for Phase 5 Multi-Surfaces
            await m.createTable(roomSurfacesTable);
            // (We also dropped columns from roomsTable, but SQLite ignores them physically)
          }
        },
      );
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    return driftDatabase(name: 'app_database_v5');
  });
}
