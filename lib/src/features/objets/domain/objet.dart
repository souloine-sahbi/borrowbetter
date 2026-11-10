// freezed écrit le nom de la classe dans ses constructeurs factory.
// ignore_for_file: unnecessary_type_name_in_constructor

import 'package:freezed_annotation/freezed_annotation.dart';

part 'objet.freezed.dart';

enum CategorieObjet {
  outils,
  camping,
  cuisine,
  sport,
  electronique,
  livres,
  jeux,
  autre,
}

enum EtatObjet { neuf, commeNeuf, bonEtat, usage }

enum StatutObjet { disponible, indisponible, enAttenteModeration, masque }

@freezed
abstract class Objet with _$Objet {
  const factory Objet({
    required String id,
    required String proprietaireId,
    required String proprietaireNom,
    required String titre,
    required String description,
    required CategorieObjet categorie,
    required EtatObjet etat,
    required String gouvernoratId,
    required String villeId,
    required String langueAnnonce,
    required StatutObjet statut,
    required DateTime creeLe,
    @Default(<String>[]) List<String> photos,
  }) = _Objet;
}

/// Données saisies dans le formulaire, avant l'enregistrement.
///
/// [photos] contient les adresses déjà envoyées à l'hébergeur d'images.
@freezed
abstract class BrouillonObjet with _$BrouillonObjet {
  const factory BrouillonObjet({
    required String titre,
    required String description,
    required CategorieObjet categorie,
    required EtatObjet etat,
    required String gouvernoratId,
    required String villeId,
    required String langueAnnonce,
    required String cite,
    @Default(<String>[]) List<String> photos,
    String? rue,
  }) = _BrouillonObjet;
}
