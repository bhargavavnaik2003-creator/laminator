import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:flutter/services.dart';

import '../database/app_database.dart';
import '../database/tables.dart';
import '../../features/catalogue/domain/laminate_model.dart';
import '../../features/visualizer/domain/room_model.dart';

/// Checks if the database is empty and, if so, seeds it from
/// `assets/data/initial_data.json`.
///
/// Call this once in `main()` before `runApp`.
Future<void> seedDatabaseIfEmpty(AppDatabase db) async {
  // 1. Check if already seeded (by checking the NEW surfaces table)
  final existingSurfaces = await db.select(db.roomSurfacesTable).get();
  if (existingSurfaces.isNotEmpty) return;

  // If surfaces are missing, we are migrating to Phase 5. Clear old data to prevent ID conflicts.
  await db.delete(db.roomSurfacesTable).go();
  await db.delete(db.userDesignsTable).go();
  await db.delete(db.roomsTable).go();
  await db.delete(db.laminatesTable).go();

  // 2. Load the JSON asset
  final rawJson =
      await rootBundle.loadString('assets/data/initial_data.json');
  final data = jsonDecode(rawJson) as Map<String, dynamic>;

  // 3. Parse laminates
  final laminates = (data['laminates'] as List)
      .map((e) => LaminateModel.fromJson(e as Map<String, dynamic>))
      .toList();

  // 4. Parse rooms
  final rooms = (data['rooms'] as List)
      .map((e) => RoomModel.fromJson(e as Map<String, dynamic>))
      .toList();

  // 5. Batch insert everything in one transaction
  await db.batch((batch) {
    batch.insertAll(
      db.laminatesTable,
      laminates.map(
        (l) => LaminatesTableCompanion.insert(
          code: l.code,
          name: l.name,
          texturePath: l.texturePath,
          finishType: l.finishType,
          colorPrimary: l.colorPrimary,
          catalogueId: l.catalogueId,
          patternCategory: l.patternCategory,
        ),
      ),
    );

    batch.insertAll(
      db.roomsTable,
      rooms.map(
        (r) => RoomsTableCompanion.insert(
          id: Value(r.id), // Explicitly passing ID since surfaces rely on it
          name: r.name,
          category: r.category,
          imagePath: r.imagePath,
        ),
      ),
    );

    // Insert all surfaces across all rooms
    final allSurfaces = rooms.expand((r) => r.surfaces).toList();
    batch.insertAll(
      db.roomSurfacesTable,
      allSurfaces.map(
        (s) => RoomSurfacesTableCompanion.insert(
          id: Value(s.id),
          roomId: s.roomId,
          name: s.name,
          maskPath: s.maskPath,
        ),
      ),
    );
  });

  // ignore: avoid_print
  print('[SeedService] ✅ Seeded ${laminates.length} laminates'
      ' and ${rooms.length} rooms.');
}
