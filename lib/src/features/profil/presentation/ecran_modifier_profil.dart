import 'dart:io';

import 'package:borrowbetter/src/features/auth/presentation/decoration_champ.dart';
import 'package:borrowbetter/src/features/auth/presentation/validateurs.dart';
import 'package:borrowbetter/src/features/lieux/presentation/selecteur_localisation.dart';
import 'package:borrowbetter/src/features/profil/presentation/avatar_utilisateur.dart';
import 'package:borrowbetter/src/features/profil/presentation/providers/modification_profil.dart';
import 'package:borrowbetter/src/features/profil/presentation/providers/utilisateur_providers.dart';
import 'package:borrowbetter/src/shared/l10n/app_localizations.dart';
import 'package:borrowbetter/src/shared/theme/dimensions.dart';
import 'package:borrowbetter/src/shared/widgets/bouton_principal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

class EcranModifierProfil extends ConsumerStatefulWidget {
  const new({super.key});

  @override
  ConsumerState<EcranModifierProfil> createState() =>
      _EtatEcranModifierProfil();
}

class _EtatEcranModifierProfil extends ConsumerState<EcranModifierProfil> {
  final _formulaire = GlobalKey<FormState>();
  late final TextEditingController _nom;
  String? _gouvernorat;
  String? _ville;
  String? _cheminPhoto;

  @override
  void initState() {
    super.initState();
    final utilisateur = ref.read(utilisateurCourantProvider).value;
    _nom = TextEditingController(text: utilisateur?.nom ?? '');
    _gouvernorat = utilisateur?.gouvernorat;
    _ville = utilisateur?.ville;
  }

  @override
  void dispose() {
    _nom.dispose();
    super.dispose();
  }

  Future<void> _choisirPhoto() async {
    final fichier = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      maxWidth: 1024,
      imageQuality: 80,
    );
    if (fichier == null || !mounted) return;
    setState(() => _cheminPhoto = fichier.path);
  }

  Future<void> _enregistrer() async {
    if (!_formulaire.currentState!.validate()) return;
    final actuel = ref.read(utilisateurCourantProvider).value;
    if (actuel == null) return;
    FocusScope.of(context).unfocus();
    await ref
        .read(modificationProfilProvider.notifier)
        .enregistrer(
          actuel: actuel,
          nom: _nom.text.trim(),
          gouvernorat: _gouvernorat,
          ville: _ville,
          cheminPhoto: _cheminPhoto,
        );
  }

  @override
  Widget build(BuildContext context) {
    final textes = AppLocalizations.of(context);
    final actuel = ref.watch(utilisateurCourantProvider).value;
    final etat = ref.watch(modificationProfilProvider);

    ref.listen(modificationProfilProvider, (avant, apres) {
      if (apres is AsyncError) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(textes.profilEchec)));
      } else if (avant?.isLoading ?? false) {
        if (apres is AsyncData) context.pop();
      }
    });

    final chemin = _cheminPhoto;
    return Scaffold(
      appBar: AppBar(title: Text(textes.profilModifier)),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(Espacements.l),
          children: [
            Center(
              child: AvatarUtilisateur(
                nom: _nom.text,
                photoUrl: actuel?.photoUrl,
                imageLocale: chemin == null ? null : FileImage(File(chemin)),
                rayon: 52,
              ),
            ),
            const SizedBox(height: Espacements.s),
            Center(
              child: TextButton.icon(
                onPressed: etat.isLoading ? null : _choisirPhoto,
                icon: const Icon(Icons.photo_camera_outlined),
                label: Text(textes.profilChangerPhoto),
              ),
            ),
            const SizedBox(height: Espacements.l),
            Form(
              key: _formulaire,
              child: TextFormField(
                controller: _nom,
                textInputAction: TextInputAction.done,
                decoration: decorationChamp(
                  libelle: textes.authNom,
                  icone: Icons.person_outline,
                ),
                validator: (valeur) => validerObligatoire(textes, valeur),
                onFieldSubmitted: (_) => _enregistrer(),
              ),
            ),
            const SizedBox(height: Espacements.l),
            SelecteurLocalisation(
              obligatoire: false,
              gouvernoratId: _gouvernorat,
              villeId: _ville,
              onChanged: (gouvernorat, ville) => setState(() {
                _gouvernorat = gouvernorat;
                _ville = ville;
              }),
            ),
            const SizedBox(height: Espacements.xl),
            BoutonPrincipal(
              libelle: textes.profilEnregistrer,
              onPressed: etat.isLoading ? null : _enregistrer,
              enChargement: etat.isLoading,
            ),
          ],
        ),
      ),
    );
  }
}
