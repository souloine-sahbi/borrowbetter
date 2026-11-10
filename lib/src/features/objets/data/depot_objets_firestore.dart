import 'package:borrowbetter/src/features/objets/domain/depot_objets.dart';
import 'package:borrowbetter/src/features/objets/domain/objet.dart';
import 'package:borrowbetter/src/shared/data/traduire_firebase.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DepotObjetsFirestore implements DepotObjets {
  new(this._firestore);

  final FirebaseFirestore _firestore;

  CollectionReference<Map<String, dynamic>> get _objets =>
      _firestore.collection('items');

  @override
  Stream<List<Objet>> surveillerDisponibles() {
    return _objets
        .where('statut', isEqualTo: StatutObjet.disponible.name)
        .snapshots()
        .map((instantane) {
          return [
            for (final doc in instantane.docs) _versObjet(doc.id, doc.data()),
          ]..sort((a, b) => b.creeLe.compareTo(a.creeLe));
        })
        .handleError((Object erreur, StackTrace trace) {
          if (erreur is FirebaseException) {
            Error.throwWithStackTrace(traduireFirebase(erreur), trace);
          }
          Error.throwWithStackTrace(erreur, trace);
        });
  }

  @override
  Future<Objet?> parId(String id) async {
    try {
      final doc = await _objets.doc(id).get();
      final donnees = doc.data();
      return donnees == null ? null : _versObjet(doc.id, donnees);
    } on FirebaseException catch (e, trace) {
      Error.throwWithStackTrace(traduireFirebase(e), trace);
    }
  }

  @override
  Future<String> publier(
    BrouillonObjet brouillon, {
    required String proprietaireId,
    required String proprietaireNom,
  }) async {
    try {
      final reference = _objets.doc();
      final lot = _firestore.batch()
        ..set(reference, {
          'proprietaireId': proprietaireId,
          'proprietaireNom': proprietaireNom,
          'titre': brouillon.titre,
          'description': brouillon.description,
          'categorie': brouillon.categorie.name,
          'etat': brouillon.etat.name,
          'gouvernoratId': brouillon.gouvernoratId,
          'villeId': brouillon.villeId,
          'langueAnnonce': brouillon.langueAnnonce,
          'statut': StatutObjet.disponible.name,
          'photos': <String>[],
          'creeLe': FieldValue.serverTimestamp(),
        })
        ..set(reference.collection('prive').doc('adresse'), {
          'cite': brouillon.cite,
          'rue': brouillon.rue,
        });

      await lot.commit();
      return reference.id;
    } on FirebaseException catch (e, trace) {
      Error.throwWithStackTrace(traduireFirebase(e), trace);
    }
  }
}

T _enumDepuis<T extends Enum>(List<T> valeurs, Object? nom, T parDefaut) =>
    valeurs.asNameMap()[nom] ?? parDefaut;

/// Conversion document Firestore vers modèle de domaine : tout est lu comme
/// nullable, les valeurs par défaut se décident ici et nulle part ailleurs.
Objet _versObjet(String id, Map<String, dynamic> donnees) {
  final photos = donnees['photos'] as List<dynamic>? ?? const [];

  return Objet(
    id: id,
    proprietaireId: donnees['proprietaireId'] as String? ?? '',
    proprietaireNom: donnees['proprietaireNom'] as String? ?? '',
    titre: donnees['titre'] as String? ?? '',
    description: donnees['description'] as String? ?? '',
    categorie: _enumDepuis(
      CategorieObjet.values,
      donnees['categorie'],
      CategorieObjet.autre,
    ),
    etat: _enumDepuis(EtatObjet.values, donnees['etat'], EtatObjet.bonEtat),
    gouvernoratId: donnees['gouvernoratId'] as String? ?? '',
    villeId: donnees['villeId'] as String? ?? '',
    langueAnnonce: donnees['langueAnnonce'] as String? ?? 'fr',
    statut: _enumDepuis(
      StatutObjet.values,
      donnees['statut'],
      StatutObjet.disponible,
    ),
    creeLe: (donnees['creeLe'] as Timestamp?)?.toDate() ?? DateTime.now(),
    photos: [for (final photo in photos) photo as String],
  );
}
