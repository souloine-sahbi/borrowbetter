import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class DepotAuth {
  new(this._auth);

  final FirebaseAuth _auth;

  Stream<User?> get changements => _auth.authStateChanges();

  User? get utilisateur => _auth.currentUser;

  Future<void> connexion({required String email, required String motDePasse}) =>
      _auth.signInWithEmailAndPassword(email: email, password: motDePasse);

  Future<void> inscription({
    required String nom,
    required String email,
    required String motDePasse,
  }) async {
    final identifiants = await _auth.createUserWithEmailAndPassword(
      email: email,
      password: motDePasse,
    );
    await identifiants.user?.updateDisplayName(nom);
  }

  /// Flux natif Firebase : pas besoin du paquet google_sign_in.
  /// Nécessite Google activé dans la console, le SHA-1/SHA-256 et le
  /// google-services.json à jour.
  Future<void> connexionGoogle() =>
      _auth.signInWithProvider(GoogleAuthProvider());

  Future<void> deconnexion() async {
    // Aucun jeton n'est stocké pour l'instant ; on vide le coffre par
    // précaution pour que rien ne survive à la déconnexion.
    await const FlutterSecureStorage().deleteAll();
    await _auth.signOut();
  }

  Future<void> reinitialiserMotDePasse(String email) =>
      _auth.sendPasswordResetEmail(email: email);
}

final depotAuthProvider = Provider<DepotAuth>(
  (ref) => DepotAuth(FirebaseAuth.instance),
);

final etatAuthProvider = StreamProvider<User?>(
  (ref) => ref.watch(depotAuthProvider).changements,
);
