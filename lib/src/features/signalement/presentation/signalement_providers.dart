import 'package:borrowbetter/src/features/auth/data/depot_auth.dart';
import 'package:borrowbetter/src/features/signalement/data/depot_signalements_firestore.dart';
import 'package:borrowbetter/src/features/signalement/domain/depot_signalements.dart';
import 'package:borrowbetter/src/features/signalement/domain/signalement.dart';
import 'package:borrowbetter/src/shared/domain/failure.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final depotSignalementsProvider = Provider<DepotSignalements>(
  (ref) => DepotSignalementsFirestore(FirebaseFirestore.instance),
);

class EnvoiSignalement extends AsyncNotifier<void> {
  @override
  Future<void> build() async {}

  Future<void> envoyer(BrouillonSignalement brouillon) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final uid = ref.read(depotAuthProvider).utilisateur?.uid;
      if (uid == null) throw const NonAutorise();
      await ref
          .read(depotSignalementsProvider)
          .envoyer(brouillon, auteurId: uid);
    });
  }
}

final AsyncNotifierProvider<EnvoiSignalement, void> envoiSignalementProvider =
    AsyncNotifierProvider.autoDispose<EnvoiSignalement, void>(
      EnvoiSignalement.new,
    );
