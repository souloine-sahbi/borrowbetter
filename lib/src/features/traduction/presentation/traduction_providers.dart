import 'package:borrowbetter/src/features/traduction/data/depot_traduction_mymemory.dart';
import 'package:borrowbetter/src/features/traduction/data/source_traduction.dart';
import 'package:borrowbetter/src/features/traduction/domain/depot_traduction.dart';
import 'package:borrowbetter/src/features/traduction/domain/objet_traduit.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Client dédié : l'intercepteur d'authentification du client principal ne
/// doit jamais envoyer de jeton à un service tiers.
final dioTraductionProvider = Provider<Dio>(
  (ref) => Dio(
    BaseOptions(
      baseUrl: urlMyMemory,
      connectTimeout: const Duration(seconds: 8),
      receiveTimeout: const Duration(seconds: 12),
      headers: {'Accept': 'application/json'},
    ),
  ),
);

final depotTraductionProvider = Provider<DepotTraduction>(
  (ref) => DepotTraductionMyMemory(
    SourceTraduction(ref.watch(dioTraductionProvider)),
  ),
);

typedef CleTraduction = ({
  String titre,
  String description,
  String de,
  String vers,
});

// Riverpod does not publicly export the concrete family provider type.
// ignore: specify_nonobvious_property_types
final traductionProvider = FutureProvider.autoDispose
    .family<ObjetTraduit, CleTraduction>((ref, cle) async {
      // Justifié : chaque appel consomme le quota gratuit de l'API.
      ref.keepAlive();
      final depot = ref.watch(depotTraductionProvider);
      final titre = await depot.traduire(cle.titre, de: cle.de, vers: cle.vers);
      final description = cle.description.trim().isEmpty
          ? ''
          : await depot.traduire(cle.description, de: cle.de, vers: cle.vers);
      return ObjetTraduit(titre: titre, description: description);
    }, retry: (_, _) => null);
