import 'package:borrowbetter/src/features/ai/domain/suggestion_annonce.dart';
import 'package:borrowbetter/src/features/objets/domain/objet.dart';
import 'package:borrowbetter/src/shared/domain/failure.dart';

class SuggestionDto {
  const new({this.titre, this.categorie, this.etat, this.description});

  final String? titre;
  final String? categorie;
  final String? etat;
  final String? description;

  SuggestionAnnonce versDomaine() {
    final titreNet = (titre ?? '').trim();
    if (titreNet.isEmpty) throw const ErreurServeur('reponse-invalide');
    final desc = (description ?? '').trim();
    return SuggestionAnnonce(
      titre: titreNet.length > 80 ? titreNet.substring(0, 80).trim() : titreNet,
      description: desc.length > 1000 ? desc.substring(0, 1000) : desc,
      categorie: CategorieObjet.values.asNameMap()[categorie],
      etat: EtatObjet.values.asNameMap()[etat],
    );
  }
}

String? _texte(Object? valeur) => valeur is String ? valeur : null;

SuggestionDto suggestionDtoDepuisMap(Map<String, dynamic> map) => SuggestionDto(
  titre: _texte(map['titre']),
  categorie: _texte(map['categorie']),
  etat: _texte(map['etat']),
  description: _texte(map['description']),
);
