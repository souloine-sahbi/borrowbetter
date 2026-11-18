import 'package:borrowbetter/src/features/profil/data/utilisateur_dto.dart';
import 'package:borrowbetter/src/features/profil/domain/depot_utilisateurs.dart';
import 'package:borrowbetter/src/features/profil/domain/utilisateur.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DepotUtilisateursFirestore implements DepotUtilisateurs {
  new(this._db);

  final FirebaseFirestore _db;

  DocumentReference<Map<String, dynamic>> _doc(String uid) =>
      _db.collection('users').doc(uid);

  @override
  Future<void> assurerExistence({
    required String uid,
    required String email,
    String? nom,
    String? photoUrl,
  }) async {
    final ref = _doc(uid);
    await _db.runTransaction((tx) async {
      final existant = await tx.get(ref);
      if (existant.exists) return;
      final nomPropre = (nom ?? '').trim();
      tx.set(ref, {
        'nom': nomPropre.isEmpty ? email.split('@').first : nomPropre,
        'email': email,
        'photoUrl': photoUrl,
        'gouvernorat': null,
        'ville': null,
        'statut': 'actif',
        'creeLe': FieldValue.serverTimestamp(),
      });
    });
  }

  @override
  Future<void> definirNom(String uid, String nom) =>
      _doc(uid).update({'nom': nom});

  @override
  Stream<Utilisateur?> observer(String uid) => _doc(uid).snapshots().map((s) {
    final data = s.data();
    if (data == null) return null;
    return utilisateurDtoDepuisMap(data).versDomaine(uid);
  });

  @override
  Future<void> mettreAJour({
    required String uid,
    required String nom,
    String? photoUrl,
    String? gouvernorat,
    String? ville,
  }) => _doc(uid).update({
    'nom': nom,
    'photoUrl': photoUrl,
    'gouvernorat': gouvernorat,
    'ville': ville,
  });
}
