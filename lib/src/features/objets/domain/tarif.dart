import 'package:borrowbetter/src/features/objets/domain/unite_tarif.dart';

enum ErreurTarif { prixInvalide, prixTropEleve, uniteManquante }

const prixMaximum = 100000.0;

/// Accepte la virgule comme séparateur décimal.
double? analyserPrix(String saisie) =>
    double.tryParse(saisie.trim().replaceAll(',', '.'));

ErreurTarif? validerPrix(String? saisie) {
  final prix = analyserPrix(saisie ?? '');
  if (prix == null || prix.isNaN || prix <= 0) return ErreurTarif.prixInvalide;
  if (prix > prixMaximum) return ErreurTarif.prixTropEleve;
  return null;
}

ErreurTarif? validerUnite(UniteTarif? unite) =>
    unite == null ? ErreurTarif.uniteManquante : null;
