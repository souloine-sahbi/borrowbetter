import 'package:borrowbetter/src/features/auth/data/depot_auth.dart';
import 'package:borrowbetter/src/features/auth/presentation/decoration_champ.dart';
import 'package:borrowbetter/src/features/auth/presentation/validateurs.dart';
import 'package:borrowbetter/src/features/lieux/presentation/selecteur_localisation.dart';
import 'package:borrowbetter/src/features/objets/domain/objet.dart';
import 'package:borrowbetter/src/features/objets/presentation/libelles_objet.dart';
import 'package:borrowbetter/src/features/objets/presentation/objets_providers.dart';
import 'package:borrowbetter/src/features/objets/presentation/selecteur_photos.dart';
import 'package:borrowbetter/src/shared/domain/failure.dart';
import 'package:borrowbetter/src/shared/l10n/app_localizations.dart';
import 'package:borrowbetter/src/shared/presentation/message_pour.dart';
import 'package:borrowbetter/src/shared/theme/dimensions.dart';
import 'package:borrowbetter/src/shared/widgets/bouton_principal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class EcranNouvelObjet extends ConsumerStatefulWidget {
  const new({super.key});

  @override
  ConsumerState<EcranNouvelObjet> createState() => _EtatEcranNouvelObjet();
}

class _EtatEcranNouvelObjet extends ConsumerState<EcranNouvelObjet> {
  final _formulaire = GlobalKey<FormState>();
  final _titre = TextEditingController();
  final _description = TextEditingController();
  final _cite = TextEditingController();
  final _rue = TextEditingController();
  CategorieObjet? _categorie;
  EtatObjet? _etat;
  String? _gouvernorat;
  String? _ville;
  var _photos = <String>[];
  var _enChargement = false;
  String? _erreur;

  @override
  void dispose() {
    _titre.dispose();
    _description.dispose();
    _cite.dispose();
    _rue.dispose();
    super.dispose();
  }

  Future<void> _publier() async {
    if (!_formulaire.currentState!.validate()) return;
    final utilisateur = ref.read(depotAuthProvider).utilisateur;
    if (utilisateur == null) return;

    final textes = AppLocalizations.of(context);
    final langue = Localizations.localeOf(context).languageCode;
    final messager = ScaffoldMessenger.of(context);
    final routeur = GoRouter.of(context);
    final rue = _rue.text.trim();

    setState(() {
      _enChargement = true;
      _erreur = null;
    });
    try {
      // Les photos d'abord : on n'enregistre l'objet qu'avec leurs adresses.
      final adresses = await ref.read(depotPhotosProvider).envoyer(_photos);
      await ref
          .read(depotObjetsProvider)
          .publier(
            BrouillonObjet(
              titre: _titre.text.trim(),
              description: _description.text.trim(),
              categorie: _categorie!,
              etat: _etat!,
              gouvernoratId: _gouvernorat!,
              villeId: _ville!,
              langueAnnonce: langue,
              cite: _cite.text.trim(),
              rue: rue.isEmpty ? null : rue,
              photos: adresses,
            ),
            proprietaireId: utilisateur.uid,
            proprietaireNom: utilisateur.displayName ?? '',
          );
      messager.showSnackBar(SnackBar(content: Text(textes.objetPublie)));
      routeur.pop();
    } on Failure catch (echec) {
      if (!mounted) return;
      setState(() => _erreur = messagePour(textes, echec));
    } finally {
      if (mounted) setState(() => _enChargement = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final textes = AppLocalizations.of(context);
    final erreur = _erreur;
    return Scaffold(
      appBar: AppBar(title: Text(textes.objetNouveau)),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(Espacements.l),
          children: [
            Form(
              key: _formulaire,
              child: Column(
                children: [
                  TextFormField(
                    controller: _titre,
                    decoration: decorationChamp(
                      libelle: textes.objetTitre,
                      icone: Icons.title,
                    ),
                    validator: (valeur) => validerObligatoire(textes, valeur),
                  ),
                  const SizedBox(height: Espacements.m),
                  DropdownButtonFormField<CategorieObjet>(
                    initialValue: _categorie,
                    isExpanded: true,
                    decoration: decorationChamp(
                      libelle: textes.objetCategorie,
                      icone: Icons.category_outlined,
                    ),
                    items: [
                      for (final categorie in CategorieObjet.values)
                        DropdownMenuItem(
                          value: categorie,
                          child: Text(libelleCategorie(textes, categorie)),
                        ),
                    ],
                    validator: (valeur) =>
                        valeur == null ? textes.validationObligatoire : null,
                    onChanged: (valeur) => setState(() => _categorie = valeur),
                  ),
                  const SizedBox(height: Espacements.m),
                  DropdownButtonFormField<EtatObjet>(
                    initialValue: _etat,
                    isExpanded: true,
                    decoration: decorationChamp(
                      libelle: textes.objetEtat,
                      icone: Icons.verified_outlined,
                    ),
                    items: [
                      for (final etat in EtatObjet.values)
                        DropdownMenuItem(
                          value: etat,
                          child: Text(libelleEtat(textes, etat)),
                        ),
                    ],
                    validator: (valeur) =>
                        valeur == null ? textes.validationObligatoire : null,
                    onChanged: (valeur) => setState(() => _etat = valeur),
                  ),
                  const SizedBox(height: Espacements.m),
                  TextFormField(
                    controller: _description,
                    minLines: 3,
                    maxLines: 5,
                    decoration: decorationChamp(
                      libelle: textes.objetDescription,
                      icone: Icons.notes,
                    ),
                    validator: (valeur) => validerObligatoire(textes, valeur),
                  ),
                  const SizedBox(height: Espacements.m),
                  SelecteurPhotos(
                    chemins: _photos,
                    onChanged: (chemins) => setState(() => _photos = chemins),
                  ),
                  const SizedBox(height: Espacements.m),
                  SelecteurLocalisation(
                    gouvernoratId: _gouvernorat,
                    villeId: _ville,
                    onChanged: (gouvernorat, ville) => setState(() {
                      _gouvernorat = gouvernorat;
                      _ville = ville;
                    }),
                  ),
                  const SizedBox(height: Espacements.m),
                  TextFormField(
                    controller: _cite,
                    decoration: decorationChamp(
                      libelle: textes.objetCite,
                      icone: Icons.home_work_outlined,
                    ),
                    validator: (valeur) => validerObligatoire(textes, valeur),
                  ),
                  const SizedBox(height: Espacements.m),
                  TextFormField(
                    controller: _rue,
                    decoration: decorationChamp(
                      libelle: textes.objetRue,
                      icone: Icons.signpost_outlined,
                    ),
                  ),
                ],
              ),
            ),
            if (erreur != null) ...[
              const SizedBox(height: Espacements.m),
              Text(
                erreur,
                style: TextStyle(color: Theme.of(context).colorScheme.error),
              ),
            ],
            const SizedBox(height: Espacements.l),
            BoutonPrincipal(
              libelle: textes.objetPublier,
              onPressed: _enChargement ? null : _publier,
              enChargement: _enChargement,
            ),
          ],
        ),
      ),
    );
  }
}
