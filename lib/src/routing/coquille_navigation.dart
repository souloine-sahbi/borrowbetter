import 'package:borrowbetter/src/routing/barre_navigation_maquette.dart';
import 'package:borrowbetter/src/routing/chemins.dart';
import 'package:borrowbetter/src/routing/tiroir_navigation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// Clé du Scaffold de la coquille : permet à un écran d'ouvrir le Drawer
/// même s'il possède son propre Scaffold.
final cleCoquille = GlobalKey<ScaffoldState>();

class CoquilleNavigation extends StatelessWidget {
  const new({required this.coquille, super.key});

  final StatefulNavigationShell coquille;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: cleCoquille,
      drawer: const TiroirNavigation(),
      body: coquille,
      bottomNavigationBar: BarreNavigationMaquette(
        indexCourant: coquille.currentIndex,
        onSelection: (index) => coquille.goBranch(
          index,
          initialLocation: index == coquille.currentIndex,
        ),
        onAjouter: () => context.push(Chemins.nouvelObjet),
      ),
    );
  }
}
