import 'package:borrowbetter/src/features/auth/data/depot_auth.dart';
import 'package:borrowbetter/src/features/lieux/domain/libelle_zone.dart';
import 'package:borrowbetter/src/features/lieux/domain/lieux.dart';
import 'package:borrowbetter/src/features/lieux/presentation/lieux_provider.dart';
import 'package:borrowbetter/src/features/objets/domain/objet.dart';
import 'package:borrowbetter/src/features/objets/presentation/galerie_photos.dart';
import 'package:borrowbetter/src/features/objets/presentation/libelle_tarif.dart';
import 'package:borrowbetter/src/features/objets/presentation/libelles_objet.dart';
import 'package:borrowbetter/src/features/objets/presentation/objets_providers.dart';
import 'package:borrowbetter/src/features/signalement/domain/signalement.dart';
import 'package:borrowbetter/src/features/signalement/presentation/feuille_signalement.dart';
import 'package:borrowbetter/src/features/traduction/presentation/bloc_traduction.dart';
import 'package:borrowbetter/src/routing/chemins.dart';
import 'package:borrowbetter/src/shared/l10n/app_localizations.dart';
import 'package:borrowbetter/src/shared/presentation/message_pour.dart';
import 'package:borrowbetter/src/shared/theme/dimensions.dart';
import 'package:borrowbetter/src/shared/widgets/avatar_profil.dart';
import 'package:borrowbetter/src/shared/widgets/bouton_principal.dart';
import 'package:borrowbetter/src/shared/widgets/centre_chargement.dart';
import 'package:borrowbetter/src/shared/widgets/erreur_vue.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

/// Détail d'un objet.
///
/// [objetInitial] vient de la carte touchée : il évite un écran de chargement.
/// Sans lui (lien profond), l'objet est chargé à partir de [id].
class EcranDetailObjet extends ConsumerWidget {
  const new({required this.id, this.objetInitial, super.key});

  final String id;
  final Objet? objetInitial;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textes = AppLocalizations.of(context);
    final objet = ref.watch(objetProvider(id));

    return objet.when(
      loading: () {
        final initial = objetInitial;
        return initial == null
            ? const _EcranSimple(enfant: CentreChargement())
            : _PageObjet(objet: initial);
      },
      error: (erreur, trace) => _EcranSimple(
        enfant: ErreurVue(
          message: messagePour(textes, erreur),
          libelleReessayer: textes.actionReessayer,
          onReessayer: () => ref.invalidate(objetProvider(id)),
        ),
      ),
      data: (objet) => _PageObjet(objet: objet),
    );
  }
}

/// Chargement ou erreur : une barre classique suffit, il n'y a pas de photo.
class _EcranSimple extends StatelessWidget {
  const new({required this.enfant});

  final Widget enfant;

  @override
  Widget build(BuildContext context) {
    final textes = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(title: Text(textes.objetDetailTitre)),
      body: enfant,
    );
  }
}

class _PageObjet extends ConsumerWidget {
  const new({required this.objet});

  final Objet objet;

