import 'package:borrowbetter/src/shared/l10n/app_localizations.dart';
import 'package:borrowbetter/src/shared/theme/dimensions.dart';
import 'package:borrowbetter/src/shared/widgets/selecteur_langue.dart';
import 'package:borrowbetter/src/shared/widgets/selecteur_theme.dart';
import 'package:flutter/material.dart';

class EcranParametres extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    final textes = AppLocalizations.of(context);
    final style = Theme.of(context).textTheme.titleMedium;
    return Scaffold(
      appBar: AppBar(title: Text(textes.navParametres)),
      body: ListView(
        padding: const EdgeInsets.all(Espacements.l),
        children: [
          Text(textes.parametresLangue, style: style),
          const SizedBox(height: Espacements.s),
          const SelecteurLangue(),
          const SizedBox(height: Espacements.xl),
          Text(textes.parametresTheme, style: style),
          const SizedBox(height: Espacements.s),
          const SelecteurTheme(),
        ],
      ),
    );
  }
}
