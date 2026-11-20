import 'package:borrowbetter/src/features/auth/data/depot_auth.dart';
import 'package:borrowbetter/src/features/lieux/domain/libelle_zone.dart';
import 'package:borrowbetter/src/features/lieux/presentation/lieux_provider.dart';
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
        leading: const BoutonMenu(),
        title: Text(textes.profilTitre),
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
    final lieux = ref.watch(lieuxProvider).value ?? [];
    final gouvernorat = utilisateur.gouvernorat;
    final ville = utilisateur.ville;
    final lieu = gouvernorat == null
        ? textes.profilLieuVide
        : libelleZone(
            lieux,
            gouvernoratId: gouvernorat,
            villeId: ville ?? '',
            langue: Localizations.localeOf(context).languageCode,
          );
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
        const SizedBox(height: Espacements.xl),
        ListTile(
          leading: const Icon(Icons.place_outlined),
          title: Text(textes.profilLieu),
          subtitle: Text(lieu.isEmpty ? textes.profilLieuVide : lieu),
        ),
        const SizedBox(height: Espacements.l),
        FilledButton.icon(
          onPressed: () => context.push(Chemins.modifierProfil),
          icon: const Icon(Icons.edit_outlined),
          label: Text(textes.profilModifier),
        ),
        const SizedBox(height: Espacements.m),
        OutlinedButton.icon(
          onPressed: () => ref.read(depotAuthProvider).deconnexion(),
          icon: const Icon(Icons.logout),
          label: Text(textes.authDeconnexion),
        ),
      ],
    );
  }
}
