import 'package:borrowbetter/src/shared/domain/failure.dart';
import 'package:borrowbetter/src/shared/l10n/app_localizations.dart';

/// Message humain pour l'utilisateur. Le détail technique se journalise,
/// il ne s'affiche jamais.
String messagePour(AppLocalizations textes, Object erreur) {
  if (erreur is! Failure) return textes.erreurInconnue;
  return switch (erreur) {
    PasDeReseau() => textes.erreurReseau,
    NonAutorise() => textes.erreurNonAutorise,
    Introuvable() => textes.erreurIntrouvable,
    ErreurServeur() => textes.erreurServeur,
  };
}
