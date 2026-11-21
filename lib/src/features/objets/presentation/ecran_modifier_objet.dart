import 'package:borrowbetter/src/features/auth/data/depot_auth.dart';
import 'package:borrowbetter/src/features/auth/presentation/decoration_champ.dart';
import 'package:borrowbetter/src/features/auth/presentation/validateurs.dart';
import 'package:borrowbetter/src/features/lieux/presentation/selecteur_localisation.dart';
import 'package:borrowbetter/src/features/objets/domain/adresse_privee.dart';
import 'package:borrowbetter/src/features/objets/domain/objet.dart';
import 'package:borrowbetter/src/features/objets/domain/tarif.dart';
import 'package:borrowbetter/src/features/objets/domain/unite_tarif.dart';
import 'package:borrowbetter/src/features/objets/presentation/champ_tarif.dart';
import 'package:borrowbetter/src/features/objets/presentation/libelles_objet.dart';
import 'package:borrowbetter/src/features/objets/presentation/modification_objet.dart';
import 'package:borrowbetter/src/features/objets/presentation/objets_providers.dart';
import 'package:borrowbetter/src/features/objets/presentation/selecteur_photos.dart';
import 'package:borrowbetter/src/shared/l10n/app_localizations.dart';
import 'package:borrowbetter/src/shared/presentation/message_pour.dart';
import 'package:borrowbetter/src/shared/theme/dimensions.dart';
import 'package:borrowbetter/src/shared/widgets/bouton_principal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class EcranModifierObjet extends ConsumerWidget {
  const new({required this.id, super.key});

  final String id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textes = AppLocalizations.of(context);
    final utilisateur = ref.watch(etatAuthProvider);
    final objet = ref.watch(objetProvider(id));

    return objet.when(
      loading: () =>
          _page(textes, const Center(child: CircularProgressIndicator())),
      error: (erreur, _) =>
          _page(textes, Center(child: Text(messagePour(textes, erreur)))),
      data: (objet) {
        if (utilisateur.isLoading) {
          return _page(
            textes,
            const Center(child: CircularProgressIndicator()),
          );
        }
        if (utilisateur.value?.uid != objet.proprietaireId) {
          return _page(textes, Center(child: Text(textes.erreurNonAutorise)));
        }
        return _ChargementAdresse(objet: objet);
      },
    );
  }

  Widget _page(AppLocalizations textes, Widget corps) => Scaffold(
    appBar: AppBar(title: Text(textes.objetModifierTitre)),
    body: corps,
  );
}

class _ChargementAdresse extends ConsumerStatefulWidget {
  const new({required this.objet});

  final Objet objet;

  @override
  ConsumerState<_ChargementAdresse> createState() => _EtatChargementAdresse();
}

class _EtatChargementAdresse extends ConsumerState<_ChargementAdresse> {
  late final Future<AdressePrivee?> _adresse;

  @override
  void initState() {
    super.initState();
    _adresse = ref.read(depotObjetsProvider).lireAdresse(widget.objet.id);
  }

  @override
  Widget build(BuildContext context) {
    final textes = AppLocalizations.of(context);
    return FutureBuilder<AdressePrivee?>(
      future: _adresse,
      builder: (context, instantane) {
        if (instantane.connectionState != ConnectionState.done) {
          return Scaffold(
            appBar: AppBar(title: Text(textes.objetModifierTitre)),
            body: const Center(child: CircularProgressIndicator()),
          );
        }
        final erreur = instantane.error;
        if (erreur != null) {
          return Scaffold(
            appBar: AppBar(title: Text(textes.objetModifierTitre)),
            body: Center(child: Text(messagePour(textes, erreur))),
          );
        }
        return _FormulaireModificationObjet(
          objet: widget.objet,
          adresse: instantane.data,
        );
      },
    );
  }
}

class _FormulaireModificationObjet extends ConsumerStatefulWidget {
  const new({required this.objet, this.adresse});

  final Objet objet;
  final AdressePrivee? adresse;

  @override
  ConsumerState<_FormulaireModificationObjet> createState() =>
      _EtatFormulaireModificationObjet();
}

