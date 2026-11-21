import 'package:borrowbetter/src/features/objets/domain/objet.dart';
import 'package:borrowbetter/src/features/objets/presentation/objets_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ModificationObjet extends AsyncNotifier<void> {
  @override
  Future<void> build() async {}

  /// Envoie les nouvelles photos (chemins locaux), les ajoute aux adresses
  /// déjà publiées, puis met à jour le document. [brouillon] porte les
  /// champs saisis ; sa liste `photos` est remplacée par la liste finale.
  Future<void> enregistrer(
    String id,
    BrouillonObjet brouillon, {
    required List<String> photosExistantes,
    required List<String> nouvellesPhotos,
  }) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final ajoutees = nouvellesPhotos.isEmpty
          ? const <String>[]
          : await ref.read(depotPhotosProvider).envoyer(nouvellesPhotos);
      await ref
          .read(depotObjetsProvider)
          .modifier(
            id,
            brouillon.copyWith(photos: [...photosExistantes, ...ajoutees]),
          );
    });
  }
}

final AsyncNotifierProvider<ModificationObjet, void> modificationObjetProvider =
    AsyncNotifierProvider.autoDispose<ModificationObjet, void>(
      ModificationObjet.new,
    );
