import 'package:borrowbetter/src/features/profil/domain/utilisateur.dart';

abstract class DepotUtilisateurs {
  /// Crée le document s'il n'existe pas. Ne touche à rien sinon.
  Future<void> assurerExistence({
    required String uid,
    required String email,
    String? nom,
    String? photoUrl,
  });

  /// Utilisé à l'inscription : le nom saisi arrive après la création du compte.
  Future<void> definirNom(String uid, String nom);

  Stream<Utilisateur?> observer(String uid);

  Future<void> mettreAJour({
    required String uid,
    required String nom,
    String? photoUrl,
    String? gouvernorat,
    String? ville,
  });
}
