import 'package:borrowbetter/src/features/signalement/domain/depot_signalements.dart';
import 'package:borrowbetter/src/features/signalement/domain/signalement.dart';
import 'package:borrowbetter/src/shared/data/traduire_firebase.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DepotSignalementsFirestore implements DepotSignalements {
  new(this._firestore);

  final FirebaseFirestore _firestore;

  @override
  Future<void> envoyer(
    BrouillonSignalement brouillon, {
    required String auteurId,
  }) async {
    try {
      await _firestore.collection('reports').add({
        'auteurId': auteurId,
        'cibleType': brouillon.cible.name,
        'cibleId': brouillon.cibleId,
        'motif': brouillon.motif.name,
        'description': brouillon.description.trim(),
        'statut': 'ouvert',
        'creeLe': FieldValue.serverTimestamp(),
      });
    } on FirebaseException catch (e, trace) {
      Error.throwWithStackTrace(traduireFirebase(e), trace);
    }
  }
}
