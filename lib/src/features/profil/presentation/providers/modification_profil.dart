import 'package:borrowbetter/src/features/objets/presentation/objets_providers.dart';
import 'package:borrowbetter/src/features/profil/domain/utilisateur.dart';
import 'package:borrowbetter/src/features/profil/presentation/providers/utilisateur_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ModificationProfil extends AsyncNotifier<void> {
  @override
  Future<void> build() async {}

  /// Envoie d'abord la nouvelle photo (si elle existe), puis met à jour le
  /// document.
  Future<void> enregistrer({
    required Utilisateur actuel,
    required String nom,
    required String? gouvernorat,
    required String? ville,
    String? cheminPhoto,
  }) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      var photoUrl = actuel.photoUrl;
      if (cheminPhoto != null) {
        final adresses = await ref.read(depotPhotosProvider).envoyer([
          cheminPhoto,
        ]);
        photoUrl = adresses.first;
      }
      await ref
          .read(depotUtilisateursProvider)
          .mettreAJour(
            uid: actuel.uid,
            nom: nom,
            photoUrl: photoUrl,
            gouvernorat: gouvernorat,
            ville: ville,
          );
    });
  }
}

final modificationProfilProvider =
    AsyncNotifierProvider<ModificationProfil, void>(ModificationProfil.new);
