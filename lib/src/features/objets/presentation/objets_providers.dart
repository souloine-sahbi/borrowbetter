import 'package:borrowbetter/src/features/objets/data/depot_objets_firestore.dart';
import 'package:borrowbetter/src/features/objets/domain/depot_objets.dart';
import 'package:borrowbetter/src/features/objets/domain/objet.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final depotObjetsProvider = Provider<DepotObjets>(
  (ref) => DepotObjetsFirestore(FirebaseFirestore.instance),
);

final objetsDisponiblesProvider = StreamProvider<List<Objet>>(
  (ref) => ref.watch(depotObjetsProvider).surveillerDisponibles(),
);
