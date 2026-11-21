import 'package:borrowbetter/src/shared/domain/failure.dart';

class TraductionDto {
  const new({this.statut, this.texte});

  final int? statut;
  final String? texte;

  /// Renvoie le texte traduit ou lève une [Failure].
  String versDomaine() {
    if (statut == 429) throw const ErreurServeur('quota');
    final traduit = texte?.trim();
    if (statut != 200 || traduit == null || traduit.isEmpty) {
      throw const ErreurServeur('reponse-invalide');
    }
    // Message renvoyé à la place de la traduction quand le quota est atteint.
    if (traduit.toUpperCase().contains('MYMEMORY WARNING')) {
      throw const ErreurServeur('quota');
    }
    return _decoderEntites(traduit);
  }
}

/// MyMemory renvoie parfois des entités HTML dans le texte.
String _decoderEntites(String texte) => texte
    .replaceAll('&quot;', '"')
    .replaceAll('&#39;', "'")
    .replaceAll('&lt;', '<')
    .replaceAll('&gt;', '>')
    .replaceAll('&amp;', '&');

/// Lit la réponse sans rien supposer : `responseStatus` est parfois un
/// entier, parfois une chaîne.
TraductionDto traductionDtoDepuisMap(Map<String, dynamic> map) {
  final donnees = map['responseData'] as Map<String, dynamic>?;
  return TraductionDto(
    statut: int.tryParse('${map['responseStatus']}'),
    texte: donnees?['translatedText'] as String?,
  );
}
