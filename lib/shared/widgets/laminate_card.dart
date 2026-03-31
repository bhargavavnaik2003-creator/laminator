import 'package:flutter/material.dart';

import '../../core/database/app_database.dart';
import '../theme/style_constants.dart';

/// A single laminate card shown in the catalogue grid.
/// Displays a colour swatch, code, name, finish badge, and pattern category.
class LaminateCard extends StatelessWidget {
  final LaminatesTableData laminate;
  final bool isSelected;
  final VoidCallback? onTap;

  const LaminateCard({
    super.key,
    required this.laminate,
    this.isSelected = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final color = _hexToColor(laminate.colorPrimary);
    final theme = Theme.of(context);

    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        decoration: BoxDecoration(
          color: theme.cardTheme.color,
          borderRadius: BorderRadius.circular(StyleConstants.radiusMd),
          border: Border.all(
            color: isSelected
                ? theme.colorScheme.primary
                : Colors.white10,
            width: isSelected ? 2.0 : 1.0,
          ),
          boxShadow: [
            BoxShadow(
              color: isSelected
                  ? theme.colorScheme.primary.withValues(alpha: 0.3)
                  : Colors.black26,
              blurRadius: isSelected ? 12 : 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ── Colour Swatch ──────────────────────────────────────
            Expanded(
              flex: 3,
              child: Container(
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(StyleConstants.radiusMd),
                  ),
                ),
                child: isSelected
                    ? Center(
                        child: Icon(
                          Icons.check_circle,
                          color: _contrastColor(color),
                          size: 28,
                        ),
                      )
                    : null,
              ),
            ),

            // ── Info ───────────────────────────────────────────────
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(StyleConstants.spaceSm),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      laminate.name,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                        fontSize: 11,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      laminate.code,
                      style: theme.textTheme.labelSmall?.copyWith(
                        color: theme.colorScheme.onSurface.withValues(alpha: 0.5),
                      ),
                      maxLines: 1,
                    ),
                    // Finish badge
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 6,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color: _finishColor(laminate.finishType)
                            .withValues(alpha: 0.2),
                        borderRadius:
                            BorderRadius.circular(StyleConstants.radiusXs),
                      ),
                      child: Text(
                        laminate.finishType.toUpperCase(),
                        style: theme.textTheme.labelSmall?.copyWith(
                          fontSize: 8,
                          color: _finishColor(laminate.finishType),
                          fontWeight: FontWeight.w700,
                          letterSpacing: 0.8,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Color _hexToColor(String hex) {
    try {
      return Color(int.parse(hex.replaceFirst('#', '0xFF')));
    } catch (_) {
      return Colors.grey;
    }
  }

  static Color _contrastColor(Color bg) {
    final luminance = bg.computeLuminance();
    return luminance > 0.4 ? Colors.black87 : Colors.white70;
  }

  static Color _finishColor(String finish) {
    return switch (finish) {
      'gloss' => Colors.blueAccent,
      'matte' => Colors.orangeAccent,
      'suede' => Colors.purpleAccent,
      'woodmatt' => Colors.tealAccent,
      _ => Colors.grey,
    };
  }
}
