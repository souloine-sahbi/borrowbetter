import 'package:borrowbetter/src/features/objets/domain/objet.dart';

const _accents = {
  'à': 'a',
  'â': 'a',
  'ä': 'a',
  'é': 'e',
  'è': 'e',
  'ê': 'e',
  'ë': 'e',
  'î': 'i',
  'ï': 'i',
  'ô': 'o',
  'ö': 'o',
  'ù': 'u',
  'û': 'u',
  'ü': 'u',
  'ç': 'c',
};

/// Minuscules et sans accents : « Vélo » et « velo » deviennent identiques.
String normaliser(String texte) {
  final tampon = StringBuffer();
  for (final lettre in texte.toLowerCase().split('')) {
    tampon.write(_accents[lettre] ?? lettre);
  }
  return tampon.toString().trim();
}

/// Garde les objets dont le titre ou la description contient tous les mots
/// saisis, sans tenir compte de la casse ni des accents.
List<Objet> filtrerParTexte(List<Objet> objets, String texte) {
  final mots = normaliser(texte)
      .split(' ')
      .where((mot) => mot.isNotEmpty)
      .toList();
  if (mots.isEmpty) return objets;
  return [
    for (final objet in objets)
      if (_contientTous(objet, mots)) objet,
  ];
}

bool _contientTous(Objet objet, List<String> mots) {
  final cible = normaliser('${objet.titre} ${objet.description}');
  return mots.every(cible.contains);
}
