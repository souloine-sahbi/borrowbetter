import 'package:borrowbetter/src/features/objets/domain/tarif.dart';
import 'package:borrowbetter/src/features/objets/domain/unite_tarif.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('validerPrix', () {
    test('refuse vide, zéro, négatif et texte', () {
      expect(validerPrix(''), ErreurTarif.prixInvalide);
      expect(validerPrix('0'), ErreurTarif.prixInvalide);
      expect(validerPrix('-3'), ErreurTarif.prixInvalide);
      expect(validerPrix('abc'), ErreurTarif.prixInvalide);
      expect(validerPrix('NaN'), ErreurTarif.prixInvalide);
    });

    test('refuse un prix trop élevé', () {
      expect(validerPrix('100001'), ErreurTarif.prixTropEleve);
    });

    test('accepte un prix valide avec virgule ou point', () {
      expect(validerPrix('5'), isNull);
      expect(validerPrix('5,5'), isNull);
      expect(validerPrix(' 12.75 '), isNull);
    });
  });

  test('analyserPrix convertit la virgule', () {
    expect(analyserPrix('5,5'), 5.5);
    expect(analyserPrix('x'), isNull);
  });

  test('validerUnite exige une unité', () {
    expect(validerUnite(null), ErreurTarif.uniteManquante);
    expect(validerUnite(UniteTarif.jour), isNull);
  });
}
