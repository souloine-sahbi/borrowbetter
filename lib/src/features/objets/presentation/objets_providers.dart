import 'package:borrowbetter/src/features/objets/data/depot_objets_firestore.dart';
import 'package:borrowbetter/src/features/objets/data/depot_photos_cloudinary.dart';
import 'package:borrowbetter/src/features/objets/domain/depot_objets.dart';
import 'package:borrowbetter/src/features/objets/domain/depot_photos.dart';
import 'package:borrowbetter/src/features/objets/domain/objet.dart';
import 'package:borrowbetter/src/shared/domain/failure.dart';
import 'package:borrowbetter/src/shared/reseau/dio_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final depotObjetsProvider = Provider<DepotObjets>(
  (ref) => DepotObjetsFirestore(FirebaseFirestore.instance),
);

// Seul point de bascule de l'hébergement des photos.
final depotPhotosProvider = Provider<DepotPhotos>(
  (ref) => DepotPhotosCloudinary(ref.watch(dioProvider)),
);

final objetsDisponiblesProvider = StreamProvider<List<Objet>>(
  (ref) => ref.watch(depotObjetsProvider).surveillerDisponibles(),
);

/// Un objet par identifiant. Libéré dès que plus aucun écran ne l'observe.
///
/// Un objet absent est une [Introuvable], pas une valeur nulle : l'écran n'a
/// que trois cas à traiter. Pas de nouvelle tentative automatique, elle
/// n'aurait aucun sens pour un objet qui n'existe pas.
// Le type d'un provider « family » est généré par Riverpod et n'est pas
// exporté sous un nom stable : on laisse l'inférence.
// ignore: specify_nonobvious_property_types
final objetProvider = FutureProvider.autoDispose.family<Objet, String>((
  ref,
  id,
) async {
  final objet = await ref.watch(depotObjetsProvider).parId(id);
  if (objet == null) throw const Introuvable();
  return objet;
}, retry: (nombre, erreur) => null);
