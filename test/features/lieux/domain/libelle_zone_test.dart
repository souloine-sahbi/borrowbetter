import 'package:borrowbetter/src/features/lieux/domain/libelle_zone.dart';
import 'package:borrowbetter/src/features/lieux/domain/lieux.dart';
import 'package:flutter_test/flutter_test.dart';

const _lieux = [
  Gouvernorat(
    id: 'tunis',
    nomFr: 'Tunis',
    nomAr: 'تونس',
    villes: [Ville(id: 'el-menzah', nomFr: 'El Menzah', nomAr: 'المنزه')],
  ),
];

void main() {
  group('libelleZone', () {
    test('ville et gouvernorat en français', () {
      expect(
        libelleZone(
          _lieux,
          gouvernoratId: 'tunis',
          villeId: 'el-menzah',
          langue: 'fr',
        ),
        'El Menzah, Tunis',
      );
    });

    test('ville et gouvernorat en arabe', () {
      expect(
        libelleZone(
          _lieux,
          gouvernoratId: 'tunis',
          villeId: 'el-menzah',
          langue: 'ar',
        ),
        'المنزه, تونس',
      );
    });

    test('ville inconnue : le gouvernorat seul', () {
      expect(
        libelleZone(
          _lieux,
          gouvernoratId: 'tunis',
          villeId: 'inconnue',
          langue: 'fr',
        ),
        'Tunis',
      );
    });

    test('gouvernorat inconnu ou liste vide : chaîne vide', () {
      expect(
        libelleZone(_lieux, gouvernoratId: 'x', villeId: 'y', langue: 'fr'),
        '',
      );
      expect(
        libelleZone(
          const [],
          gouvernoratId: 'tunis',
          villeId: 'el-menzah',
          langue: 'fr',
        ),
        '',
      );
    });
  });
}
