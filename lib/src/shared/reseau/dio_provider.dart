import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Un seul client HTTP, partagé par toutes les sources de données.
final dioProvider = Provider<Dio>((ref) {
  final dio = Dio(
    BaseOptions(
      connectTimeout: const Duration(seconds: 8),
      receiveTimeout: const Duration(seconds: 12),
      // Les envois de photos sont plus longs que les lectures.
      sendTimeout: const Duration(seconds: 30),
      headers: {'Accept': 'application/json'},
    ),
  );
  // Journaux en debug uniquement, et sans le corps des requêtes : il
  // contiendrait les octets des photos.
  if (kDebugMode) {
    dio.interceptors.add(LogInterceptor());
  }
  return dio;
});
