import 'package:flutter/material.dart';

/// Avatar d'un utilisateur : photo si disponible, sinon ses initiales.
class AvatarProfil extends StatelessWidget {
  const new({required this.nom, this.urlImage, this.rayon = 24, super.key});

  final String nom;
  final String? urlImage;
  final double rayon;

  String get _initiales {
    final parties = nom
        .trim()
        .split(RegExp(r'\s+'))
        .where((p) => p.isNotEmpty)
        .toList();
    if (parties.isEmpty) return '?';
    final premiere = parties.first[0];
    final derniere = parties.length > 1 ? parties.last[0] : '';
    return (premiere + derniere).toUpperCase();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final schema = theme.colorScheme;
    final url = urlImage;

    return Semantics(
      label: nom,
      image: true,
      child: CircleAvatar(
        radius: rayon,
        backgroundColor: schema.primaryContainer,
        foregroundColor: schema.onPrimaryContainer,
        backgroundImage: url == null ? null : NetworkImage(url),
        child: url == null
            ? Text(_initiales, style: theme.textTheme.titleMedium)
            : null,
      ),
    );
  }
}
