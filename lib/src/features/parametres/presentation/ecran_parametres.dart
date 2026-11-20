import 'package:borrowbetter/src/features/auth/data/depot_auth.dart';
import 'package:borrowbetter/src/routing/chemins.dart';
import 'package:borrowbetter/src/shared/l10n/app_localizations.dart';
import 'package:borrowbetter/src/shared/theme/dimensions.dart';
import 'package:borrowbetter/src/shared/widgets/selecteur_langue.dart';
import 'package:borrowbetter/src/shared/widgets/selecteur_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class EcranParametres extends ConsumerWidget {
  // Dart requires the class name for this generative constructor.
  // ignore: unnecessary_type_name_in_constructor
  const EcranParametres({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textes = AppLocalizations.of(context);
    final style = Theme.of(context).textTheme.titleMedium;

    return Scaffold(
      appBar: AppBar(title: Text(textes.navParametres)),
      body: ListView(
        padding: const EdgeInsets.all(Espacements.l),
        children: [
          // Point d'entrée vers le profil
          ListTile(
            leading: const Icon(Icons.person_outline),
            title: Text(textes.profilTitre),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => context.push(Chemins.profil),
          ),
          const SizedBox(height: Espacements.l),

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
