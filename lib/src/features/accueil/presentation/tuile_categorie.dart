import 'package:borrowbetter/src/shared/theme/dimensions.dart';
import 'package:flutter/material.dart';

/// Tuile de la grille des catégories : une icône sur un carré teinté, et le
/// nom en dessous.
class TuileCategorie extends StatelessWidget {
  const new({
    required this.libelle,
    required this.icone,
    required this.couleurFond,
    required this.couleurIcone,
    this.onTap,
    super.key,
  });

  /// Côté maximal du carré teinté : il ne grossit pas avec l'écran.
  static const _tailleMax = 64.0;

  final String libelle;
  final IconData icone;
  final Color couleurFond;
  final Color couleurIcone;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final rayon = BorderRadius.circular(Espacements.m);
    return InkWell(
      onTap: onTap,
      borderRadius: rayon,
      child: Column(
        children: [
          // Le carré prend la place restante : le texte, lui, n'est jamais
          // coupé, même quand l'utilisateur agrandit la police.
          Expanded(
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(
                  maxWidth: _tailleMax,
                  maxHeight: _tailleMax,
                ),
                child: AspectRatio(
                  aspectRatio: 1,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: couleurFond,
                      borderRadius: rayon,
                    ),
                    child: Center(child: Icon(icone, color: couleurIcone)),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: Espacements.s / 2),
          Text(
            libelle,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: theme.textTheme.labelMedium,
          ),
        ],
      ),
    );
  }
}
