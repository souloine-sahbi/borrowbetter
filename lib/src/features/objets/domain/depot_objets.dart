import 'package:borrowbetter/src/features/objets/domain/objet.dart';

abstract interface class DepotObjets {
  Stream<List<Objet>> surveillerDisponibles();

  Future<Objet?> parId(String id);

  Future<String> publier(
    BrouillonObjet brouillon, {
    required String proprietaireId,
    required String proprietaireNom,
  });
}
