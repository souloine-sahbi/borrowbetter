import 'package:borrowbetter/src/features/auth/presentation/decoration_champ.dart';
import 'package:borrowbetter/src/features/signalement/domain/signalement.dart';
import 'package:borrowbetter/src/features/signalement/domain/validation_signalement.dart';
import 'package:borrowbetter/src/features/signalement/presentation/signalement_providers.dart';
import 'package:borrowbetter/src/shared/l10n/app_localizations.dart';
import 'package:borrowbetter/src/shared/theme/dimensions.dart';
import 'package:borrowbetter/src/shared/widgets/bouton_principal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Ouvre la feuille de signalement d'un objet ou d'un utilisateur.
Future<void> afficherSignalement(
  BuildContext context, {
  required CibleSignalement cible,
  required String cibleId,
}) => showModalBottomSheet<void>(
  context: context,
  isScrollControlled: true,
  showDragHandle: true,
  builder: (_) => FeuilleSignalement(cible: cible, cibleId: cibleId),
);

class FeuilleSignalement extends ConsumerStatefulWidget {
  const new({required this.cible, required this.cibleId, super.key});

  final CibleSignalement cible;
  final String cibleId;

  @override
  ConsumerState<FeuilleSignalement> createState() => _EtatFeuilleSignalement();
}

class _EtatFeuilleSignalement extends ConsumerState<FeuilleSignalement> {
  final _formulaire = GlobalKey<FormState>();
  final _details = TextEditingController();
  MotifSignalement? _motif;
  var _motifManquant = false;

  @override
  void dispose() {
    _details.dispose();
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
    final motif = _motif;
    if (motif == null) {
      setState(() => _motifManquant = true);
      return;
    }
    if (!_formulaire.currentState!.validate()) return;
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
            description: _details.text,
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
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;
    final etat = ref.watch(envoiSignalementProvider);
    final autre = _motif == MotifSignalement.autre;

    return Padding(
      // Remonte la feuille au-dessus du clavier.
      padding: EdgeInsets.only(bottom: MediaQuery.viewInsetsOf(context).bottom),
      child: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(
            Espacements.l,
            0,
            Espacements.l,
            Espacements.l,
          ),
          child: Form(
            key: _formulaire,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  textes.signalementQuestion,
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: Espacements.s),
                for (final motif in MotifSignalement.values)
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    selected: _motif == motif,
                    selectedColor: scheme.primary,
                    title: Text(_libelleMotif(textes, motif)),
                    trailing: Icon(
                      _motif == motif
                          ? Icons.radio_button_checked
                          : Icons.radio_button_unchecked,
                    ),
                    onTap: etat.isLoading
                        ? null
                        : () => setState(() {
                            _motif = motif;
                            _motifManquant = false;
                          }),
                  ),
                if (_motifManquant)
                  Padding(
                    padding: const EdgeInsets.only(bottom: Espacements.s),
                    child: Text(
                      textes.signalementMotifObligatoire,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: scheme.error,
                      ),
                    ),
                  ),
                const SizedBox(height: Espacements.s),
                TextFormField(
                  controller: _details,
                  maxLines: 4,
                  maxLength: descriptionMax,
                  decoration: decorationChamp(
                    libelle: autre
                        ? textes.signalementDetailsAutre
                        : textes.signalementDetails,
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
                const SizedBox(height: Espacements.m),
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
