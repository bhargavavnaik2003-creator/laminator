import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'catalogue_provider.dart';
import 'search_bar_widget.dart';
import '../../visualizer/presentation/room_picker_screen.dart';
import '../../../shared/widgets/laminate_card.dart';
import '../../../shared/theme/style_constants.dart';

/// The main entry screen: shows the catalogue of laminates.
class CatalogueScreen extends ConsumerWidget {
  const CatalogueScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watch the combined filtered stream (search + pattern category)
    final filteredData = ref.watch(filteredLaminatesProvider);
    final selectedLaminate = ref.watch(selectedLaminateProvider);
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Merino Laminate Catalogue'),
        actions: [
          // Nav button to jump straight to Room Picker
          TextButton.icon(
            onPressed: () => context.push('/rooms'),
            icon: const Icon(Icons.meeting_room, color: Colors.white),
            label: const Text('Rooms', style: TextStyle(color: Colors.white)),
          ),
          const SizedBox(width: StyleConstants.spaceMd),
        ],
      ),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ── LEFT: Filters & Search ─────────────────────────────────────
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
                  'Explore',
                  style: theme.textTheme.displayLarge?.copyWith(fontSize: 28),
                ),
                const SizedBox(height: StyleConstants.spaceMd),
                const CatalogueSearchBar(),
                const Spacer(),

                // "Next" button — only active if a laminate is selected
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: selectedLaminate != null
                        ? () => context.push('/rooms')
                        : null,
                    child: Text(
                      selectedLaminate != null
                          ? 'Select Room →'
                          : 'Choose a Laminate',
                    ),
                  ),
                ),
              ],
            ),
          ),

          // ── RIGHT: Laminate Grid ───────────────────────────────────────
          Expanded(
            child: filteredData.when(
              data: (laminates) {
                if (laminates.isEmpty) {
                  return Center(
                    child: Text(
                      'No laminates found.',
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: Colors.white54,
                      ),
                    ),
                  );
                }

                return GridView.builder(
                  padding: const EdgeInsets.all(StyleConstants.spaceLg),
                  gridDelegate:
                      const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200,
                    mainAxisSpacing: StyleConstants.spaceLg,
                    crossAxisSpacing: StyleConstants.spaceLg,
                    childAspectRatio: 0.85,
                  ),
                  itemCount: laminates.length,
                  itemBuilder: (context, index) {
                    final lam = laminates[index];
                    return LaminateCard(
                      laminate: lam,
                      isSelected: selectedLaminate?.id == lam.id,
                      onTap: () {
                        ref.read(selectedLaminateProvider.notifier).update(lam);
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
