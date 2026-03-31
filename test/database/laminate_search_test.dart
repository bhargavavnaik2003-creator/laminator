import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:kiosk_app/core/database/app_database.dart';
import 'package:kiosk_app/core/database/tables.dart';
import 'package:kiosk_app/core/services/database_service.dart';

// Helper — inserts a laminate row directly using a companion
Future<void> _insertLaminate(
  AppDatabase db, {
  required String code,
  required String name,
  required String patternCategory,
  String finishType = 'matte',
  String colorPrimary = '#FFFFFF',
  int catalogueId = 1,
}) {
  return db.into(db.laminatesTable).insert(
        LaminatesTableCompanion.insert(
          code: code,
          name: name,
          texturePath: 'assets/textures/placeholder.png',
          finishType: finishType,
          colorPrimary: colorPrimary,
          catalogueId: catalogueId,
          patternCategory: patternCategory,
        ),
      );
}

void main() {
  late AppDatabase db;
  late DatabaseService svc;

  setUp(() async {
    // In-memory DB — isolated per test, no file on disk
    db = AppDatabase.forTesting(NativeDatabase.memory());
    svc = DatabaseService(db);

    // Insert test fixtures
    await _insertLaminate(db,
        code: 'MR-OAK-001',
        name: 'Natural Oak',
        patternCategory: 'wood',
        finishType: 'woodmatt',
        colorPrimary: '#C8A96E');

    await _insertLaminate(db,
        code: 'MR-OAK-002',
        name: 'Smoked Oak',
        patternCategory: 'wood',
        finishType: 'matte',
        colorPrimary: '#7A5C3E');

    await _insertLaminate(db,
        code: 'MR-MAR-001',
        name: 'Calacatta White',
        patternCategory: 'stone',
        finishType: 'gloss',
        colorPrimary: '#F0EDEA',
        catalogueId: 2);

    await _insertLaminate(db,
        code: 'MR-PLN-001',
        name: 'Arctic White',
        patternCategory: 'plain',
        finishType: 'gloss',
        colorPrimary: '#FAFAFA',
        catalogueId: 3);
  });

  tearDown(() => db.close());

  // ── D10 Test 1: Search returns only matching laminates ────────────────────
  test('searching "OAK" returns only wood-pattern laminates', () async {
    final results = await svc.searchLaminates('OAK');

    expect(results.length, 2);
    expect(results.every((l) => l.patternCategory == 'wood'), isTrue);
    expect(results.map((l) => l.code),
        containsAll(['MR-OAK-001', 'MR-OAK-002']));
  });

  // ── D10 Test 2: Pattern filter works correctly ────────────────────────────
  test('getLaminatesByPattern("stone") returns only stone laminates', () async {
    final results = await svc.getLaminatesByPattern('stone');

    expect(results.length, 1);
    expect(results.first.code, 'MR-MAR-001');
  });

  // ── D10 Test 3: Catalogue filter ─────────────────────────────────────────
  test('getLaminatesByCatalogue(1) excludes other catalogues', () async {
    final results = await svc.getLaminatesByCatalogue(1);

    expect(results.length, 2); // only the two oak entries have catalogueId=1
    expect(results.every((l) => l.catalogueId == 1), isTrue);
  });

  // ── D10 Test 4: DB starts non-empty after fixture inserts ─────────────────
  test('isDatabaseEmpty returns false after seeding fixtures', () async {
    final isEmpty = await svc.isDatabaseEmpty();
    expect(isEmpty, isFalse);
  });

  // ── D10 Test 5: Save and retrieve user design ─────────────────────────────
  test('saveUserDesign persists and is retrievable', () async {
    // Need a room first
    await db.into(db.roomsTable).insert(RoomsTableCompanion.insert(
          name: 'Test Room',
          category: 'living',
          imagePath: '',
        ));

    final laminateId =
        (await svc.getLaminatesByCatalogue(1)).first.id;

    await svc.saveUserDesign(1, laminateId);

    final designs = await svc.getSavedDesigns();
    expect(designs.length, 1);
    expect(designs.first.roomId, 1);
    expect(designs.first.laminateId, laminateId);
  });
}
