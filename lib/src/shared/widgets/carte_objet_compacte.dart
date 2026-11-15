import 'package:borrowbetter/src/shared/theme/dimensions.dart';
import 'package:flutter/material.dart';

/// Carte compacte d'un objet pour une rangée horizontale : une photo aux coins
/// arrondis, puis le titre et une ligne de détail, sans cadre.
class CarteObjetCompacte extends StatelessWidget {
  const new({
    required this.titre,
    required this.detail,
    this.photoUrl,
    this.heroTag,
    this.onTap,
    super.key,
  });

  final String titre;

  /// Ligne sous le titre, par exemple la zone « Ville, Gouvernorat ».
  final String detail;
  final String? photoUrl;

  /// Étiquette `Hero` (par exemple l'identifiant de l'objet).
  final Object? heroTag;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final rayon = BorderRadius.circular(Espacements.m);
    return InkWell(
      onTap: onTap,
      borderRadius: rayon,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          AspectRatio(
            aspectRatio: 4 / 3,
            child: ClipRRect(
              borderRadius: rayon,
              child: _Photo(photoUrl: photoUrl, heroTag: heroTag),
            ),
          ),
          const SizedBox(height: Espacements.s),
          Text(
            titre,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: theme.textTheme.titleSmall?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            detail,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }
}

class _Photo extends StatelessWidget {
  const new({required this.photoUrl, required this.heroTag});

  final String? photoUrl;
  final Object? heroTag;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final absente = ColoredBox(
      color: scheme.surfaceContainerHighest,
      child: Center(
        child: Icon(Icons.image_outlined, color: scheme.onSurfaceVariant),
      ),
    );
    final url = photoUrl;
    final image = url == null
        ? absente
        : Image.network(
            url,
            fit: BoxFit.cover,
            errorBuilder: (_, _, _) => absente,
          );
    final etiquette = heroTag;
    if (etiquette == null) return image;
    return Hero(tag: etiquette, child: image);
  }
}
