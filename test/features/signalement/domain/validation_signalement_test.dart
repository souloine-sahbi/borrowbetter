import 'package:borrowbetter/src/features/signalement/domain/validation_signalement.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('refuse une description trop courte ou vide', () {
    expect(
      validerDescriptionSignalement(null),
      ErreurSignalement.descriptionCourte,
    );
    expect(
      validerDescriptionSignalement('  court  '),
      ErreurSignalement.descriptionCourte,
    );
  });

  test('refuse une description trop longue', () {
    expect(
      validerDescriptionSignalement('a' * 501),
      ErreurSignalement.descriptionLongue,
    );
  });

  test('accepte une description correcte', () {
    expect(
      validerDescriptionSignalement('Photo trompeuse, objet cassé'),
      isNull,
    );
  });
}
