import 'package:borrowbetter/firebase_options.dart';
import 'package:borrowbetter/src/shared/theme/theme.dart';
import 'package:borrowbetter/src/shared/widgets/centre_chargement.dart';
import 'package:borrowbetter/src/shared/widgets/erreur_vue.dart';
import 'package:borrowbetter/src/shared/widgets/etat_vide.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const ProviderScope(child: BorrowBetterApp()));
}

class BorrowBetterApp extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: construireTheme(Brightness.light),
      darkTheme: construireTheme(Brightness.dark),
      home: const _ApercuTheme(),
    );
  }
}

class _ApercuTheme extends StatelessWidget {
  const new();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('BorrowBetter')),
      body: ListView(
        children: [
          const SizedBox(height: 100, child: CentreChargement()),
          SizedBox(
            height: 220,
            child: ErreurVue(
              message: 'Impossible de charger les objets.',
              libelleReessayer: 'Réessayer',
              onReessayer: () {},
            ),
          ),
          const SizedBox(
            height: 220,
            child: EtatVide(
              titre: 'Aucun objet',
              message: 'Rien à afficher pour le moment.',
            ),
          ),
        ],
      ),
    );
  }
}
