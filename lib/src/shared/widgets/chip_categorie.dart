import 'package:borrowbetter/src/shared/theme/dimensions.dart';
import 'package:flutter/material.dart';

/// Puce de catégorie, sélectionnable, avec transition animée.
class ChipCategorie extends StatelessWidget {
  const new({
    required this.libelle,
    required this.selectionne,
    required this.onTap,
    this.icone,
    super.key,
  });

  final String libelle;
  final bool selectionne;
  final VoidCallback onTap;
  final IconData? icone;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final schema = theme.colorScheme;
    final fond = selectionne ? schema.primary : schema.surfaceContainerHighest;
    final texte = selectionne ? schema.onPrimary : schema.onSurface;

    return Semantics(
      button: true,
      selected: selectionne,
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          borderRadius: BorderRadius.circular(Rayons.l),
          onTap: onTap,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            padding: const EdgeInsets.symmetric(
              horizontal: Espacements.l,
              vertical: Espacements.m,
            ),
            decoration: BoxDecoration(
              color: fond,
              borderRadius: BorderRadius.circular(Rayons.l),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (icone != null) ...[
                  Icon(icone, size: 18, color: texte),
                  const SizedBox(width: Espacements.xs),
                ],
                Text(
                  libelle,
                  style: theme.textTheme.labelLarge?.copyWith(color: texte),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
