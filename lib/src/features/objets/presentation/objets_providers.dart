import 'package:borrowbetter/src/features/objets/data/depot_objets_firestore.dart';
import 'package:borrowbetter/src/features/objets/data/depot_photos_cloudinary.dart';
import 'package:borrowbetter/src/features/objets/domain/depot_objets.dart';
import 'package:borrowbetter/src/features/objets/domain/depot_photos.dart';
import 'package:borrowbetter/src/features/objets/domain/objet.dart';
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
