import 'dart:convert';
import 'dart:typed_data';

import 'package:borrowbetter/src/features/ai/data/source_gemini.dart';
import 'package:borrowbetter/src/features/ai/data/suggestion_dto.dart';
import 'package:borrowbetter/src/features/ai/domain/depot_ia.dart';
import 'package:borrowbetter/src/features/ai/domain/suggestion_annonce.dart';
import 'package:borrowbetter/src/features/objets/domain/objet.dart';
import 'package:borrowbetter/src/shared/domain/failure.dart';

class DepotIAGemini implements DepotIA {
  const new(this._source);

  final SourceGemini _source;

  static const _langues = {'fr': 'français', 'en': 'English', 'ar': 'العربية'};

  @override
  Future<SuggestionAnnonce> suggerer({
    required Uint8List photo,
    required String indice,
    required String langue,
  }) async {
    final indiceNet = indice.trim();
    final consigne =
        '''
Tu aides un particulier à publier un objet à prêter. Regarde la photo et remplis la fiche.
- titre : court (60 caractères max), sans inventer de marque.
- categorie et etat : une valeur de la liste imposée.
- description : 2 à 3 phrases factuelles, uniquement ce qui est visible.
Écris le titre et la description en ${_langues[langue] ?? 'français'}.
N'invente ni prix ni caractéristiques invisibles.${indiceNet.isEmpty ? '' : '\nIndice du propriétaire : ${indiceNet.length > 100 ? indiceNet.substring(0, 100) : indiceNet}'}''';

    final brut = await _source.analyser(
      photo: photo,
      consigne: consigne,
      categories: [for (final c in CategorieObjet.values) c.name],
      etats: [for (final e in EtatObjet.values) e.name],
    );
    try {
      final decode = jsonDecode(brut);
      if (decode is! Map<String, dynamic>) {
        throw const ErreurServeur('reponse-invalide');
      }
      return suggestionDtoDepuisMap(decode).versDomaine();
    } on FormatException {
      throw const ErreurServeur('reponse-invalide');
    }
  }
}
