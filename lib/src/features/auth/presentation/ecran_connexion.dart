import 'package:borrowbetter/src/features/auth/data/depot_auth.dart';
import 'package:borrowbetter/src/features/auth/presentation/bouton_google.dart';
import 'package:borrowbetter/src/features/auth/presentation/champ_mot_de_passe.dart';
import 'package:borrowbetter/src/features/auth/presentation/decoration_champ.dart';
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

class EcranConnexion extends ConsumerStatefulWidget {
  const new({super.key});

  @override
  ConsumerState<EcranConnexion> createState() => _EtatEcranConnexion();
}

class _EtatEcranConnexion extends ConsumerState<EcranConnexion> {
  final _formulaire = GlobalKey<FormState>();
  final _email = TextEditingController();
  final _motDePasse = TextEditingController();
  var _enChargement = false;
  String? _erreur;

  @override
  void dispose() {
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
          .connexion(email: _email.text.trim(), motDePasse: _motDePasse.text);
    } on FirebaseAuthException catch (e) {
      if (!mounted) return;
      setState(() => _erreur = messageErreurAuth(textes, e));
    } finally {
      if (mounted) setState(() => _enChargement = false);
    }
  }

  Future<void> _reinitialiser() async {
    final textes = AppLocalizations.of(context);
    final messager = ScaffoldMessenger.of(context);
    final probleme = validerEmail(textes, _email.text);
    if (probleme != null) {
      setState(() => _erreur = probleme);
      return;
    }
    setState(() => _erreur = null);
    try {
      await ref
          .read(depotAuthProvider)
          .reinitialiserMotDePasse(_email.text.trim());
      messager.showSnackBar(SnackBar(content: Text(textes.authReinitEnvoyee)));
    } on FirebaseAuthException catch (e) {
      if (!mounted) return;
      setState(() => _erreur = messageErreurAuth(textes, e));
    }
  }

  @override
  Widget build(BuildContext context) {
    final textes = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final erreur = _erreur;
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(Espacements.l),
          children: [
            const LogoMarque(),
            const SizedBox(height: Espacements.xl),
            Text(
              textes.authBienvenue,
              style: theme.textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: Espacements.xs),
            Text(
              textes.authSousTitreConnexion,
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
                    validateur: (valeur) => validerMotDePasse(textes, valeur),
                  ),
                ],
              ),
            ),
            Align(
              alignment: AlignmentDirectional.centerEnd,
              child: TextButton(
                onPressed: _enChargement ? null : _reinitialiser,
                child: Text(textes.authMotDePasseOublie),
              ),
            ),
            if (erreur != null) ...[
              Text(erreur, style: TextStyle(color: theme.colorScheme.error)),
              const SizedBox(height: Espacements.m),
            ],
            BoutonPrincipal(
              libelle: textes.authConnexion,
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
                Text(textes.authPasDeCompteQuestion),
                TextButton(
                  onPressed: () => context.go(Chemins.inscription),
                  child: Text(textes.authSInscrire),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
