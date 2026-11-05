import 'dart:async';

import 'package:borrowbetter/src/routing/chemins.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

class EcranSplash extends StatefulWidget {
  const new({super.key});

  @override
  State<EcranSplash> createState() => _EtatEcranSplash();
}

class _EtatEcranSplash extends State<EcranSplash>
    with SingleTickerProviderStateMixin {
  late final _controleur = AnimationController(vsync: this);
  var _termine = false;

  @override
  void dispose() {
    _controleur.dispose();
    super.dispose();
  }

  void _continuer() {
    if (_termine || !mounted) return;
    _termine = true;
    context.go(Chemins.accueil);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: Lottie.asset(
          'assets/animations/splash.json',
          controller: _controleur,
          fit: BoxFit.cover,
          onLoaded: (composition) {
            _controleur.duration = composition.duration;
            unawaited(_controleur.forward().whenComplete(_continuer));
          },
          errorBuilder: (context, erreur, trace) {
            WidgetsBinding.instance.addPostFrameCallback((_) => _continuer());
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
