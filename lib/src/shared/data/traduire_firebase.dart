import 'package:borrowbetter/src/shared/domain/failure.dart';
import 'package:firebase_core/firebase_core.dart';

/// Le seul endroit où une [FirebaseException] devient une [Failure].
Failure traduireFirebase(FirebaseException e) {
  return switch (e.code) {
    'unavailable' ||
    'network-request-failed' ||
    'deadline-exceeded' => const PasDeReseau(),
    'permission-denied' || 'unauthenticated' => const NonAutorise(),
    'not-found' => const Introuvable(),
    _ => ErreurServeur(e.code),
  };
}
