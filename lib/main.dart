import 'package:borrowbetter/firebase_options.dart';
import 'package:borrowbetter/src/shared/theme/theme.dart';
import 'package:borrowbetter/src/shared/widgets/badge_statut.dart';
import 'package:borrowbetter/src/shared/widgets/bouton_principal.dart';
import 'package:borrowbetter/src/shared/widgets/carte_objet.dart';
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
        padding: const EdgeInsets.all(16),
        children: [
          BoutonPrincipal(libelle: 'Envoyer', onPressed: () {}),
          const SizedBox(height: 12),
          BoutonPrincipal(
            libelle: 'Ajouter',
            icone: Icons.add,
            onPressed: () {},
          ),
          const SizedBox(height: 12),
          const BoutonPrincipal(
            libelle: 'Envoi',
            onPressed: null,
            enChargement: true,
          ),
          const SizedBox(height: 16),
          const Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              BadgeStatut(statut: StatutBadge.enAttente, libelle: 'En attente'),
              BadgeStatut(statut: StatutBadge.acceptee, libelle: 'Acceptée'),
              BadgeStatut(statut: StatutBadge.refusee, libelle: 'Refusée'),
              BadgeStatut(statut: StatutBadge.annulee, libelle: 'Annulée'),
              BadgeStatut(statut: StatutBadge.enCours, libelle: 'En cours'),
              BadgeStatut(statut: StatutBadge.rendue, libelle: 'Rendue'),
            ],
          ),
          const SizedBox(height: 16),
          const CarteObjet(
            titre: 'Perceuse sans fil',
            categorie: 'Outils',
            etat: 'Bon état',
            zone: 'El Mourouj, Ben Arous',
          ),
          const SizedBox(height: 12),
          const CarteObjet(
            titre: 'Tente 4 personnes',
            categorie: 'Camping',
            etat: 'Comme neuf',
            zone: 'Tunis, Tunis',
            variante: VarianteCarte.liste,
          ),
        ],
      ),
    );
  }
}
