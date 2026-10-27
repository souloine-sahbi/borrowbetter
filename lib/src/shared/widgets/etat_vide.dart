import 'package:borrowbetter/src/shared/theme/dimensions.dart';
import 'package:flutter/material.dart';

/// Affichage d'une liste vide : icône, titre et message facultatif.
class EtatVide extends StatelessWidget {
  const new({
    required this.titre,
    this.message,
    this.icone = Icons.inbox_outlined,
    super.key,
  });

  final String titre;
  final String? message;
  final IconData icone;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(Espacements.xl),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icone, size: 48, color: theme.colorScheme.primary),
            const SizedBox(height: Espacements.m),
            Text(
              titre,
              textAlign: TextAlign.center,
              style: theme.textTheme.titleMedium,
            ),
            if (message != null) ...[
              const SizedBox(height: Espacements.s),
              Text(
                message!,
                textAlign: TextAlign.center,
                style: theme.textTheme.bodyMedium,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
