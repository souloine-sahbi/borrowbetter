import 'package:borrowbetter/src/features/lieux/domain/libelle_zone.dart';
import 'package:borrowbetter/src/features/lieux/domain/lieux.dart';
import 'package:borrowbetter/src/features/lieux/presentation/lieux_provider.dart';
import 'package:borrowbetter/src/features/objets/domain/objet.dart';
import 'package:borrowbetter/src/routing/chemins.dart';
import 'package:borrowbetter/src/shared/theme/dimensions.dart';
import 'package:borrowbetter/src/shared/widgets/carte_objet_compacte.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

/// Rangée horizontale d'objets, construite à la demande.
class RangeeObjets extends ConsumerWidget {
  const new({required this.objets, super.key});

  final List<Objet> objets;

  static const _largeurCarte = 180.0;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final langue = Localizations.localeOf(context).languageCode;
    // Tant que la liste des lieux charge, la zone reste vide sur les cartes.
    final lieux = ref.watch(lieuxProvider).value ?? const <Gouvernorat>[];
    // La hauteur suit la taille de police : photo 4/3 + titre + détail.
    final hauteurTexte = MediaQuery.textScalerOf(context).scale(44);
    final hauteur = _largeurCarte * 3 / 4 + Espacements.s + hauteurTexte;

    return SizedBox(
      height: hauteur,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: Espacements.l),
        itemCount: objets.length,
        separatorBuilder: (_, _) => const SizedBox(width: Espacements.m),
        itemBuilder: (context, index) {
          final objet = objets[index];
          return SizedBox(
            width: _largeurCarte,
            child: CarteObjetCompacte(
              titre: objet.titre,
              detail: libelleZone(
                lieux,
                gouvernoratId: objet.gouvernoratId,
                villeId: objet.villeId,
                langue: langue,
              ),
              photoUrl: objet.photos.firstOrNull,
              heroTag: objet.id,
              onTap: () =>
                  context.push(Chemins.detailObjet(objet.id), extra: objet),
            ),
          );
        },
      ),
    );
  }
}
