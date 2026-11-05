import 'package:borrowbetter/src/shared/l10n/app_localizations.dart';

final _formatEmail = RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$');

String? validerObligatoire(AppLocalizations textes, String? valeur) {
  if (valeur == null || valeur.trim().isEmpty) {
    return textes.validationObligatoire;
  }
  return null;
}

String? validerEmail(AppLocalizations textes, String? valeur) {
  final obligatoire = validerObligatoire(textes, valeur);
  if (obligatoire != null) return obligatoire;
  return _formatEmail.hasMatch(valeur!.trim()) ? null : textes.validationEmail;
}

String? validerMotDePasse(AppLocalizations textes, String? valeur) {
  if (valeur == null || valeur.length < 6) {
    return textes.validationMotDePasse;
  }
  return null;
}
