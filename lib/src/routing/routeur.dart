import 'package:borrowbetter/src/features/accueil/presentation/ecran_accueil.dart';
import 'package:borrowbetter/src/features/parametres/presentation/ecran_parametres.dart';
import 'package:borrowbetter/src/features/recherche/presentation/ecran_recherche.dart';
import 'package:borrowbetter/src/routing/chemins.dart';
import 'package:borrowbetter/src/routing/coquille_navigation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final routeurProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: Chemins.accueil,
    routes: [
      StatefulShellRoute.indexedStack(
        builder: (context, state, coquille) =>
            CoquilleNavigation(coquille: coquille),
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: Chemins.accueil,
                builder: (context, state) => const EcranAccueil(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: Chemins.recherche,
                builder: (context, state) => const EcranRecherche(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: Chemins.parametres,
                builder: (context, state) => const EcranParametres(),
              ),
            ],
          ),
        ],
      ),
    ],
  );
});
