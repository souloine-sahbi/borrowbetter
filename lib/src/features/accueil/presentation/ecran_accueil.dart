import 'package:borrowbetter/src/features/accueil/presentation/rangee_objets.dart';
import 'package:borrowbetter/src/features/accueil/presentation/tuile_categorie.dart';
import 'package:borrowbetter/src/features/auth/data/depot_auth.dart';
import 'package:borrowbetter/src/features/objets/domain/objet.dart';
import 'package:borrowbetter/src/features/objets/presentation/icones_objet.dart';
import 'package:borrowbetter/src/features/objets/presentation/libelles_objet.dart';
import 'package:borrowbetter/src/features/objets/presentation/objets_providers.dart';
import 'package:borrowbetter/src/routing/chemins.dart';
import 'package:borrowbetter/src/shared/l10n/app_localizations.dart';
import 'package:borrowbetter/src/shared/presentation/message_pour.dart';
import 'package:borrowbetter/src/shared/theme/dimensions.dart';
import 'package:borrowbetter/src/shared/widgets/centre_chargement.dart';
import 'package:borrowbetter/src/shared/widgets/erreur_vue.dart';
import 'package:borrowbetter/src/shared/widgets/etat_vide.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

/// Première lettre en majuscule (sans effet sur l'arabe).
String _majuscule(String texte) =>
    texte.isEmpty ? texte : texte[0].toUpperCase() + texte.substring(1);

class EcranAccueil extends ConsumerWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textes = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;
    final objets = ref.watch(objetsDisponiblesProvider);
    final prenom = _majuscule(
      (ref.read(depotAuthProvider).utilisateur?.displayName ?? '')
          .trim()
          .split(' ')
          .first,
    );

    // Trois teintes tirées du thème, en alternance, comme sur la maquette.
    final teintes = [
      (scheme.primaryContainer, scheme.onPrimaryContainer),
      (scheme.secondaryContainer, scheme.onSecondaryContainer),
      (scheme.tertiaryContainer, scheme.onTertiaryContainer),
    ];

    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(Espacements.l),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      prenom.isEmpty
                          ? textes.accueilBonjour
                          : textes.accueilBonjourNom(prenom),
                      style: theme.textTheme.headlineSmall?.copyWith(
                        color: scheme.primary,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: Espacements.m),
                    // Un champ de lecture seule : toucher ouvre la recherche.
                    TextField(
                      readOnly: true,
                      onTap: () => context.go(Chemins.recherche),
                      decoration: InputDecoration(
                        hintText: textes.accueilRechercher,
                        prefixIcon: const Icon(Icons.search),
                        filled: true,
                        fillColor: scheme.surfaceContainerHighest,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(Espacements.m),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: Espacements.l),
              sliver: SliverGrid.count(
                crossAxisCount: 4,
                mainAxisSpacing: Espacements.m,
                crossAxisSpacing: Espacements.m,
                childAspectRatio: 0.9,
                children: [
                  for (final (index, categorie)
                      in CategorieObjet.values.indexed)
                    TuileCategorie(
                      libelle: libelleCategorie(textes, categorie),
                      icone: iconeCategorie(categorie),
                      couleurFond: teintes[index % teintes.length].$1,
                      couleurIcone: teintes[index % teintes.length].$2,
                      onTap: () => context.go(
                        Uri(
                          path: Chemins.recherche,
                          queryParameters: {'categorie': categorie.name},
                        ).toString(),
                      ),
                    ),
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(
                  Espacements.l,
                  Espacements.l,
                  Espacements.l,
                  Espacements.m,
                ),
                child: Text(
                  textes.accueilRecents,
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: objets.when(
                loading: () =>
                    const SizedBox(height: 160, child: CentreChargement()),
                error: (erreur, trace) => SizedBox(
                  height: 200,
                  child: ErreurVue(
                    message: messagePour(textes, erreur),
                    libelleReessayer: textes.actionReessayer,
                    onReessayer: () =>
                        ref.invalidate(objetsDisponiblesProvider),
                  ),
                ),
                data: (liste) => liste.isEmpty
                    ? SizedBox(
                        height: 160,
                        child: EtatVide(
                          titre: textes.aucunResultat,
                          icone: Icons.inventory_2_outlined,
                        ),
                      )
                    : RangeeObjets(objets: liste),
              ),
            ),
            // Marge basse : le bouton flottant ne masque pas le contenu.
            const SliverToBoxAdapter(child: SizedBox(height: 96)),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => context.push(Chemins.nouvelObjet),
        icon: const Icon(Icons.add),
        label: Text(textes.objetNouveau),
      ),
    );
  }
}
