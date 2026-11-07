import 'package:borrowbetter/src/features/auth/domain/force_mot_de_passe.dart';
import 'package:borrowbetter/src/features/auth/presentation/indicateur_force_mot_de_passe.dart';
import 'package:borrowbetter/src/features/lieux/presentation/selecteur_localisation.dart';
import 'package:borrowbetter/src/shared/l10n/app_localizations.dart';
import 'package:borrowbetter/src/shared/theme/dimensions.dart';
import 'package:borrowbetter/src/shared/widgets/avatar_profil.dart';
import 'package:borrowbetter/src/shared/widgets/badge_statut.dart';
import 'package:borrowbetter/src/shared/widgets/bouton_principal.dart';
import 'package:borrowbetter/src/shared/widgets/carte_objet.dart';
import 'package:borrowbetter/src/shared/widgets/centre_chargement.dart';
import 'package:borrowbetter/src/shared/widgets/chip_categorie.dart';
import 'package:borrowbetter/src/shared/widgets/erreur_vue.dart';
import 'package:borrowbetter/src/shared/widgets/etat_vide.dart';
import 'package:borrowbetter/src/shared/widgets/logo_marque.dart';
import 'package:borrowbetter/src/shared/widgets/selecteur_langue.dart';
import 'package:borrowbetter/src/shared/widgets/selecteur_theme.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CatalogueWidgets extends StatefulWidget {
  const new({super.key});

  @override
  State<CatalogueWidgets> createState() => _EtatCatalogueWidgets();
}

class _EtatCatalogueWidgets extends State<CatalogueWidgets> {
  static const _categories = ['Outils', 'Camping', 'Cuisine', 'Sport'];

  final _motDePasse = TextEditingController();
  var _categorie = 'Outils';
  String? _gouvernorat;
  String? _ville;

  @override
  void dispose() {
    _motDePasse.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textes = AppLocalizations.of(context);
    final force = evaluerForce(_motDePasse.text);
    return Scaffold(
      appBar: AppBar(title: Text(textes.appTitre)),
      body: ListView(
        padding: const EdgeInsets.all(Espacements.l),
        children: [
          const _Section(titre: 'Identité visuelle', enfant: LogoMarque()),
          const _Section(
            titre: 'Langue (FR / EN / AR)',
            enfant: SelecteurLangue(),
          ),
          const _Section(titre: 'Thème', enfant: SelecteurTheme()),
          _Section(
            titre: 'Boutons',
            enfant: Column(
              children: [
                BoutonPrincipal(libelle: 'Principal', onPressed: () {}),
                const SizedBox(height: Espacements.s),
                BoutonPrincipal(
                  libelle: 'Avec icône',
                  icone: Icons.add,
                  onPressed: () {},
                ),
                const SizedBox(height: Espacements.s),
                const BoutonPrincipal(
                  libelle: 'Chargement',
                  onPressed: null,
                  enChargement: true,
                ),
              ],
            ),
          ),
          _Section(
            titre: 'Badges de statut',
            enfant: Wrap(
              spacing: Espacements.s,
              runSpacing: Espacements.s,
              children: [
                BadgeStatut(
                  statut: StatutBadge.enAttente,
                  libelle: textes.statutEnAttente,
                ),
                BadgeStatut(
                  statut: StatutBadge.acceptee,
                  libelle: textes.statutAcceptee,
                ),
                BadgeStatut(
                  statut: StatutBadge.refusee,
                  libelle: textes.statutRefusee,
                ),
                BadgeStatut(
                  statut: StatutBadge.annulee,
                  libelle: textes.statutAnnulee,
                ),
                BadgeStatut(
                  statut: StatutBadge.enCours,
                  libelle: textes.statutEnCours,
                ),
                BadgeStatut(
                  statut: StatutBadge.rendue,
                  libelle: textes.statutRendue,
                ),
              ],
            ),
          ),
          _Section(
            titre: 'Puces de catégorie',
            enfant: Wrap(
              spacing: Espacements.s,
              runSpacing: Espacements.s,
              children: [
                for (final categorie in _categories)
                  ChipCategorie(
                    libelle: categorie,
                    selectionne: categorie == _categorie,
                    onTap: () => setState(() => _categorie = categorie),
                  ),
              ],
            ),
          ),
          const _Section(
            titre: 'Avatars',
            enfant: Row(
              children: [
                AvatarProfil(nom: 'Souloine Sahbi'),
                SizedBox(width: Espacements.m),
                AvatarProfil(nom: 'Hanin', rayon: 32),
              ],
            ),
          ),
          const _Section(
            titre: 'Cartes d’objet',
            enfant: Column(
              children: [
                CarteObjet(
                  titre: 'Perceuse sans fil',
                  categorie: 'Outils',
                  etat: 'Bon état',
                  zone: 'El Mourouj, Ben Arous',
                ),
                SizedBox(height: Espacements.m),
                CarteObjet(
                  titre: 'Tente 4 personnes',
                  categorie: 'Camping',
                  etat: 'Comme neuf',
                  zone: 'Tunis, Tunis',
                  variante: VarianteCarte.liste,
                ),
              ],
            ),
          ),
          _Section(
            titre: 'États : vide, erreur, chargement',
            enfant: Column(
              children: [
                SizedBox(
                  height: 160,
                  child: EtatVide(
                    titre: textes.aucunResultat,
                    icone: Icons.search_off,
                  ),
                ),
                SizedBox(
                  height: 160,
                  child: ErreurVue(
                    message: textes.erreurChargement,
                    libelleReessayer: textes.actionReessayer,
                    onReessayer: () {},
                  ),
                ),
                const SizedBox(height: 80, child: CentreChargement()),
              ],
            ),
          ),
          _Section(
            titre: 'Localisation (gouvernorat et ville)',
            enfant: SelecteurLocalisation(
              gouvernoratId: _gouvernorat,
              villeId: _ville,
              onChanged: (gouvernorat, ville) => setState(() {
                _gouvernorat = gouvernorat;
                _ville = ville;
              }),
            ),
          ),
          _Section(
            titre: 'Formulaire et force du mot de passe',
            enfant: Column(
              children: [
                TextField(
                  controller: _motDePasse,
                  obscureText: true,
                  onChanged: (_) => setState(() {}),
                  decoration: InputDecoration(labelText: textes.authMotDePasse),
                ),
                if (force != ForceMotDePasse.aucune) ...[
                  const SizedBox(height: Espacements.s),
                  IndicateurForceMotDePasse(force: force),
                ],
              ],
            ),
          ),
          _Section(
            titre: 'Animation du splash (Lottie)',
            enfant: Lottie.asset(
              'assets/animations/splash.json',
              height: 160,
              errorBuilder: (context, erreur, trace) =>
                  const Text('assets/animations/splash.json introuvable'),
            ),
          ),
        ],
      ),
    );
  }
}

class _Section extends StatelessWidget {
  const new({required this.titre, required this.enfant});

  final String titre;
  final Widget enfant;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: Espacements.xl),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            titre,
            style: Theme.of(context).textTheme.titleMedium
                ?.copyWith(fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: Espacements.s),
          enfant,
        ],
      ),
    );
  }
}
