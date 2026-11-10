import 'package:borrowbetter/src/features/lieux/domain/libelle_zone.dart';
import 'package:borrowbetter/src/features/lieux/domain/lieux.dart';
import 'package:borrowbetter/src/features/lieux/presentation/lieux_provider.dart';
import 'package:borrowbetter/src/features/objets/domain/objet.dart';
import 'package:borrowbetter/src/features/objets/presentation/libelles_objet.dart';
import 'package:borrowbetter/src/shared/l10n/app_localizations.dart';
import 'package:borrowbetter/src/shared/theme/dimensions.dart';
import 'package:borrowbetter/src/shared/widgets/carte_objet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Liste verticale d'objets, construite à la demande.
class ListeObjets extends ConsumerWidget {
  const new({required this.objets, super.key});

  final List<Objet> objets;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textes = AppLocalizations.of(context);
    final langue = Localizations.localeOf(context).languageCode;
    // Tant que la liste des lieux charge, la zone reste vide sur les cartes.
    final lieux = ref.watch(lieuxProvider).value ?? const <Gouvernorat>[];

    return ListView.builder(
      // Marge basse : le bouton flottant ne doit pas masquer la dernière carte.
      padding: const EdgeInsets.fromLTRB(
        Espacements.l,
        Espacements.l,
        Espacements.l,
        96,
      ),
      itemCount: objets.length,
      itemBuilder: (context, index) {
        final objet = objets[index];
        return Padding(
          padding: const EdgeInsets.only(bottom: Espacements.m),
          child: CarteObjet(
            titre: objet.titre,
            categorie: libelleCategorie(textes, objet.categorie),
            etat: libelleEtat(textes, objet.etat),
            zone: libelleZone(
              lieux,
              gouvernoratId: objet.gouvernoratId,
              villeId: objet.villeId,
              langue: langue,
            ),
            photoUrl: objet.photos.firstOrNull,
          ),
        );
      },
    );
  }
}
