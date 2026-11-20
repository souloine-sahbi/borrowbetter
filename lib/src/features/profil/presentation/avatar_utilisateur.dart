import 'package:flutter/material.dart';

class AvatarUtilisateur extends StatelessWidget {
  const new({
    required this.nom,
    required this.rayon,
    this.photoUrl,
    this.imageLocale,
    super.key,
  });

  final String nom;
  final double rayon;
  final String? photoUrl;

  /// Aperçu d'une photo choisie mais pas encore envoyée.
  final ImageProvider? imageLocale;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final url = photoUrl;
    final image =
        imageLocale ?? (url == null || url.isEmpty ? null : NetworkImage(url));
    final initiale = nom.trim().isEmpty ? '?' : nom.trim()[0].toUpperCase();
    return CircleAvatar(
      radius: rayon,
      backgroundColor: scheme.primaryContainer,
      foregroundImage: image,
      child: Text(
        initiale,
        style: Theme.of(context).textTheme.headlineMedium
            ?.copyWith(color: scheme.onPrimaryContainer),
      ),
    );
  }
}
