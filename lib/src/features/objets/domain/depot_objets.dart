import 'package:borrowbetter/src/features/objets/domain/objet.dart';

abstract interface class DepotObjets {
  /// Objets disponibles, du plus récent au plus ancien.
  ///
  /// Chaque filtre fourni restreint la requête (égalités simples : aucun
  /// index composite à créer).
  Stream<List<Objet>> surveillerDisponibles({
    CategorieObjet? categorie,
    String? gouvernoratId,
    String? villeId,
  });

  Future<Objet?> parId(String id);

  Future<String> publier(
    BrouillonObjet brouillon, {
    required String proprietaireId,
    required String proprietaireNom,
  });
}
