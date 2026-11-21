import 'package:borrowbetter/src/features/objets/domain/objet.dart';

class SuggestionAnnonce {
  const new({
    required this.titre,
    required this.description,
    this.categorie,
    this.etat,
  });

  final String titre;
  final String description;

  /// null quand le modèle propose une valeur hors liste.
  final CategorieObjet? categorie;
  final EtatObjet? etat;
}
