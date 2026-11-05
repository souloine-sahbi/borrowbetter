import 'package:borrowbetter/src/shared/l10n/app_localizations.dart';
import 'package:firebase_auth/firebase_auth.dart';

String messageErreurAuth(
  AppLocalizations textes,
  FirebaseAuthException erreur,
) {
  return switch (erreur.code) {
    'invalid-credential' ||
    'wrong-password' ||
    'user-not-found' ||
    'invalid-email' => textes.erreurIdentifiants,
    'email-already-in-use' => textes.erreurEmailUtilise,
    'weak-password' => textes.erreurMotDePasseFaible,
    'network-request-failed' => textes.erreurReseau,
    _ => textes.erreurInconnue,
  };
}
