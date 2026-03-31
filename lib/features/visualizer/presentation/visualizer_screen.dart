import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../catalogue/presentation/catalogue_provider.dart';
import 'room_picker_screen.dart';

/// The 2D Stencil Visualizer Engine.
/// Layers a static base photo with a transparent stencil mask tinted via BlendMode.multiply.
class VisualizerScreen extends ConsumerWidget {
  final int roomId;

  const VisualizerScreen({super.key, required this.roomId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Both laminate and room were picked on previous screens
    final room = ref.watch(selectedRoomProvider);
    final selectedLaminates = ref.watch(selectedLaminatesMapProvider);
    final activeSurfaceId = ref.watch(activeSurfaceProvider);
    final theme = Theme.of(context);

    // Safety fallback if deep-linked without a valid room
    if (room == null) {
      return Scaffold(
        body: Center(
          child: ElevatedButton(
            onPressed: () => context.go('/'),
            child: const Text('Return Home'),
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(room.name),
        backgroundColor: Colors.black45, // Translucent to see the room behind
        elevation: 0,
        leading: BackButton(
          onPressed: () => context.pop(),
        ),
        actions: [
          TextButton.icon(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Design Saved!')),
              );
            },
            icon: const Icon(Icons.bookmark_border, color: Colors.white),
            label: const Text('Save Design',
                style: TextStyle(color: Colors.white)),
          ),
          const SizedBox(width: 16),
        ],
      ),
      extendBodyBehindAppBar: true,
      body: Column(
        children: [
          Expanded(
            child: Stack(
              fit: StackFit.expand,
              children: [
          // ── 1. The Base Photo (.jpg) ─────────────────────────────────
          // This layer remains static and provides the "real-world" context.
          _ImageLayer(
            imagePath: room.imagePath,
            placeholderLabel: 'Base Photo\n(Static .jpg)',
            placeholderColor: const Color(0xFF2C3E50),
          ),

          // ── 2. The dynamic Surfaces (Masks) ──────────────────────────
          // Renders an _ImageLayer for EVERY surface linked to this room.
          ...ref.watch(roomSurfacesProvider(room.id)).when(
            data: (surfaces) {
              return surfaces.map((s) {
                final lam = selectedLaminates[s.id];
                final laminateColor = lam != null ? _hexToColor(lam.colorPrimary) : Colors.white;

                return _ImageLayer(
                  imagePath: s.maskPath,
                  placeholderLabel: 'Surface\n${s.name}',
                  placeholderColor: laminateColor,
                  blendMode: BlendMode.srcATop, // Uses the user's preferred blending
                );
              }).toList();
            },
            loading: () => const [Center(child: CircularProgressIndicator())],
            error: (err, stack) => const [],
          ),
              ],
            ),
          ),

          // ── Laminate Picker Panel ─────────────────────────
          Container(
            height: 230, // Fits Surface, Category, and Swatches
            decoration: const BoxDecoration(
              color: Color(0xFF141414), // Completely opaque for visual hierarchy
              border: Border(top: BorderSide(color: Colors.white24)),
            ),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 1. Surface Picker Chips
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
                    child: ref.watch(roomSurfacesProvider(room.id)).when(
                      data: (surfaces) {
                        if (surfaces.isEmpty) return const SizedBox();
                        
                        // Auto-select the first surface if none is selected yet
                        if (activeSurfaceId == null) {
                          WidgetsBinding.instance.addPostFrameCallback((_) {
                            ref.read(activeSurfaceProvider.notifier).update(surfaces.first.id);
                          });
                        }

                        return Row(
                          children: [
                            const Text('Surface: ', style: TextStyle(color: Colors.white70, fontSize: 13)),
                            const SizedBox(width: 8),
                            Expanded(
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Wrap(
                                  spacing: 8,
                                  children: surfaces.map((s) {
                                    final isActive = activeSurfaceId == s.id;
                                    return ChoiceChip(
                                      label: Text(s.name, style: TextStyle(color: isActive ? Colors.black : Colors.white, fontSize: 12)),
                                      selected: isActive,
                                      selectedColor: theme.colorScheme.primary,
                                      onSelected: (selected) {
                                        if (selected) ref.read(activeSurfaceProvider.notifier).update(s.id);
                                      },
                                    );
                                  }).toList(),
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                      loading: () => const SizedBox(),
                      error: (_,__) => const SizedBox(),
                    ),
                  ),

                  // 2. Category Filter Row
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 4, 16, 4),
                    child: Row(
                      children: [
                        const Text('Filter: ', style: TextStyle(color: Colors.white70, fontSize: 13)),
                        const SizedBox(width: 14),
                        Expanded(
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Wrap(
                              spacing: 8,
                              children: ['All', 'Wood', 'Stone', 'Plain', 'Fabric'].map((cat) {
                                final activeCat = ref.watch(visualizerCategoryProvider);
                                final isActive = (cat == 'All' && activeCat.isEmpty) || (cat.toLowerCase() == activeCat);
                                return ChoiceChip(
                                  label: Text(cat, style: TextStyle(fontSize: 12, color: isActive ? Colors.white : Colors.white70)),
                                  selected: isActive,
                                  selectedColor: Colors.white24,
                                  backgroundColor: Colors.transparent,
                                  shape: StadiumBorder(side: BorderSide(color: isActive ? Colors.white54 : Colors.white12)),
                                  onSelected: (selected) {
                                    ref.read(visualizerCategoryProvider.notifier).update(cat == 'All' ? '' : cat.toLowerCase());
                                  },
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // 3. Laminate Swatches Row
                  Expanded(
                    child: Consumer(
                      builder: (context, ref, child) {
                        final laminatesAsync = ref.watch(allLaminatesProvider);
                        final activeCat = ref.watch(visualizerCategoryProvider);
                        
                        return laminatesAsync.when(
                          data: (allLams) {
                            // Filter the list if a category is selected
                            final filteredLams = activeCat.isEmpty 
                                ? allLams 
                                : allLams.where((l) => l.patternCategory == activeCat).toList();

                            if (filteredLams.isEmpty) {
                              return const Center(child: Text('No laminates in this category.'));
                            }

                            return ListView.builder(
                              scrollDirection: Axis.horizontal,
                              padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
                              itemCount: filteredLams.length,
                              itemBuilder: (context, idx) {
                                final lam = filteredLams[idx];
                                final isSelectedForActiveSurface = 
                                    activeSurfaceId != null && selectedLaminates[activeSurfaceId]?.id == lam.id;
                                
                                return Padding(
                                  padding: const EdgeInsets.only(right: 12),
                                  child: InkWell(
                                    onTap: () {
                                      if (activeSurfaceId != null) {
                                        ref.read(selectedLaminatesMapProvider.notifier).updateSurface(activeSurfaceId, lam);
                                      } else {
                                        ScaffoldMessenger.of(context).showSnackBar(
                                          const SnackBar(content: Text('Please select a Surface (like TV Unit) first!'))
                                        );
                                      }
                                    },
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: 50,
                                          height: 50,
                                          decoration: BoxDecoration(
                                            color: _hexToColor(lam.colorPrimary),
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                              color: isSelectedForActiveSurface ? Colors.white : Colors.transparent,
                                              width: 3,
                                            ),
                                            boxShadow: [
                                              if (isSelectedForActiveSurface)
                                                BoxShadow(color: Colors.white.withValues(alpha: 0.5), blurRadius: 8)
                                            ],
                                          ),
                                        ),
                                        const SizedBox(height: 4),
                                        SizedBox(
                                          width: 65,
                                          child: Text(
                                            lam.name.length > 10 ? lam.name.substring(0,9) + '...' : lam.name, 
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(color: Colors.white, fontSize: 10),
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 1,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                          loading: () => const Center(child: CircularProgressIndicator()),
                          error: (err, stack) => const Center(child: Text('Error')),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }

  Color _hexToColor(String hex) {
    try {
      return Color(int.parse(hex.replaceFirst('#', '0xFF')));
    } catch (_) {
      return Colors.grey;
    }
  }
}

/// Helper widget to render local image assets with an optional Color/BlendMode.
/// Falls back to a colored placeholder if the image file isn't physically present yet.
class _ImageLayer extends StatelessWidget {
  final String imagePath;
  final String placeholderLabel;
  final Color placeholderColor;
  final BlendMode? blendMode;

  const _ImageLayer({
    required this.imagePath,
    required this.placeholderLabel,
    required this.placeholderColor,
    this.blendMode,
  });

  @override
  Widget build(BuildContext context) {
    // Check if the asset file exists physically on disk
    final fileExists = File(imagePath).existsSync();

    if (fileExists) {
      if (blendMode != null && placeholderColor != Colors.transparent) {
        // The TARGETED TINT (The Magic)
        return ColorFiltered(
          colorFilter: ColorFilter.mode(
            // Use alpha: 0.7 to allow grain to show, just like the Merino example!
            placeholderColor.withValues(alpha: 0.7),
            blendMode!,
          ),
          child: Image.asset(
            imagePath, // MUST BE TRANSPARENT PNG
            fit: BoxFit.contain,
          ),
        );
      } else {
        // The Base Room Layer (Static)
        return Image.asset(
          imagePath,
          fit: BoxFit.contain,
        );
      }
    } else {
      // Dummy placeholder when assets are missing
      return Container(
        color: placeholderColor.withValues(alpha: blendMode != null ? 0.8 : 1.0),
        child: Center(
          child: Text(
            '$placeholderLabel\nMissing: $imagePath',
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
              shadows: [Shadow(blurRadius: 10, color: Colors.black)],
            ),
          ),
        ),
      );
    }
  }
}
