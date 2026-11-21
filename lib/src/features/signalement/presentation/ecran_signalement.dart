import 'package:borrowbetter/src/features/auth/presentation/decoration_champ.dart';
import 'package:borrowbetter/src/features/signalement/domain/signalement.dart';
import 'package:borrowbetter/src/features/signalement/domain/validation_signalement.dart';
import 'package:borrowbetter/src/features/signalement/presentation/signalement_providers.dart';
import 'package:borrowbetter/src/shared/l10n/app_localizations.dart';
import 'package:borrowbetter/src/shared/theme/dimensions.dart';
import 'package:borrowbetter/src/shared/widgets/bouton_principal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EcranSignalement extends ConsumerStatefulWidget {
  const new({required this.cible, required this.cibleId, super.key});

  final CibleSignalement cible;
  final String cibleId;

  @override
  ConsumerState<EcranSignalement> createState() => _EtatEcranSignalement();
}

class _EtatEcranSignalement extends ConsumerState<EcranSignalement> {
  final _formulaire = GlobalKey<FormState>();
  final _description = TextEditingController();
  MotifSignalement? _motif;

  @override
  void dispose() {
    _description.dispose();
    super.dispose();
  }

  String _libelleMotif(AppLocalizations textes, MotifSignalement motif) =>
      switch (motif) {
        MotifSignalement.contenuInapproprie => textes.motifContenu,
        MotifSignalement.arnaque => textes.motifArnaque,
        MotifSignalement.inexistant => textes.motifInexistant,
        MotifSignalement.comportement => textes.motifComportement,
        MotifSignalement.autre => textes.motifAutre,
      };

  Future<void> _envoyer() async {
    if (!_formulaire.currentState!.validate()) return;
    final motif = _motif;
    if (motif == null) return;
    final textes = AppLocalizations.of(context);
    final messager = ScaffoldMessenger.of(context);
    final navigateur = Navigator.of(context);
    FocusScope.of(context).unfocus();
    await ref
        .read(envoiSignalementProvider.notifier)
        .envoyer(
          BrouillonSignalement(
            cible: widget.cible,
            cibleId: widget.cibleId,
            motif: motif,
            description: _description.text,
          ),
        );
    if (!mounted) return;
    if (ref.read(envoiSignalementProvider).hasError) {
      messager.showSnackBar(SnackBar(content: Text(textes.signalementEchec)));
      return;
    }
    navigateur.pop();
    messager.showSnackBar(SnackBar(content: Text(textes.signalementMerci)));
  }

  @override
  Widget build(BuildContext context) {
    final textes = AppLocalizations.of(context);
    final etat = ref.watch(envoiSignalementProvider);

    return Scaffold(
      appBar: AppBar(title: Text(textes.signalementTitre)),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(Espacements.l),
          child: Form(
            key: _formulaire,
            child: Column(
              children: [
                DropdownButtonFormField<MotifSignalement>(
                  initialValue: _motif,
                  decoration: decorationChamp(
                    libelle: textes.signalementMotif,
                    icone: Icons.flag_outlined,
                  ),
                  items: [
                    for (final motif in MotifSignalement.values)
                      DropdownMenuItem(
                        value: motif,
                        child: Text(_libelleMotif(textes, motif)),
                      ),
                  ],
                  onChanged: (valeur) => setState(() => _motif = valeur),
                  validator: (valeur) => valeur == null
                      ? textes.signalementMotifObligatoire
                      : null,
                ),
                const SizedBox(height: Espacements.m),
                TextFormField(
                  controller: _description,
                  maxLines: 5,
                  maxLength: descriptionMax,
                  textInputAction: TextInputAction.newline,
                  decoration: decorationChamp(
                    libelle: textes.signalementDescription,
                    icone: Icons.notes,
                  ),
                  validator: (valeur) => switch (validerDescriptionSignalement(
                    valeur,
                    obligatoire: false,
                  )) {
                    ErreurSignalement.descriptionCourte =>
                      textes.signalementDescriptionCourte,
                    ErreurSignalement.descriptionLongue =>
                      textes.signalementDescriptionLongue,
                    null => null,
                  },
                ),
                const SizedBox(height: Espacements.l),
                BoutonPrincipal(
                  libelle: textes.signalementEnvoyer,
                  onPressed: etat.isLoading ? null : _envoyer,
                  enChargement: etat.isLoading,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
