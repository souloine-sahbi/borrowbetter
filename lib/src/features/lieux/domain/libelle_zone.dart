import 'package:borrowbetter/src/features/lieux/domain/lieux.dart';

/// Zone approximative « Ville, Gouvernorat » dans la langue donnée.
///
/// Si la ville est inconnue, renvoie le gouvernorat seul. Si le gouvernorat
/// est inconnu (ou la liste pas encore chargée), renvoie une chaîne vide.
String libelleZone(
  List<Gouvernorat> lieux, {
  required String gouvernoratId,
  required String villeId,
  required String langue,
}) {
  for (final gouvernorat in lieux) {
    if (gouvernorat.id != gouvernoratId) continue;
    for (final ville in gouvernorat.villes) {
      if (ville.id == villeId) {
        return '${ville.nom(langue)}, ${gouvernorat.nom(langue)}';
      }
    }
    return gouvernorat.nom(langue);
  }
  return '';
}
