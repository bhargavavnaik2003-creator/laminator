import 'package:drift/drift.dart';

import '../database/app_database.dart';
import '../database/tables.dart';

/// Abstraction layer between the UI/providers and the raw Drift database.
///
/// The UI never calls AppDatabase directly — it always goes through this service.
class DatabaseService {
  final AppDatabase _db;

  DatabaseService(this._db);

  // ── Laminates ─────────────────────────────────────────────────────────────

  /// Reactive stream of all laminates — UI rebuilds automatically on DB change.
  Stream<List<LaminatesTableData>> watchAllLaminates() =>
      _db.select(_db.laminatesTable).watch();

  /// Filter by catalogue (e.g. "Collection A" vs "Budget Range").
  Future<List<LaminatesTableData>> getLaminatesByCatalogue(int catalogueId) {
    return (_db.select(_db.laminatesTable)
          ..where((t) => t.catalogueId.equals(catalogueId)))
        .get();
  }

  /// Case-insensitive search across code and name.
  Future<List<LaminatesTableData>> searchLaminates(String query) {
    final q = query.toLowerCase();
    return (_db.select(_db.laminatesTable)
          ..where(
            (t) => t.code.lower().like('%$q%') | t.name.lower().like('%$q%'),
          ))
        .get();
  }

  /// Filter by pattern category (wood | stone | fabric | plain).
  Future<List<LaminatesTableData>> getLaminatesByPattern(String pattern) {
    return (_db.select(_db.laminatesTable)
          ..where((t) => t.patternCategory.equals(pattern)))
        .get();
  }

  /// Bulk insert — used by the seed service.
  Future<void> insertLaminates(List<LaminatesTableCompanion> rows) {
    return _db.batch((b) => b.insertAll(_db.laminatesTable, rows));
  }

  // ── Rooms ──────────────────────────────────────────────────────────────────

  /// All rooms for a given category.
  Future<List<RoomsTableData>> getRoomsByCategory(String category) {
    return (_db.select(_db.roomsTable)
          ..where((t) => t.category.equals(category)))
        .get();
  }

  /// All rooms (for the room picker grid).
  Future<List<RoomsTableData>> getAllRooms() =>
      _db.select(_db.roomsTable).get();

  /// Bulk insert — used by the seed service.
  Future<void> insertRooms(List<RoomsTableCompanion> rows) {
    return _db.batch((b) => b.insertAll(_db.roomsTable, rows));
  }

  // ── Room Surfaces ──────────────────────────────────────────────────────────

  Future<List<RoomSurfacesTableData>> getSurfacesForRoom(int roomId) {
    return (_db.select(_db.roomSurfacesTable)
          ..where((t) => t.roomId.equals(roomId)))
        .get();
  }

  // ── User Designs ───────────────────────────────────────────────────────────

  /// Save a room + laminate pairing chosen by the user.
  Future<int> saveUserDesign(int roomId, int laminateId) {
    return _db.into(_db.userDesignsTable).insert(
          UserDesignsTableCompanion.insert(
            roomId: roomId,
            laminateId: laminateId,
          ),
        );
  }

  /// All saved designs, newest first.
  Future<List<UserDesignsTableData>> getSavedDesigns() {
    return (_db.select(_db.userDesignsTable)
          ..orderBy([(t) => OrderingTerm.desc(t.savedAt)]))
        .get();
  }

  // ── Utility ────────────────────────────────────────────────────────────────

  /// True if the laminates table has no rows (triggers seeding).
  Future<bool> isDatabaseEmpty() async {
    final count = await _db.select(_db.laminatesTable).get();
    return count.isEmpty;
  }

  Future<void> close() => _db.close();
}
