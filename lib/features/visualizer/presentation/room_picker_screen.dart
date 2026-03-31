import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../catalogue/presentation/catalogue_provider.dart';
import '../../../core/database/app_database.dart';
import '../../../shared/widgets/room_card.dart';
import '../../../shared/theme/style_constants.dart';

/// The currently selected room preset.
class SelectedRoomNotifier extends Notifier<RoomsTableData?> {
  @override
  RoomsTableData? build() => null;
  void update(RoomsTableData? value) => state = value;
}
final selectedRoomProvider =
    NotifierProvider<SelectedRoomNotifier, RoomsTableData?>(SelectedRoomNotifier.new);

/// Screen to select a room preset before entering the visualizer.
class RoomPickerScreen extends ConsumerWidget {
  const RoomPickerScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watch all rooms from Drift via the Provider
    final roomsAsync = ref.watch(allRoomsProvider);
    final selectedRoom = ref.watch(selectedRoomProvider);
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Choose a Room Preset'),
      ),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ── LEFT: Instructions & CTA ─────────────────────────────────
          Container(
            width: 320,
            padding: const EdgeInsets.all(StyleConstants.spaceLg),
            decoration: BoxDecoration(
              border: Border(
                right: BorderSide(
                  color: Colors.white.withValues(alpha: 0.1),
                  width: 1,
                ),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Your Canvas',
                  style: theme.textTheme.displayLarge?.copyWith(fontSize: 28),
                ),
                const SizedBox(height: StyleConstants.spaceSm),
                Text(
                  'Select a room to see how your chosen laminate looks in a real space.',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: Colors.white70,
                    height: 1.5,
                  ),
                ),
                const Spacer(),
                const Spacer(),
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                    onPressed: () => context.push('/catalogue'),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.white,
                    ),
                    child: const Text('Browse Full Catalogue'),
                  ),
                ),
              ],
            ),
          ),

          // ── RIGHT: Room Grid ──────────────────────────────────────────
          Expanded(
            child: roomsAsync.when(
              data: (rooms) {
                if (rooms.isEmpty) {
                  return const Center(child: Text('No rooms available.'));
                }

                return GridView.builder(
                  padding: const EdgeInsets.all(StyleConstants.spaceLg),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: StyleConstants.spaceLg,
                    crossAxisSpacing: StyleConstants.spaceLg,
                    childAspectRatio: 0.9,
                  ),
                  itemCount: rooms.length,
                  itemBuilder: (context, index) {
                    final room = rooms[index];
                    return RoomCard(
                      room: room,
                      isSelected: selectedRoom?.id == room.id,
                      onTap: () {
                        ref.read(selectedRoomProvider.notifier).update(room);
                        context.push('/visualizer/${room.id}');
                      },
                    );
                  },
                );
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (err, stack) => Center(child: Text('Error: $err')),
            ),
          ),
        ],
      ),
    );
  }
}
