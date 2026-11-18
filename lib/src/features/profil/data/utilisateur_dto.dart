import 'package:borrowbetter/src/features/profil/domain/utilisateur.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UtilisateurDto {
  const new({
    this.nom,
    this.email,
    this.photoUrl,
    this.gouvernorat,
    this.ville,
    this.statut,
    this.creeLe,
  });

  final String? nom;
  final String? email;
  final String? photoUrl;
  final String? gouvernorat;
  final String? ville;
  final String? statut;
  final DateTime? creeLe;

  Utilisateur versDomaine(String uid) {
    final nomPropre = (nom ?? '').trim();
    return Utilisateur(
      uid: uid,
      nom: nomPropre.isEmpty ? 'Utilisateur' : nomPropre,
      email: email ?? '',
      photoUrl: photoUrl,
      gouvernorat: gouvernorat,
      ville: ville,
      statut: statut == 'suspendu' ? StatutCompte.suspendu : StatutCompte.actif,
      creeLe: creeLe ?? DateTime.now(),
    );
  }
}

/// Lit un document Firestore sans rien supposer : tout champ peut manquer.
UtilisateurDto utilisateurDtoDepuisMap(Map<String, dynamic> map) =>
    UtilisateurDto(
      nom: map['nom'] as String?,
      email: map['email'] as String?,
      photoUrl: map['photoUrl'] as String?,
      gouvernorat: map['gouvernorat'] as String?,
      ville: map['ville'] as String?,
      statut: map['statut'] as String?,
      creeLe: (map['creeLe'] as Timestamp?)?.toDate(),
    );
