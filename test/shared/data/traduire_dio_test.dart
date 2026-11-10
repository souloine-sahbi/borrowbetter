import 'package:borrowbetter/src/shared/data/traduire_dio.dart';
import 'package:borrowbetter/src/shared/domain/failure.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';

DioException _avecCode(int code) {
  final options = RequestOptions();
  return DioException(
    requestOptions: options,
    type: DioExceptionType.badResponse,
    response: Response<void>(requestOptions: options, statusCode: code),
  );
}

void main() {
  group('traduireDio', () {
    test('délai dépassé : pas de réseau', () {
      final e = DioException(
        requestOptions: RequestOptions(),
        type: DioExceptionType.connectionTimeout,
      );
      expect(traduireDio(e), isA<PasDeReseau>());
    });

    test('401 et 403 : non autorisé', () {
      expect(traduireDio(_avecCode(401)), isA<NonAutorise>());
      expect(traduireDio(_avecCode(403)), isA<NonAutorise>());
    });

    test('404 : introuvable', () {
      expect(traduireDio(_avecCode(404)), isA<Introuvable>());
    });

    test('400 : erreur serveur avec le code', () {
      final failure = traduireDio(_avecCode(400));
      expect(failure, isA<ErreurServeur>());
      expect((failure as ErreurServeur).code, '400');
    });

    test('aucune réponse : pas de réseau', () {
      final e = DioException(requestOptions: RequestOptions());
      expect(traduireDio(e), isA<PasDeReseau>());
    });
  });
}
