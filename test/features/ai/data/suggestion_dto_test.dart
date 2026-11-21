import 'package:borrowbetter/src/features/ai/data/suggestion_dto.dart';
import 'package:borrowbetter/src/shared/domain/failure.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('catégorie hors liste devient null', () {
    final s = suggestionDtoDepuisMap({
      'titre': 'Perceuse',
      'categorie': 'inconnue',
      'etat': 'inconnu',
      'description': 'Une perceuse.',
    }).versDomaine();
    expect(s.categorie, isNull);
    expect(s.etat, isNull);
    expect(s.titre, 'Perceuse');
  });

  test('titre vide : réponse invalide', () {
    expect(
      () => suggestionDtoDepuisMap({'titre': '  '}).versDomaine(),
      throwsA(isA<ErreurServeur>()),
    );
  });

  test('types inattendus ignorés sans planter', () {
    expect(
      () => suggestionDtoDepuisMap({'titre': 12}).versDomaine(),
      throwsA(isA<ErreurServeur>()),
    );
  });

  test('titre trop long borné à 80', () {
    final s = suggestionDtoDepuisMap({'titre': 'a' * 200}).versDomaine();
    expect(s.titre.length, lessThanOrEqualTo(80));
  });
}
