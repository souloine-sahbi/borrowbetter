import 'package:borrowbetter/src/shared/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class EcranRecherche extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    final textes = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(title: Text(textes.navRecherche)),
      body: Center(child: Text(textes.navRecherche)),
    );
  }
}
