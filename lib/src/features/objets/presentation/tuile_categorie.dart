import 'package:borrowbetter/src/shared/theme/dimensions.dart';
import 'package:flutter/material.dart';

/// Tuile de catégorie utilisée dans la grille de l'écran d'accueil.
class TuileCategorie extends StatelessWidget {
  const new({
    required this.libelle,
    required this.icone,
    required this.couleurFond,
    required this.couleurIcone,
    required this.onTap,
    super.key,
  });

  final String libelle;
  final IconData icone;
  final Color couleurFond;
  final Color couleurIcone;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      label: libelle,
      child: Material(
        color: couleurFond,
        borderRadius: BorderRadius.circular(Rayons.l),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(Espacements.xs),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icone, color: couleurIcone, size: 28),
                const SizedBox(height: Espacements.xs),
                Text(
                  libelle,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                    color: couleurIcone,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
