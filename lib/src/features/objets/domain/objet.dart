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
  const factory({
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
@freezed
abstract class BrouillonObjet with _$BrouillonObjet {
  const factory({
    required String titre,
    required String description,
    required CategorieObjet categorie,
    required EtatObjet etat,
    required String gouvernoratId,
    required String villeId,
    required String langueAnnonce,
    required String cite,
    String? rue,
  }) = _BrouillonObjet;
}
