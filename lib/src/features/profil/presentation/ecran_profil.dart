import 'package:borrowbetter/src/features/auth/data/depot_auth.dart';
import 'package:borrowbetter/src/features/profil/domain/utilisateur.dart';
import 'package:borrowbetter/src/features/profil/presentation/avatar_utilisateur.dart';
import 'package:borrowbetter/src/features/profil/presentation/providers/utilisateur_providers.dart';
import 'package:borrowbetter/src/routing/bouton_menu.dart';
import 'package:borrowbetter/src/routing/chemins.dart';
import 'package:borrowbetter/src/shared/l10n/app_localizations.dart';
import 'package:borrowbetter/src/shared/theme/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class EcranProfil extends ConsumerWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textes = AppLocalizations.of(context);
    final profil = ref.watch(utilisateurCourantProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(textes.profilTitre),
        leading: const BoutonMenu(),
      ),
      body: profil.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (_, _) => Center(child: Text(textes.profilEchec)),
        data: (utilisateur) => utilisateur == null
            ? const SizedBox.shrink()
            : _ContenuProfil(utilisateur: utilisateur),
      ),
    );
  }
}

class _ContenuProfil extends ConsumerWidget {
  const new({required this.utilisateur});

  final Utilisateur utilisateur;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textes = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final lieu = [
      utilisateur.ville,
      utilisateur.gouvernorat,
    ].whereType<String>().where((v) => v.isNotEmpty).join(', ');
    return ListView(
      padding: const EdgeInsets.all(Espacements.l),
      children: [
        Center(
          child: AvatarUtilisateur(
            nom: utilisateur.nom,
            photoUrl: utilisateur.photoUrl,
            rayon: 52,
          ),
        ),
        const SizedBox(height: Espacements.m),
        Text(
          utilisateur.nom,
          textAlign: TextAlign.center,
          style: theme.textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: Espacements.xs),
        Text(
          utilisateur.email,
          textAlign: TextAlign.center,
          style: theme.textTheme.bodyMedium?.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
          ),
        ),
        const SizedBox(height: Espacements.l),
        FilledButton.icon(
          onPressed: () => context.push(Chemins.modifierProfil),
          icon: const Icon(Icons.edit_outlined),
          label: Text(textes.profilModifier),
        ),
        const SizedBox(height: Espacements.l),
        ListTile(
          leading: const Icon(Icons.place_outlined),
          title: Text(textes.profilLieu),
          subtitle: Text(lieu.isEmpty ? textes.profilLieuVide : lieu),
        ),
        const Divider(),
        ListTile(
          leading: const Icon(Icons.swap_horiz),
          title: Text(textes.profilMesEmprunts),
          trailing: const Icon(Icons.chevron_right),
          onTap: () => context.go(Chemins.demandes),
        ),
        ListTile(
          leading: const Icon(Icons.inventory_2_outlined),
          title: Text(textes.profilMesObjets),
          trailing: const Icon(Icons.chevron_right),
          onTap: () => context.go(Chemins.demandes),
        ),
        ListTile(
          leading: const Icon(Icons.settings_outlined),
          title: Text(textes.navParametres),
          trailing: const Icon(Icons.chevron_right),
          onTap: () => context.push(Chemins.parametres),
        ),
        const Divider(),
        ListTile(
          leading: Icon(Icons.logout, color: theme.colorScheme.error),
          title: Text(
            textes.authDeconnexion,
            style: TextStyle(color: theme.colorScheme.error),
          ),
          onTap: () => ref.read(depotAuthProvider).deconnexion(),
        ),
      ],
    );
  }
}
