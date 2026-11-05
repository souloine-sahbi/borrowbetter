import 'package:borrowbetter/src/features/auth/domain/force_mot_de_passe.dart';
import 'package:borrowbetter/src/shared/l10n/app_localizations.dart';
import 'package:borrowbetter/src/shared/theme/dimensions.dart';
import 'package:flutter/material.dart';

class IndicateurForceMotDePasse extends StatelessWidget {
  const new({required this.force, super.key});

  final ForceMotDePasse force;

  @override
  Widget build(BuildContext context) {
    final textes = AppLocalizations.of(context);
    final schema = Theme.of(context).colorScheme;

    final niveau = switch (force) {
      ForceMotDePasse.aucune => 0,
      ForceMotDePasse.faible => 1,
      ForceMotDePasse.moyenne => 2,
      ForceMotDePasse.bonne => 3,
      ForceMotDePasse.forte => 4,
    };
    final couleur = switch (force) {
      ForceMotDePasse.aucune => schema.outlineVariant,
      ForceMotDePasse.faible => schema.error,
      ForceMotDePasse.moyenne => Colors.orange.shade700,
      ForceMotDePasse.bonne => Colors.lightGreen.shade600,
      ForceMotDePasse.forte => Colors.green.shade600,
    };
    final libelle = switch (force) {
      ForceMotDePasse.aucune => '',
      ForceMotDePasse.faible => textes.forceFaible,
      ForceMotDePasse.moyenne => textes.forceMoyenne,
      ForceMotDePasse.bonne => textes.forceBonne,
      ForceMotDePasse.forte => textes.forceForte,
    };
    final afficherConseil =
        force == ForceMotDePasse.faible || force == ForceMotDePasse.moyenne;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            for (var i = 0; i < 4; i++) ...[
              if (i > 0) const SizedBox(width: Espacements.xs),
              Expanded(
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  height: 6,
                  decoration: BoxDecoration(
                    color: i < niveau ? couleur : schema.outlineVariant,
                    borderRadius: BorderRadius.circular(3),
                  ),
                ),
              ),
            ],
          ],
        ),
        const SizedBox(height: Espacements.xs),
        Text(
          libelle,
          style: Theme.of(context).textTheme.bodySmall
              ?.copyWith(color: couleur, fontWeight: FontWeight.w600),
        ),
        if (afficherConseil)
          Text(
            textes.forceConseil,
            style: Theme.of(context).textTheme.bodySmall
                ?.copyWith(color: schema.onSurfaceVariant),
          ),
      ],
    );
  }
}
