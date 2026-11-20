import 'package:borrowbetter/src/features/objets/presentation/grille_categories.dart';
import 'package:borrowbetter/src/features/objets/presentation/rangee_objets.dart';
import 'package:borrowbetter/src/features/profil/presentation/providers/utilisateur_providers.dart';
import 'package:borrowbetter/src/features/recherche/presentation/recherche_providers.dart';

import 'package:borrowbetter/src/routing/bouton_menu.dart';
import 'package:borrowbetter/src/routing/chemins.dart';
import 'package:borrowbetter/src/shared/l10n/app_localizations.dart';
import 'package:borrowbetter/src/shared/theme/dimensions.dart';
import 'package:borrowbetter/src/shared/widgets/titre_section.dart';
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
    final nomComplet = ref.watch(utilisateurCourantProvider).value?.nom ?? '';
    final prenom = _majuscule(nomComplet.trim().split(' ').first);

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
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            prenom.isEmpty
                                ? textes.accueilBonjour
                                : textes.accueilBonjourNom(prenom),
                            style: theme.textTheme.headlineSmall?.copyWith(
                              color: scheme.primary,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        const BoutonMenu(),
                      ],
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
            SliverGrilleCategories(
              onCategorie: (categorie) {
                // La catégorie touchée devient le filtre de la recherche,
                // puis on ouvre l'onglet Recherche.
                ref
                    .read(filtresRechercheProvider.notifier)
                    .choisirCategorie(categorie);
                context.go(Chemins.recherche);
              },
            ),
            SliverToBoxAdapter(child: TitreSection(textes.accueilRecents)),
            const SliverToBoxAdapter(child: RangeeObjetsRecents()),
          ],
        ),
      ),
    );
  }
}
