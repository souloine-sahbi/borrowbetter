import 'package:borrowbetter/src/shared/domain/failure.dart';
import 'package:dio/dio.dart';

/// Le seul endroit où une [DioException] devient une [Failure].
Failure traduireDio(DioException e) {
  return switch (e.type) {
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
}
