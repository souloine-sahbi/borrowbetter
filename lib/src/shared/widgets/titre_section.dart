import 'package:borrowbetter/src/shared/theme/dimensions.dart';
import 'package:flutter/material.dart';

/// Titre d'une section d'écran (« Catégories », « Récemment ajoutés »).
class TitreSection extends StatelessWidget {
  const new(this.texte, {super.key});

  final String texte;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        Espacements.l,
        Espacements.l,
        Espacements.l,
        Espacements.m,
      ),
      child: Text(
        texte,
        style: Theme.of(context).textTheme.titleMedium
            ?.copyWith(fontWeight: FontWeight.w700),
      ),
    );
  }
}
