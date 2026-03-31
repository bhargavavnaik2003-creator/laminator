import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'catalogue_provider.dart';
import '../../../shared/theme/style_constants.dart';

/// Search bar + filter chips row for the catalogue screen.
class CatalogueSearchBar extends ConsumerStatefulWidget {
  const CatalogueSearchBar({super.key});

  @override
  ConsumerState<CatalogueSearchBar> createState() =>
      _CatalogueSearchBarState();
}

class _CatalogueSearchBarState
    extends ConsumerState<CatalogueSearchBar> {
  late final TextEditingController _ctrl;

  static const _categories = [
    ('All', ''),
    ('Wood', 'wood'),
    ('Stone', 'stone'),
    ('Plain', 'plain'),
    ('Fabric', 'fabric'),
  ];

  @override
  void initState() {
    super.initState();
    _ctrl = TextEditingController();
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final activeFilter = ref.watch(patternFilterProvider);
    final theme = Theme.of(context);

    return Column(
      children: [
        // ── Search Field ───────────────────────────────────────────
        TextField(
          controller: _ctrl,
          onChanged: (v) =>
              ref.read(searchQueryProvider.notifier).update(v),
          style: theme.textTheme.bodyMedium,
          decoration: InputDecoration(
            hintText: 'Search by name or code…',
            hintStyle: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.onSurface.withValues(alpha: 0.4),
            ),
            prefixIcon: const Icon(Icons.search, size: 20),
            suffixIcon: _ctrl.text.isNotEmpty
                ? IconButton(
                    icon: const Icon(Icons.clear, size: 18),
                    onPressed: () {
                      _ctrl.clear();
                      ref.read(searchQueryProvider.notifier).update('');
                    },
                  )
                : null,
            filled: true,
            fillColor: theme.colorScheme.surface.withValues(alpha: 0.6),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: StyleConstants.spaceMd,
              vertical: StyleConstants.spaceSm,
            ),
            border: OutlineInputBorder(
              borderRadius:
                  BorderRadius.circular(StyleConstants.radiusMd),
              borderSide: BorderSide.none,
            ),
          ),
        ),

        const SizedBox(height: StyleConstants.spaceSm),

        // ── Filter Chips ───────────────────────────────────────────
        SizedBox(
          height: 34,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: _categories.length,
            separatorBuilder: (_, __) =>
                const SizedBox(width: StyleConstants.spaceSm),
            itemBuilder: (_, i) {
              final (label, value) = _categories[i];
              final selected = activeFilter == value;
              return FilterChip(
                label: Text(label,
                    style: theme.textTheme.labelSmall?.copyWith(
                      fontSize: 11,
                      color: selected
                          ? Colors.white
                          : theme.colorScheme.onSurface
                              .withValues(alpha: 0.7),
                    )),
                selected: selected,
                onSelected: (_) {
                  ref.read(patternFilterProvider.notifier).update(value);
                  // Clear text search when switching filters
                  _ctrl.clear();
                  ref.read(searchQueryProvider.notifier).update('');
                },
                selectedColor:
                    theme.colorScheme.primary.withValues(alpha: 0.8),
                backgroundColor: theme.colorScheme.surface
                    .withValues(alpha: 0.4),
                checkmarkColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 4),
                visualDensity: VisualDensity.compact,
              );
            },
          ),
        ),
      ],
    );
  }
}
