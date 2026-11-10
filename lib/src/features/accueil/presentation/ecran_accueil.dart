import 'package:borrowbetter/src/features/accueil/presentation/liste_objets.dart';
import 'package:borrowbetter/src/features/objets/presentation/objets_providers.dart';
import 'package:borrowbetter/src/routing/chemins.dart';
import 'package:borrowbetter/src/shared/l10n/app_localizations.dart';
import 'package:borrowbetter/src/shared/presentation/message_pour.dart';
import 'package:borrowbetter/src/shared/widgets/centre_chargement.dart';
import 'package:borrowbetter/src/shared/widgets/erreur_vue.dart';
import 'package:borrowbetter/src/shared/widgets/etat_vide.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class EcranAccueil extends ConsumerWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textes = AppLocalizations.of(context);
    final objets = ref.watch(objetsDisponiblesProvider);

    return Scaffold(
      appBar: AppBar(title: Text(textes.navAccueil)),
      body: objets.when(
        loading: () => const CentreChargement(),
        error: (erreur, trace) => ErreurVue(
          message: messagePour(textes, erreur),
          libelleReessayer: textes.actionReessayer,
          onReessayer: () => ref.invalidate(objetsDisponiblesProvider),
        ),
        data: (liste) => liste.isEmpty
            ? EtatVide(
                titre: textes.aucunResultat,
                icone: Icons.inventory_2_outlined,
              )
            : ListeObjets(objets: liste),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => context.push(Chemins.nouvelObjet),
        icon: const Icon(Icons.add),
        label: Text(textes.objetNouveau),
      ),
    );
  }
}
