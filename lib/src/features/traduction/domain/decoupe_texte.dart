import 'dart:convert';

int _octets(String texte) => utf8.encode(texte).length;

/// Découpe [texte] en morceaux d'au plus [maxOctets] octets UTF-8 (l'API
/// refuse plus de 500 octets par requête ; l'arabe pèse ~2 octets par lettre).
/// On coupe de préférence aux fins de phrase, puis aux espaces, et en dernier
/// recours au milieu d'un mot démesuré.
List<String> decouperTexte(String texte, {int maxOctets = 450}) {
  final propre = texte.trim();
  if (propre.isEmpty) return const [];

  final phrases = propre.split(RegExp(r'(?<=[.!?؟…])\s+'));
  final morceaux = <String>[];
  var courant = '';

  void vider() {
    if (courant.isNotEmpty) morceaux.add(courant);
    courant = '';
  }

  for (final phrase in phrases) {
    for (final bout in _decouperLong(phrase, maxOctets)) {
      final candidat = courant.isEmpty ? bout : '$courant $bout';
      if (_octets(candidat) <= maxOctets) {
        courant = candidat;
      } else {
        vider();
        courant = bout;
      }
    }
  }
  vider();
  return morceaux;
}

List<String> _decouperLong(String phrase, int maxOctets) {
  if (_octets(phrase) <= maxOctets) return [phrase];
  final resultat = <String>[];
  var courant = '';
  for (final mot in phrase.split(RegExp(r'\s+'))) {
    for (final bout in _decouperMot(mot, maxOctets)) {
      final candidat = courant.isEmpty ? bout : '$courant $bout';
      if (_octets(candidat) <= maxOctets) {
        courant = candidat;
      } else {
        if (courant.isNotEmpty) resultat.add(courant);
        courant = bout;
      }
    }
  }
  if (courant.isNotEmpty) resultat.add(courant);
  return resultat;
}

List<String> _decouperMot(String mot, int maxOctets) {
  if (_octets(mot) <= maxOctets) return [mot];
  final resultat = <String>[];
  var courant = '';
  for (final rune in mot.runes) {
    final caractere = String.fromCharCode(rune);
    if (_octets('$courant$caractere') > maxOctets) {
      resultat.add(courant);
      courant = caractere;
    } else {
      courant = '$courant$caractere';
    }
  }
  if (courant.isNotEmpty) resultat.add(courant);
  return resultat;
}
