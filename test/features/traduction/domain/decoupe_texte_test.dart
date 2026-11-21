import 'dart:convert';

import 'package:borrowbetter/src/features/traduction/domain/decoupe_texte.dart';
import 'package:flutter_test/flutter_test.dart';

int _octets(String texte) => utf8.encode(texte).length;

void main() {
  test('texte vide : aucun morceau', () {
    expect(decouperTexte('   '), isEmpty);
  });

  test('texte court : un seul morceau', () {
    expect(decouperTexte('Perceuse en bon état.'), ['Perceuse en bon état.']);
  });

  test('long texte arabe : chaque morceau tient dans la limite', () {
    final texte = List.filled(60, 'مرحبا بكم في التطبيق.').join(' ');
    final morceaux = decouperTexte(texte);
    expect(morceaux.length, greaterThan(1));
    expect(morceaux.every((m) => _octets(m) <= 450), isTrue);
    expect(morceaux.join(' '), texte);
  });

  test('mot démesuré sans espace : coupé quand même', () {
    final morceaux = decouperTexte('a' * 1000);
    expect(morceaux.every((m) => _octets(m) <= 450), isTrue);
    expect(morceaux.join().length, 1000);
  });
}
