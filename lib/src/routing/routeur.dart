import 'package:borrowbetter/src/features/accueil/presentation/ecran_accueil.dart';
import 'package:borrowbetter/src/features/auth/data/depot_auth.dart';
import 'package:borrowbetter/src/features/auth/presentation/ecran_connexion.dart';
import 'package:borrowbetter/src/features/auth/presentation/ecran_inscription.dart';
import 'package:borrowbetter/src/features/parametres/presentation/ecran_parametres.dart';
import 'package:borrowbetter/src/features/recherche/presentation/ecran_recherche.dart';
import 'package:borrowbetter/src/features/splash/presentation/ecran_splash.dart';
import 'package:borrowbetter/src/routing/chemins.dart';
import 'package:borrowbetter/src/routing/coquille_navigation.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final routeurProvider = Provider<GoRouter>((ref) {
  final rafraichir = ValueNotifier<int>(0);
  ref
    ..onDispose(rafraichir.dispose)
    ..listen(etatAuthProvider, (_, _) => rafraichir.value++);

  return GoRouter(
    initialLocation: Chemins.splash,
    refreshListenable: rafraichir,
    redirect: (context, state) {
      final lieu = state.matchedLocation;
      if (lieu == Chemins.splash) return null;

      final connecte = ref.read(depotAuthProvider).utilisateur != null;
      final surEcranAuth =
          lieu == Chemins.connexion || lieu == Chemins.inscription;
      if (!connecte && !surEcranAuth) return Chemins.connexion;
      if (connecte && surEcranAuth) return Chemins.accueil;
      return null;
    },
    routes: [
      GoRoute(
        path: Chemins.splash,
        builder: (context, state) => const EcranSplash(),
      ),
      GoRoute(
        path: Chemins.connexion,
        builder: (context, state) => const EcranConnexion(),
      ),
      GoRoute(
        path: Chemins.inscription,
        builder: (context, state) => const EcranInscription(),
      ),
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