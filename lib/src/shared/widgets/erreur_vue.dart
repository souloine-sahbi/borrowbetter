import 'package:borrowbetter/src/shared/theme/dimensions.dart';
import 'package:flutter/material.dart';

/// Message d'erreur avec un bouton pour réessayer.
class ErreurVue extends StatelessWidget {
  const new({
    required this.message,
    required this.libelleReessayer,
    required this.onReessayer,
    super.key,
  });

  final String message;
  final String libelleReessayer;
  final VoidCallback onReessayer;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(Espacements.xl),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.error_outline, size: 48, color: theme.colorScheme.error),
            const SizedBox(height: Espacements.m),
            Text(
              message,
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyLarge,
            ),
            const SizedBox(height: Espacements.xl),
            FilledButton(onPressed: onReessayer, child: Text(libelleReessayer)),
          ],
        ),
      ),
    );
  }
}
