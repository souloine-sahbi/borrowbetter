import 'package:borrowbetter/src/shared/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CoquilleNavigation extends StatelessWidget {
  const new({required this.coquille, super.key});

  final StatefulNavigationShell coquille;

  @override
  Widget build(BuildContext context) {
    final textes = AppLocalizations.of(context);
    return Scaffold(
      body: coquille,
      bottomNavigationBar: NavigationBar(
        selectedIndex: coquille.currentIndex,
        onDestinationSelected: (index) => coquille.goBranch(
          index,
          initialLocation: index == coquille.currentIndex,
        ),
        destinations: [
          NavigationDestination(
            icon: const Icon(Icons.home_outlined),
            selectedIcon: const Icon(Icons.home),
            label: textes.navAccueil,
          ),
          NavigationDestination(
            icon: const Icon(Icons.search),
            label: textes.navRecherche,
          ),
          NavigationDestination(
            icon: const Icon(Icons.settings_outlined),
            selectedIcon: const Icon(Icons.settings),
            label: textes.navParametres,
          ),
        ],
      ),
    );
  }
}
