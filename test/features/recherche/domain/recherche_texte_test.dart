import 'package:borrowbetter/src/features/objets/domain/objet.dart';
import 'package:borrowbetter/src/features/recherche/domain/recherche_texte.dart';
import 'package:flutter_test/flutter_test.dart';

Objet _objet(String titre, [String description = '']) => Objet(
  id: titre,
  proprietaireId: 'u1',
  proprietaireNom: 'Souloine',
  titre: titre,
  description: description,
  categorie: CategorieObjet.outils,
  etat: EtatObjet.bonEtat,
  gouvernoratId: 'tunis',
  villeId: 'el-menzah',
  langueAnnonce: 'fr',
  statut: StatutObjet.disponible,
  creeLe: DateTime(2026, 11, 10),
);

void main() {
  final velo = _objet('Vélo de ville', 'Très bon état');
  final perceuse = _objet('Perceuse', 'Avec une mèche pour le béton');
  final tous = [velo, perceuse];

  group('normaliser', () {
    test('minuscules et sans accents', () {
      expect(normaliser('  Vélo ÉTÉ  '), 'velo ete');
    });
  });

  group('filtrerParTexte', () {
    test('un texte vide garde tout', () {
      expect(filtrerParTexte(tous, ''), tous);
      expect(filtrerParTexte(tous, '   '), tous);
    });

    test('ignore la casse et les accents', () {
      expect(filtrerParTexte(tous, 'VELO'), [velo]);
      expect(filtrerParTexte(tous, 'meche'), [perceuse]);
    });

    test('cherche aussi dans la description', () {
      expect(filtrerParTexte(tous, 'beton'), [perceuse]);
    });

    test('tous les mots doivent correspondre', () {
      expect(filtrerParTexte(tous, 'velo ville'), [velo]);
      expect(filtrerParTexte(tous, 'velo perceuse'), isEmpty);
    });
  });
}
