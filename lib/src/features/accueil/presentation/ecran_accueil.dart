import 'package:borrowbetter/src/routing/chemins.dart';
import 'package:borrowbetter/src/shared/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class EcranAccueil extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    final textes = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(title: Text(textes.navAccueil)),
      body: Center(child: Text(textes.navAccueil)),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => context.push(Chemins.nouvelObjet),
        icon: const Icon(Icons.add),
        label: Text(textes.objetNouveau),
      ),
    );
  }
}
