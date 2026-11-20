import 'package:borrowbetter/src/features/auth/data/depot_auth.dart';
import 'package:borrowbetter/src/features/profil/presentation/avatar_utilisateur.dart';
import 'package:borrowbetter/src/features/profil/presentation/providers/utilisateur_providers.dart';
import 'package:borrowbetter/src/routing/chemins.dart';
import 'package:borrowbetter/src/shared/l10n/app_localizations.dart';
import 'package:borrowbetter/src/shared/theme/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

/// Sections secondaires : paramètres, aide, déconnexion.
class TiroirNavigation extends ConsumerWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textes = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final utilisateur = ref.watch(utilisateurCourantProvider).value;
    final nom = utilisateur?.nom ?? '';
    return Drawer(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(Espacements.l),
              child: Row(
                children: [
                  AvatarUtilisateur(
                    nom: nom,
                    photoUrl: utilisateur?.photoUrl,
                    rayon: 28,
                  ),
                  const SizedBox(width: Espacements.m),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          nom,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: theme.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          utilisateur?.email ?? '',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: theme.colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.settings_outlined),
              title: Text(textes.navParametres),
              onTap: () async {
                Navigator.of(context).pop();
                await context.push(Chemins.parametres);
              },
            ),
            ListTile(
              leading: const Icon(Icons.help_outline),
              title: Text(textes.tiroirAide),
              onTap: () async {
                Navigator.of(context).pop();
                await showDialog<void>(
                  context: context,
                  builder: (dialogue) => AlertDialog(
                    title: Text(textes.tiroirAide),
                    content: Text(textes.tiroirAideTexte),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.of(dialogue).pop(),
                        child: Text(textes.tiroirFermer),
                      ),
                    ],
                  ),
                );
              },
            ),
            const Spacer(),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.logout),
              title: Text(textes.authDeconnexion),
              onTap: () async {
                Navigator.of(context).pop();
                await ref.read(depotAuthProvider).deconnexion();
              },
            ),
          ],
        ),
      ),
    );
  }
}
