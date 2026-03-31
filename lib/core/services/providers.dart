import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../database/app_database.dart';
import '../services/database_service.dart';

/// Provides the single AppDatabase instance for the whole app lifetime.
final appDatabaseProvider = Provider<AppDatabase>((ref) {
  final db = AppDatabase();
  ref.onDispose(db.close);
  return db;
});

/// Provides the DatabaseService, which all UI providers use.
final databaseServiceProvider = Provider<DatabaseService>((ref) {
  return DatabaseService(ref.watch(appDatabaseProvider));
});

/// Reactive stream of all laminates — rebuilds any Consumer that watches it.
final allLaminatesProvider = StreamProvider((ref) {
  return ref.watch(databaseServiceProvider).watchAllLaminates();
});
