import 'package:borrowbetter/src/routing/bouton_menu.dart';
import 'package:borrowbetter/src/shared/l10n/app_localizations.dart';
import 'package:borrowbetter/src/shared/theme/dimensions.dart';
import 'package:flutter/material.dart';

class EcranBientot extends StatelessWidget {
  const new({required this.titre, super.key});

  final String titre;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(title: Text(titre), leading: const BoutonMenu()),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.hourglass_empty,
              size: 48,
              color: theme.colorScheme.outline,
            ),
            const SizedBox(height: Espacements.m),
            Text(AppLocalizations.of(context).bientotMessage),
          ],
        ),
      ),
    );
  }
}
