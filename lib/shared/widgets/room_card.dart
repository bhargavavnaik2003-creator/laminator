import 'package:flutter/material.dart';

import '../../core/database/app_database.dart';
import '../theme/style_constants.dart';

/// Card showing a room preset thumbnail (colour placeholder until real images added).
class RoomCard extends StatelessWidget {
  final RoomsTableData room;
  final bool isSelected;
  final VoidCallback? onTap;

  const RoomCard({
    super.key,
    required this.room,
    this.isSelected = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
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
            width: isSelected ? 2.5 : 1.0,
          ),
          boxShadow: [
            BoxShadow(
              color: isSelected
                  ? theme.colorScheme.primary.withValues(alpha: 0.35)
                  : Colors.black26,
              blurRadius: isSelected ? 14 : 4,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ── Thumbnail placeholder ─────────────────────────────
            Expanded(
              flex: 4,
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: _categoryGradient(room.category),
                  ),
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(StyleConstants.radiusMd),
                  ),
                ),
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        _categoryIcon(room.category),
                        color: Colors.white70,
                        size: 36,
                      ),
                      if (isSelected)
                        const Padding(
                          padding: EdgeInsets.only(top: 6),
                          child: Icon(
                            Icons.check_circle,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ),

            // ── Room info ─────────────────────────────────────────
            Padding(
              padding: const EdgeInsets.all(StyleConstants.spaceSm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    room.name,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 2),
                  Text(
                    room.category.toUpperCase(),
                    style: theme.textTheme.labelSmall?.copyWith(
                      color:
                          theme.colorScheme.onSurface.withValues(alpha: 0.5),
                      fontSize: 9,
                      letterSpacing: 1.0,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  static List<Color> _categoryGradient(String cat) => switch (cat) {
        'living' => [const Color(0xFF2C3E50), const Color(0xFF4A6741)],
        'bedroom' => [const Color(0xFF3D2C4E), const Color(0xFF6B4185)],
        'kitchen' => [const Color(0xFF4E3020), const Color(0xFF8B5E3C)],
        'bathroom' => [const Color(0xFF1A3A4E), const Color(0xFF2E7DA0)],
        _ => [const Color(0xFF2A2A2A), const Color(0xFF4A4A4A)],
      };

  static IconData _categoryIcon(String cat) => switch (cat) {
        'living' => Icons.weekend,
        'bedroom' => Icons.bed,
        'kitchen' => Icons.kitchen,
        'bathroom' => Icons.bathtub,
        _ => Icons.home,
      };
}
