import 'dart:async';

import 'package:borrowbetter/src/features/auth/data/depot_auth.dart';
import 'package:borrowbetter/src/shared/l10n/app_localizations.dart';
import 'package:borrowbetter/src/shared/theme/dimensions.dart';
import 'package:borrowbetter/src/shared/widgets/logo_marque.dart';
import 'package:borrowbetter/src/shared/widgets/selecteur_langue.dart';
import 'package:borrowbetter/src/shared/widgets/selecteur_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EcranParametres extends ConsumerWidget {
  const new({super.key});

  void _afficherAPropos(BuildContext context, AppLocalizations textes) {
    unawaited(
      showDialog<void>(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(textes.aProposTitre),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const LogoMarque(),
                const SizedBox(height: Espacements.s),
                Text(
                  textes.aProposVersion('1.0.0'),
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const SizedBox(height: Espacements.s),
                Text(
                  textes.aProposSlogan,
                  style: const TextStyle(fontStyle: FontStyle.italic),
                ),
                const SizedBox(height: Espacements.s),
                Text(textes.aProposTexte),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(textes.aProposFermer),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
          const SizedBox(height: Espacements.xl),
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: const Icon(Icons.info_outline),
            title: Text(textes.parametresAPropos),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => _afficherAPropos(context, textes),
          ),
          const SizedBox(height: Espacements.l),
          OutlinedButton.icon(
            onPressed: () => ref.read(depotAuthProvider).deconnexion(),
            icon: const Icon(Icons.logout),
            label: Text(textes.authDeconnexion),
          ),
        ],
      ),
    );
  }
}
