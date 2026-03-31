import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/database/app_database.dart';
import '../../../core/services/providers.dart';

/// The current search string typed in the search bar.
class SearchQueryNotifier extends Notifier<String> {
  @override
  String build() => '';
  void update(String value) => state = value;
}
final searchQueryProvider =
    NotifierProvider<SearchQueryNotifier, String>(SearchQueryNotifier.new);

/// The active pattern category filter. Empty string = "All".
class PatternFilterNotifier extends Notifier<String> {
  @override
  String build() => '';
  void update(String value) => state = value;
}
final patternFilterProvider =
    NotifierProvider<PatternFilterNotifier, String>(PatternFilterNotifier.new);

/// The currently selected laminate (shown highlighted in the grid).
class SelectedLaminateNotifier extends Notifier<LaminatesTableData?> {
  @override
  LaminatesTableData? build() => null;
  void update(LaminatesTableData? value) => state = value;
}
final selectedLaminateProvider =
    NotifierProvider<SelectedLaminateNotifier, LaminatesTableData?>(
        SelectedLaminateNotifier.new);

/// Derived provider — returns the filtered list of laminates.
/// Reacts to both [searchQueryProvider] and [patternFilterProvider].
final filteredLaminatesProvider =
    FutureProvider<List<LaminatesTableData>>((ref) async {
  final svc = ref.watch(databaseServiceProvider);
  final query = ref.watch(searchQueryProvider).trim();
  final pattern = ref.watch(patternFilterProvider);

  List<LaminatesTableData> results;

  if (query.isNotEmpty) {
    results = await svc.searchLaminates(query);
  } else if (pattern.isNotEmpty) {
    results = await svc.getLaminatesByPattern(pattern);
  } else {
    results = await svc.watchAllLaminates().first;
  }

  return results;
});

/// Provider for all rooms (used in Room Picker).
final allRoomsProvider = FutureProvider<List<RoomsTableData>>((ref) {
  return ref.watch(databaseServiceProvider).getAllRooms();
});

/// Provider for all laminates raw list (used in Visualizer).
final allLaminatesProvider = FutureProvider<List<LaminatesTableData>>((ref) async {
  return ref.watch(databaseServiceProvider).watchAllLaminates().first;
});

// ── Multi-Surface State ────────────────────────────────────────────────────────

/// Fetches the available surfaces for a room.
final roomSurfacesProvider = FutureProvider.family<List<RoomSurfacesTableData>, int>((ref, roomId) {
  return ref.watch(databaseServiceProvider).getSurfacesForRoom(roomId);
});

/// The active laminate pattern category filter inside the visualizer.
class VisualizerCategoryNotifier extends Notifier<String> {
  @override
  String build() => ''; // '' = Show All
  void update(String value) => state = value;
}
final visualizerCategoryProvider =
    NotifierProvider<VisualizerCategoryNotifier, String>(VisualizerCategoryNotifier.new);

/// The active surface the user is currently editing (e.g. 1 for "TV Unit").
class ActiveSurfaceNotifier extends Notifier<int?> {
  @override
  int? build() => null;
  void update(int? surfaceId) => state = surfaceId;
}
final activeSurfaceProvider =
    NotifierProvider<ActiveSurfaceNotifier, int?>(ActiveSurfaceNotifier.new);

/// Map of surfaceId -> LaminatesTableData
class SelectedLaminatesNotifier extends Notifier<Map<int, LaminatesTableData>> {
  @override
  Map<int, LaminatesTableData> build() => {};

  void updateSurface(int surfaceId, LaminatesTableData laminate) {
    state = {...state, surfaceId: laminate};
  }
}
final selectedLaminatesMapProvider =
    NotifierProvider<SelectedLaminatesNotifier, Map<int, LaminatesTableData>>(
        SelectedLaminatesNotifier.new);
