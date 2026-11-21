import 'package:borrowbetter/src/features/signalement/domain/signalement.dart';

abstract interface class DepotSignalements {
  Future<void> envoyer(
    BrouillonSignalement brouillon, {
    required String auteurId,
  });
}