class _EtatFormulaireModificationObjet
    extends ConsumerState<_FormulaireModificationObjet> {
  final _formulaire = GlobalKey<FormState>();
  late final TextEditingController _titre;
  late final TextEditingController _description;
  late final TextEditingController _cite;
  late final TextEditingController _rue;
  late final TextEditingController _prix;
  late CategorieObjet _categorie;
  late EtatObjet _etat;
  late String? _gouvernorat;
  late String? _ville;
  late bool _gratuit;
  UniteTarif? _unite;
  var _nouvellesPhotos = <String>[];
  var _enChargement = false;
  String? _erreur;

  @override
  void initState() {
    super.initState();
    final objet = widget.objet;
    _titre = TextEditingController(text: objet.titre);
    _description = TextEditingController(text: objet.description);
    _cite = TextEditingController(text: widget.adresse?.cite ?? '');
    _rue = TextEditingController(text: widget.adresse?.rue ?? '');
    _prix = TextEditingController(text: objet.prix?.toString() ?? '');
    _categorie = objet.categorie;
    _etat = objet.etat;
    _gouvernorat = objet.gouvernoratId;
    _ville = objet.villeId;
    _gratuit = objet.prix == null;
    _unite = objet.unite;
  }

  @override
  void dispose() {
    _titre.dispose();
    _description.dispose();
    _cite.dispose();
    _rue.dispose();
    _prix.dispose();
    super.dispose();
  }

  Future<void> _enregistrer() async {
    if (!_formulaire.currentState!.validate()) return;
    final textes = AppLocalizations.of(context);
    setState(() {
      _enChargement = true;
      _erreur = null;
    });
    await ref
        .read(modificationObjetProvider.notifier)
        .enregistrer(
          widget.objet.id,
          BrouillonObjet(
            titre: _titre.text.trim(),
            description: _description.text.trim(),
            categorie: _categorie,
            etat: _etat,
            gouvernoratId: _gouvernorat!,
            villeId: _ville!,
            langueAnnonce: widget.objet.langueAnnonce,
            cite: _cite.text.trim(),
            rue: _rue.text.trim().isEmpty ? null : _rue.text.trim(),
            photos: widget.objet.photos,
            prix: _gratuit ? null : analyserPrix(_prix.text),
            unite: _gratuit ? null : _unite,
          ),
          photosExistantes: widget.objet.photos,
          nouvellesPhotos: _nouvellesPhotos,
        );
    if (!mounted) return;
    final resultat = ref.read(modificationObjetProvider);
    if (resultat.hasError) {
      setState(() {
        _erreur = messagePour(textes, resultat.error!);
        _enChargement = false;
      });
      return;
    }
    ref.invalidate(objetProvider(widget.objet.id));
    context.pop();
  }

  @override
  Widget build(BuildContext context) {
    final textes = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(title: Text(textes.objetModifierTitre)),
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
                    onChanged: (valeur) {
                      if (valeur != null) setState(() => _categorie = valeur);
                    },
                  ),
                  const SizedBox(height: Espacements.m),
                  DropdownButtonFormField<EtatObjet>(
                    initialValue: _etat,
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
                    onChanged: (valeur) {
                      if (valeur != null) setState(() => _etat = valeur);
                    },
                  ),
                  const SizedBox(height: Espacements.m),
                  ChampTarif(
                    gratuit: _gratuit,
                    onGratuitChange: (valeur) =>
                        setState(() => _gratuit = valeur),
                    prix: _prix,
                    unite: _unite,
                    onUniteChange: (valeur) => setState(() => _unite = valeur),
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
                    chemins: _nouvellesPhotos,
                    maximum: (3 - widget.objet.photos.length).clamp(0, 3),
                    onChanged: (chemins) =>
                        setState(() => _nouvellesPhotos = chemins),
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
            if (_erreur != null) ...[
              const SizedBox(height: Espacements.m),
              Text(
                _erreur!,
                style: TextStyle(color: Theme.of(context).colorScheme.error),
              ),
            ],
            const SizedBox(height: Espacements.l),
            BoutonPrincipal(
              libelle: textes.objetModifier,
              onPressed: _enChargement ? null : _enregistrer,
              enChargement: _enChargement,
            ),
          ],
        ),
      ),
    );
  }
}
