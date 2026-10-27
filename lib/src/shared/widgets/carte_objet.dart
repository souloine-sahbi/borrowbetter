import 'package:borrowbetter/src/shared/theme/dimensions.dart';
import 'package:flutter/material.dart';

/// Présentation d'une [CarteObjet].
enum VarianteCarte {
  /// Photo au-dessus, texte en dessous (accueil, grille).
  grille,

  /// Photo à gauche, texte à droite (résultats de recherche).
  liste,
}

/// Carte d'un objet : photo, titre, catégorie, état et zone approximative.
class CarteObjet extends StatelessWidget {
  const new({
    required this.titre,
    required this.categorie,
    required this.etat,
    required this.zone,
    this.photoUrl,
    this.heroTag,
    this.onTap,
    this.variante = VarianteCarte.grille,
    super.key,
  });

  final String titre;
  final String categorie;
  final String etat;

  /// Zone approximative, au format « Ville, Gouvernorat ».
  final String zone;
  final String? photoUrl;

  /// Étiquette `Hero` (par exemple l'identifiant de l'objet). Sans valeur,
  /// aucune animation n'est utilisée.
  final Object? heroTag;
  final VoidCallback? onTap;
  final VarianteCarte variante;

  @override
  Widget build(BuildContext context) {
    final photo = _PhotoObjet(photoUrl: photoUrl, heroTag: heroTag);
    final texte = _TexteObjet(
      titre: titre,
      categorie: categorie,
      etat: etat,
      zone: zone,
    );
    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: switch (variante) {
          VarianteCarte.grille => Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              AspectRatio(aspectRatio: 4 / 3, child: photo),
              Padding(
                padding: const EdgeInsets.all(Espacements.m),
                child: texte,
              ),
            ],
          ),
          VarianteCarte.liste => Row(
            children: [
              SizedBox.square(dimension: 112, child: photo),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(Espacements.m),
                  child: texte,
                ),
              ),
            ],
          ),
        },
      ),
    );
  }
}

class _PhotoObjet extends StatelessWidget {
  const new({required this.photoUrl, required this.heroTag});

  final String? photoUrl;
  final Object? heroTag;

  @override
  Widget build(BuildContext context) {
    final image = photoUrl == null
        ? const _PhotoAbsente()
        : Image.network(
            photoUrl!,
            fit: BoxFit.cover,
            errorBuilder: (_, _, _) => const _PhotoAbsente(),
          );
    if (heroTag == null) return image;
    return Hero(tag: heroTag!, child: image);
  }
}

class _PhotoAbsente extends StatelessWidget {
  const new();

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return ColoredBox(
      color: scheme.surfaceContainerHighest,
      child: Center(
        child: Icon(Icons.image_outlined, color: scheme.onSurfaceVariant),
      ),
    );
  }
}

class _TexteObjet extends StatelessWidget {
  const new({
    required this.titre,
    required this.categorie,
    required this.etat,
    required this.zone,
  });

  final String titre;
  final String categorie;
  final String etat;
  final String zone;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          titre,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: theme.textTheme.titleMedium,
        ),
        const SizedBox(height: Espacements.s / 2),
        Text(
          '$categorie · $etat',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: theme.textTheme.bodySmall,
        ),
        Text(
          zone,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: theme.textTheme.bodySmall?.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
          ),
        ),
      ],
    );
  }
}
