enum ErreurSignalement { descriptionCourte, descriptionLongue }

const descriptionMin = 10;
const descriptionMax = 500;

ErreurSignalement? validerDescriptionSignalement(
  String? valeur, {
  bool obligatoire = true,
}) {
  final longueur = (valeur ?? '').trim().length;
  if (!obligatoire && longueur == 0) return null;
  if (longueur < descriptionMin) return ErreurSignalement.descriptionCourte;
  if (longueur > descriptionMax) return ErreurSignalement.descriptionLongue;
  return null;
}
