import 'package:borrowbetter/src/features/traduction/data/traduction_dto.dart';
import 'package:borrowbetter/src/shared/domain/failure.dart';
import 'package:dio/dio.dart';

const urlMyMemory = 'https://api.mymemory.translated.net';

class SourceTraduction {
  new(this._dio);

  final Dio _dio;

  Future<TraductionDto> traduire(
    String texte, {
    required String de,
    required String vers,
  }) async {
    try {
      final reponse = await _dio.get<Map<String, dynamic>>(
        '/get',
        queryParameters: {'q': texte, 'langpair': '$de|$vers'},
      );
      final donnees = reponse.data;
      if (donnees == null) throw const ErreurServeur('reponse-vide');
      return traductionDtoDepuisMap(donnees);
    } on DioException catch (e, trace) {
      Error.throwWithStackTrace(_traduire(e), trace);
    }
  }
}

/// Seul point de traduction DioException vers Failure pour cette source.
Failure _traduire(DioException e) => switch (e.type) {
  DioExceptionType.connectionTimeout ||
  DioExceptionType.sendTimeout ||
  DioExceptionType.receiveTimeout ||
  DioExceptionType.connectionError => const PasDeReseau(),
  _ => switch (e.response?.statusCode) {
    401 || 403 => const NonAutorise(),
    404 => const Introuvable(),
    final code? => ErreurServeur('$code'),
    null => const PasDeReseau(),
  },
};
