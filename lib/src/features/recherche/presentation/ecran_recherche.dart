import 'package:borrowbetter/src/features/lieux/domain/libelle_zone.dart';
import 'package:borrowbetter/src/features/lieux/domain/lieux.dart';
import 'package:borrowbetter/src/features/lieux/presentation/lieux_provider.dart';
import 'package:borrowbetter/src/features/lieux/presentation/selecteur_localisation.dart';
import 'package:borrowbetter/src/features/objets/domain/objet.dart';
import 'package:borrowbetter/src/features/objets/presentation/grille_categories.dart';
import 'package:borrowbetter/src/features/objets/presentation/libelles_objet.dart';
import 'package:borrowbetter/src/features/recherche/domain/recherche_texte.dart';
import 'package:borrowbetter/src/features/recherche/presentation/recherche_providers.dart';
import 'package:borrowbetter/src/routing/chemins.dart';
import 'package:borrowbetter/src/shared/l10n/app_localizations.dart';
import 'package:borrowbetter/src/shared/presentation/message_pour.dart';
import 'package:borrowbetter/src/shared/publicite/publicite_test.dart';
import 'package:borrowbetter/src/shared/theme/dimensions.dart';
import 'package:borrowbetter/src/shared/widgets/carte_objet.dart';
import 'package:borrowbetter/src/shared/widgets/centre_chargement.dart';
import 'package:borrowbetter/src/shared/widgets/chip_categorie.dart';
import 'package:borrowbetter/src/shared/widgets/erreur_vue.dart';
import 'package:borrowbetter/src/shared/widgets/etat_vide.dart';
import 'package:borrowbetter/src/shared/widgets/titre_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class EcranRecherche extends ConsumerStatefulWidget {
  const new({super.key});

  @override
  ConsumerState<EcranRecherche> createState() => _EtatEcranRecherche();
}

class _EtatEcranRecherche extends ConsumerState<EcranRecherche> {
  late final TextEditingController _champ;
  var _filtresOuverts = false;

  @override
  void initState() {
    super.initState();
    _champ = TextEditingController(
      text: ref.read(filtresRechercheProvider).texte,
    );
  }

