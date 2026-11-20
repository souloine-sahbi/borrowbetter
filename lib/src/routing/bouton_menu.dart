import 'package:borrowbetter/src/routing/coquille_navigation.dart';
import 'package:borrowbetter/src/shared/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class BoutonMenu extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      tooltip: AppLocalizations.of(context).tiroirMenu,
      icon: const Icon(Icons.menu),
      onPressed: () => cleCoquille.currentState?.openDrawer(),
    );
  }
}
