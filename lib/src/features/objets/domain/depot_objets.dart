import 'package:borrowbetter/src/features/objets/domain/adresse_privee.dart';
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

  /// Met à jour les champs modifiables. Le propriétaire, la date de création
  /// et le statut ne changent jamais ici.
  Future<void> modifier(String id, BrouillonObjet brouillon);

  /// Adresse détaillée (réservée au propriétaire pour l'instant).
  Future<AdressePrivee?> lireAdresse(String id);
}