  @override
  void dispose() {
    _champ.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textes = AppLocalizations.of(context);
    final scheme = Theme.of(context).colorScheme;
    final filtres = ref.watch(filtresRechercheProvider);
    final notifier = ref.read(filtresRechercheProvider.notifier);
    // Sans aucun filtre : la page d'accueil de la recherche (catégories et
    // objets récents). Avec un filtre : la liste des résultats.
    final filtreActif =
        filtres.texte.trim().isNotEmpty ||
        filtres.categorie != null ||
        filtres.gouvernoratId != null;

    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(
                  Espacements.s,
                  Espacements.l,
                  Espacements.l,
                  Espacements.s,
                ),
                child: Row(
                  children: [
                    IconButton(
                      tooltip: MaterialLocalizations.of(context)
                          .backButtonTooltip,
                      icon: const Icon(Icons.arrow_back_ios_new),
                      onPressed: () => context.go(Chemins.accueil),
                    ),
                    Expanded(
                      child: TextField(
                        controller: _champ,
                        onChanged: notifier.changerTexte,
                        textInputAction: TextInputAction.search,
                        decoration: InputDecoration(
                          hintText: textes.accueilRechercher,
                          prefixIcon: const Icon(Icons.search),
                          suffixIcon: filtres.texte.isEmpty
                              ? null
                              : IconButton(
                                  icon: const Icon(Icons.close),
                                  onPressed: () {
                                    _champ.clear();
                                    notifier.changerTexte('');
                                  },
                                ),
                          filled: true,
                          fillColor: scheme.surfaceContainerHighest,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(Espacements.m),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: Espacements.s),
                    IconButton.filledTonal(
                      tooltip: textes.rechercheFiltres,
                      isSelected: _filtresOuverts,
                      icon: Badge(
                        isLabelVisible: filtres.gouvernoratId != null,
                        child: const Icon(Icons.tune),
                      ),
                      onPressed: () =>
                          setState(() => _filtresOuverts = !_filtresOuverts),
                    ),
                  ],
                ),
              ),
            ),
            // Le filtre de lieu s'ouvre juste sous le champ de recherche.
            SliverToBoxAdapter(
              child: AnimatedSize(
                duration: const Duration(milliseconds: 200),
                alignment: Alignment.topCenter,
                child: _filtresOuverts
                    ? Padding(
                        padding: const EdgeInsets.fromLTRB(
                          Espacements.l,
                          Espacements.s,
                          Espacements.l,
                          Espacements.s,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            SelecteurLocalisation(
                              gouvernoratId: filtres.gouvernoratId,
                              villeId: filtres.villeId,
                              onChanged: notifier.choisirLieu,
                            ),
                            if (filtres.gouvernoratId != null)
                              Align(
                                alignment: AlignmentDirectional.centerEnd,
                                child: TextButton(
                                  onPressed: () =>
                                      notifier.choisirLieu(null, null),
                                  child: Text(textes.rechercheReinitialiser),
                                ),
                              ),
                          ],
                        ),
                      )
                    : const SizedBox(width: double.infinity),
              ),
            ),
            SliverToBoxAdapter(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(
                  horizontal: Espacements.l,
                  vertical: Espacements.s,
                ),
                child: Row(
                  children: [
                    ChipCategorie(
                      libelle: textes.rechercheToutes,
                      selectionne: filtres.categorie == null,
                      onTap: () => notifier.choisirCategorie(null),
                    ),
                    for (final categorie in CategorieObjet.values) ...[
                      const SizedBox(width: Espacements.s),
                      ChipCategorie(
                        libelle: libelleCategorie(textes, categorie),
                        selectionne: filtres.categorie == categorie,
                        onTap: () => notifier.choisirCategorie(categorie),
                      ),
                    ],
                  ],
                ),
              ),
            ),
            if (filtreActif)
              _Resultats(texte: filtres.texte)
            else ...[
              SliverToBoxAdapter(child: TitreSection(textes.objetCategorie)),
              SliverGrilleCategories(onCategorie: notifier.choisirCategorie),
              SliverToBoxAdapter(child: TitreSection(textes.accueilRecents)),
              const _Resultats(texte: ''),
            ],
            const SliverToBoxAdapter(child: BanniereTest()),
            const SliverToBoxAdapter(child: SizedBox(height: Espacements.l)),
          ],
        ),
      ),
    );
  }
}

/// Résultats de la recherche, sous forme de liste de cartes.
class _Resultats extends ConsumerWidget {
  const new({required this.texte});

  final String texte;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textes = AppLocalizations.of(context);
    final langue = Localizations.localeOf(context).languageCode;
    final lieux = ref.watch(lieuxProvider).value ?? const <Gouvernorat>[];
    final resultats = ref.watch(resultatsRechercheProvider);

    return resultats.when(
      loading: () => const SliverFillRemaining(
        hasScrollBody: false,
        child: CentreChargement(),
      ),
      error: (erreur, trace) => SliverFillRemaining(
        hasScrollBody: false,
        child: ErreurVue(
          message: messagePour(textes, erreur),
          libelleReessayer: textes.actionReessayer,
          onReessayer: () => ref.invalidate(resultatsRechercheProvider),
        ),
      ),
      data: (liste) {
        final objets = filtrerParTexte(liste, texte);
        if (objets.isEmpty) {
          return SliverFillRemaining(
            hasScrollBody: false,
            child: EtatVide(
              titre: textes.aucunResultat,
              icone: Icons.search_off,
            ),
          );
        }
        return SliverPadding(
          padding: const EdgeInsets.all(Espacements.l),
          sliver: SliverList.builder(
            itemCount: objets.length,
            itemBuilder: (context, index) {
              final objet = objets[index];
              return Padding(
                padding: const EdgeInsets.only(bottom: Espacements.m),
                child: CarteObjet(
                  titre: objet.titre,
                  categorie: libelleCategorie(textes, objet.categorie),
                  etat: libelleEtat(textes, objet.etat),
                  prix: objet.prix,
                  unite: objet.unite,
                  zone: libelleZone(
                    lieux,
                    gouvernoratId: objet.gouvernoratId,
                    villeId: objet.villeId,
                    langue: langue,
                  ),
                  photoUrl: objet.photos.firstOrNull,
                  variante: VarianteCarte.liste,
                  onTap: () =>
                      context.push(Chemins.detailObjet(objet.id), extra: objet),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
