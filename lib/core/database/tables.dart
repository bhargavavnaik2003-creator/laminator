import 'package:drift/drift.dart';

// ── Laminates ─────────────────────────────────────────────────────────────────

/// Stores all laminate products.
class LaminatesTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get code => text().unique()();
  TextColumn get name => text()();
  TextColumn get texturePath => text()();
  TextColumn get finishType => text()(); // matte | gloss | suede | woodmatt
  TextColumn get colorPrimary => text()(); // hex for AI colour matching
  IntColumn get catalogueId => integer()();
  TextColumn get patternCategory => text()(); // wood | stone | fabric | plain
}

// ── Rooms ─────────────────────────────────────────────────────────────────────

/// Stores the room presets used in the visualizer.
class RoomsTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  TextColumn get category => text()(); // living | bedroom | kitchen | bathroom
  TextColumn get imagePath => text()();
}

/// Stores the distinct customizable surfaces/zones within a room.
class RoomSurfacesTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get roomId => integer().references(RoomsTable, #id)();
  TextColumn get name => text()(); // e.g. "TV Cabinet"
  TextColumn get maskPath => text()(); // e.g. "assets/rooms/masks/tv.png"
}

// ── User Designs ──────────────────────────────────────────────────────────────

/// Persists a user's room + laminate pairing (saved designs).
class UserDesignsTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get roomId =>
      integer().references(RoomsTable, #id)();
  IntColumn get laminateId =>
      integer().references(LaminatesTable, #id)();
  DateTimeColumn get savedAt =>
      dateTime().withDefault(currentDateAndTime)();
}
