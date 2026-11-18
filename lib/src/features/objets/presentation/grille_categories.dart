import 'package:borrowbetter/src/features/objets/domain/objet.dart';
import 'package:borrowbetter/src/features/objets/presentation/icones_objet.dart';
import 'package:borrowbetter/src/features/objets/presentation/libelles_objet.dart';
import 'package:borrowbetter/src/features/objets/presentation/tuile_categorie.dart';
import 'package:borrowbetter/src/shared/l10n/app_localizations.dart';
import 'package:borrowbetter/src/shared/theme/dimensions.dart';
import 'package:flutter/material.dart';

/// Grille des catégories (4 colonnes), à placer dans une `CustomScrollView`.
class SliverGrilleCategories extends StatelessWidget {
  const new({required this.onCategorie, super.key});

  final ValueChanged<CategorieObjet> onCategorie;

  @override
  Widget build(BuildContext context) {
    final textes = AppLocalizations.of(context);
    final scheme = Theme.of(context).colorScheme;
    // Trois teintes tirées du thème, en alternance, comme sur la maquette.
    final teintes = [
      (scheme.primaryContainer, scheme.onPrimaryContainer),
      (scheme.secondaryContainer, scheme.onSecondaryContainer),
      (scheme.tertiaryContainer, scheme.onTertiaryContainer),
    ];

    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: Espacements.l),
      sliver: SliverGrid.count(
        crossAxisCount: 4,
        mainAxisSpacing: Espacements.m,
        crossAxisSpacing: Espacements.m,
        childAspectRatio: 0.9,
        children: [
          for (final (index, categorie) in CategorieObjet.values.indexed)
            TuileCategorie(
              libelle: libelleCategorie(textes, categorie),
              icone: iconeCategorie(categorie),
              couleurFond: teintes[index % teintes.length].$1,
              couleurIcone: teintes[index % teintes.length].$2,
              onTap: () => onCategorie(categorie),
            ),
        ],
      ),
    );
  }
}
