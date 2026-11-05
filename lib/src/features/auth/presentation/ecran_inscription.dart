import 'package:borrowbetter/src/features/auth/data/depot_auth.dart';
import 'package:borrowbetter/src/features/auth/domain/force_mot_de_passe.dart';
import 'package:borrowbetter/src/features/auth/presentation/bouton_google.dart';
import 'package:borrowbetter/src/features/auth/presentation/champ_mot_de_passe.dart';
import 'package:borrowbetter/src/features/auth/presentation/decoration_champ.dart';
import 'package:borrowbetter/src/features/auth/presentation/indicateur_force_mot_de_passe.dart';
import 'package:borrowbetter/src/features/auth/presentation/message_erreur_auth.dart';
import 'package:borrowbetter/src/features/auth/presentation/validateurs.dart';
import 'package:borrowbetter/src/routing/chemins.dart';
import 'package:borrowbetter/src/shared/l10n/app_localizations.dart';
import 'package:borrowbetter/src/shared/theme/dimensions.dart';
import 'package:borrowbetter/src/shared/widgets/bouton_principal.dart';
import 'package:borrowbetter/src/shared/widgets/logo_marque.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class EcranInscription extends ConsumerStatefulWidget {
  const new({super.key});

  @override
  ConsumerState<EcranInscription> createState() => _EtatEcranInscription();
}

class _EtatEcranInscription extends ConsumerState<EcranInscription> {
  final _formulaire = GlobalKey<FormState>();
  final _nom = TextEditingController();
  final _email = TextEditingController();
  final _motDePasse = TextEditingController();
  var _enChargement = false;
  String? _erreur;

  @override
  void dispose() {
    _nom.dispose();
    _email.dispose();
    _motDePasse.dispose();
    super.dispose();
  }

  Future<void> _envoyer() async {
    if (!_formulaire.currentState!.validate()) return;
    final textes = AppLocalizations.of(context);
    setState(() {
      _enChargement = true;
      _erreur = null;
    });
    try {
      await ref
          .read(depotAuthProvider)
          .inscription(
            nom: _nom.text.trim(),
            email: _email.text.trim(),
            motDePasse: _motDePasse.text,
          );
    } on FirebaseAuthException catch (e) {
      if (!mounted) return;
      setState(() => _erreur = messageErreurAuth(textes, e));
    } finally {
      if (mounted) setState(() => _enChargement = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final textes = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final erreur = _erreur;
    final force = evaluerForce(_motDePasse.text);
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(Espacements.l),
          children: [
            const LogoMarque(),
            const SizedBox(height: Espacements.xl),
            Text(
              textes.authCreerTitre,
              style: theme.textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: Espacements.xs),
            Text(
              textes.authCreerSousTitre,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: Espacements.xl),
            Form(
              key: _formulaire,
              child: Column(
                children: [
                  TextFormField(
                    controller: _nom,
                    decoration: decorationChamp(
                      libelle: textes.authNom,
                      icone: Icons.person_outline,
                    ),
                    validator: (valeur) => validerObligatoire(textes, valeur),
                  ),
                  const SizedBox(height: Espacements.m),
                  TextFormField(
                    controller: _email,
                    keyboardType: TextInputType.emailAddress,
                    decoration: decorationChamp(
                      libelle: textes.authEmail,
                      icone: Icons.mail_outline,
                    ),
                    validator: (valeur) => validerEmail(textes, valeur),
                  ),
                  const SizedBox(height: Espacements.m),
                  ChampMotDePasse(
                    controleur: _motDePasse,
                    libelle: textes.authMotDePasse,
                    onChanged: (_) => setState(() {}),
                    validateur: (valeur) => validerMotDePasse(textes, valeur),
                  ),
                  if (force != ForceMotDePasse.aucune) ...[
                    const SizedBox(height: Espacements.s),
                    IndicateurForceMotDePasse(force: force),
                  ],
                ],
              ),
            ),
            if (erreur != null) ...[
              const SizedBox(height: Espacements.m),
              Text(erreur, style: TextStyle(color: theme.colorScheme.error)),
            ],
            const SizedBox(height: Espacements.l),
            BoutonPrincipal(
              libelle: textes.authInscription,
              onPressed: _enChargement ? null : _envoyer,
              enChargement: _enChargement,
            ),
            const SizedBox(height: Espacements.m),
            const BoutonGoogle(),
            const SizedBox(height: Espacements.l),
            Wrap(
              alignment: WrapAlignment.center,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                Text(textes.authDejaCompteQuestion),
                TextButton(
                  onPressed: () => context.go(Chemins.connexion),
                  child: Text(textes.authSeConnecter),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
