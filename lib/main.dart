import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'core/database/app_database.dart';
import 'core/services/seed_service.dart';
import 'shared/theme/app_theme.dart';
import 'features/catalogue/presentation/catalogue_screen.dart';
import 'features/visualizer/presentation/room_picker_screen.dart';
import 'features/visualizer/presentation/visualizer_screen.dart';

/// Application entry point.
/// Seeds the database on first run before the UI starts.
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // D9: Seed the database if it is empty (runs once, no-op after that)
  final db = AppDatabase();
  await seedDatabaseIfEmpty(db);
  await db.close();

  runApp(
    // Riverpod: wraps the entire app so any widget can read providers
    const ProviderScope(
      child: KioskApp(),
    ),
  );
}

/// Application GoRouter — manages deep linking and backstack.
final _router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const RoomPickerScreen(),
    ),
    GoRoute(
      path: '/catalogue',
      builder: (context, state) => const CatalogueScreen(),
    ),
    GoRoute(
      path: '/visualizer/:roomId',
      builder: (context, state) {
        final roomId = int.tryParse(state.pathParameters['roomId'] ?? '1') ?? 1;
        return VisualizerScreen(roomId: roomId);
      },
    ),
  ],
);

class KioskApp extends StatelessWidget {
  const KioskApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Merino Kiosk',
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      routerConfig: _router,
    );
  }
}
