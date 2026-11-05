import 'package:borrowbetter/src/features/auth/data/depot_auth.dart';
import 'package:borrowbetter/src/shared/l10n/app_localizations.dart';
import 'package:borrowbetter/src/shared/theme/dimensions.dart';
import 'package:borrowbetter/src/shared/widgets/selecteur_langue.dart';
import 'package:borrowbetter/src/shared/widgets/selecteur_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EcranParametres extends ConsumerWidget {
  const new({super.key});

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
          const SizedBox(height: Espacements.xxl),
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
