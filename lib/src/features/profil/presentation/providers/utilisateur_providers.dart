import 'package:borrowbetter/src/features/auth/data/depot_auth.dart';
import 'package:borrowbetter/src/features/profil/data/depot_utilisateurs_firestore.dart';
import 'package:borrowbetter/src/features/profil/domain/depot_utilisateurs.dart';
import 'package:borrowbetter/src/features/profil/domain/utilisateur.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final depotUtilisateursProvider = Provider<DepotUtilisateurs>(
  (ref) => DepotUtilisateursFirestore(FirebaseFirestore.instance),
);

String? _premierNonVide(List<String?> valeurs) {
  for (final valeur in valeurs) {
    if (valeur != null && valeur.trim().isNotEmpty) return valeur.trim();
  }
  return null;
}

/// Crée le document au besoin, puis observe le profil connecté.
final utilisateurCourantProvider = StreamProvider<Utilisateur?>((ref) async* {
  final compte = await ref.watch(etatAuthProvider.future);
  if (compte == null) {
    yield null;
    return;
  }
  // Avec Google, displayName peut être vide sur le compte Firebase alors
  // qu'il est présent dans les données du fournisseur.
  final fournisseur = compte.providerData.isEmpty
      ? null
      : compte.providerData.first;
  final depot = ref.watch(depotUtilisateursProvider);
  await depot.assurerExistence(
    uid: compte.uid,
    email: _premierNonVide([compte.email, fournisseur?.email]) ?? '',
    nom: _premierNonVide([compte.displayName, fournisseur?.displayName]),
    photoUrl: _premierNonVide([compte.photoURL, fournisseur?.photoURL]),
  );
  yield* depot.observer(compte.uid);
});