  /// Hauteur de l'en-tête, en proportion de la largeur de l'écran.
  static const _ratioEntete = 0.62;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textes = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;
    final langue = Localizations.localeOf(context).languageCode;
    final lieux = ref.watch(lieuxProvider).value ?? const <Gouvernorat>[];
    final zone = libelleZone(
      lieux,
      gouvernoratId: objet.gouvernoratId,
      villeId: objet.villeId,
      langue: langue,
    );
    final estProprietaire =
        objet.proprietaireId == ref.watch(etatAuthProvider).value?.uid;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            expandedHeight: MediaQuery.sizeOf(context).width * _ratioEntete,
            backgroundColor: scheme.surface,
            scrolledUnderElevation: 0,
            leading: Padding(
              padding: const EdgeInsets.all(Espacements.s),
              child: IconButton.filled(
                tooltip: MaterialLocalizations.of(context).backButtonTooltip,
                iconSize: 18,
                style: IconButton.styleFrom(
                  backgroundColor: scheme.surface,
                  foregroundColor: scheme.onSurface,
                ),
                icon: const Icon(Icons.arrow_back_ios_new),
                onPressed: context.pop,
              ),
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: DecoratedBox(
                // Fond chaud derrière la photo, plus soutenu que la fiche.
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      scheme.surfaceContainerHighest,
                      scheme.surfaceContainerHigh,
                    ],
                  ),
                ),
                // La photo remplit tout l'en-tête, jusque sous la barre d'état.
                child: GaleriePhotos(
                  photos: objet.photos,
                  heroTag: objet.id,
                  margeBasse: Espacements.xl,
                ),
              ),
            ),
            // Bord arrondi de la fiche qui recouvre le bas de la photo.
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(Espacements.l),
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: scheme.surface,
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(Espacements.l),
                  ),
                ),
                child: const SizedBox(
                  height: Espacements.l,
                  width: double.infinity,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SafeArea(
              top: false,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(
                  Espacements.l,
                  0,
                  Espacements.l,
                  Espacements.l,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: BlocTraduction(
                            titre: objet.titre,
                            description: objet.description,
                            langueAnnonce: objet.langueAnnonce,
                          ),
                        ),
                        if (estProprietaire)
                          IconButton(
                            tooltip: textes.objetModifier,
                            color: scheme.primary,
                            icon: const Icon(Icons.edit_outlined),
                            onPressed: () =>
                                context.push(Chemins.editerObjet(objet.id)),
                          ),
                      ],
                    ),
                    const SizedBox(height: Espacements.s),
                    Text(
                      libelleTarif(
                        context,
                        prix: objet.prix,
                        unite: objet.unite,
                      ),
                    ),
                    const SizedBox(height: Espacements.s),
                    Wrap(
                      spacing: Espacements.m,
                      runSpacing: Espacements.s,
                      children: [
                        if (zone.isNotEmpty)
                          _Info(icone: Icons.place_outlined, texte: zone),
                        _Info(
                          icone: Icons.event_outlined,
                          texte: DateFormat.yMMMd(langue).format(objet.creeLe),
                        ),
                      ],
                    ),
                    if (objet.proprietaireNom.isNotEmpty) ...[
                      const SizedBox(height: Espacements.m),
                      _Proprietaire(nom: objet.proprietaireNom),
                    ],
                    const SizedBox(height: Espacements.m),
                    Wrap(
                      spacing: Espacements.s,
                      runSpacing: Espacements.s,
                      children: [
                        _Pastille(libelleCategorie(textes, objet.categorie)),
                        _Pastille(libelleEtat(textes, objet.etat)),
                      ],
                    ),
                    // Un propriétaire n'emprunte pas son propre objet.
                    if (!estProprietaire) ...[
                      const SizedBox(height: Espacements.l),
                      BoutonPrincipal(
                        libelle: textes.objetDemander,
                        onPressed: () => ScaffoldMessenger.of(context)
                            .showSnackBar(
                              SnackBar(
                                content: Text(textes.objetDemanderBientot),
                              ),
                            ),
                      ),
                      TextButton.icon(
                        onPressed: () async {
                          await afficherSignalement(
                            context,
                            cible: CibleSignalement.objet,
                            cibleId: objet.id,
                          );
                        },
                        icon: const Icon(Icons.flag_outlined),
                        label: Text(textes.signalementSignaler),
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Proprietaire extends StatelessWidget {
  const new({required this.nom});

  final String nom;

  @override
  Widget build(BuildContext context) {
    final textes = AppLocalizations.of(context);
    final theme = Theme.of(context);
    return Row(
      children: [
        AvatarProfil(nom: nom),
        const SizedBox(width: Espacements.m),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                nom,
                style: theme.textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                textes.objetProprietaire,
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _Info extends StatelessWidget {
  const new({required this.icone, required this.texte});

  final IconData icone;
  final String texte;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final couleur = theme.colorScheme.onSurfaceVariant;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icone, size: 16, color: couleur),
        const SizedBox(width: Espacements.s / 2),
        Flexible(
          child: Text(
            texte,
            style: theme.textTheme.bodySmall?.copyWith(color: couleur),
          ),
        ),
      ],
    );
  }
}

class _Pastille extends StatelessWidget {
  const new(this.libelle);

  final String libelle;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;
    return Chip(
      label: Text(libelle),
      labelStyle: theme.textTheme.labelMedium?.copyWith(
        color: scheme.onPrimaryContainer,
      ),
      backgroundColor: scheme.primaryContainer,
      shape: const StadiumBorder(),
      side: BorderSide.none,
    );
  }
}
