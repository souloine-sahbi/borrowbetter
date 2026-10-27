import 'package:borrowbetter/src/shared/theme/dimensions.dart';
import 'package:flutter/material.dart';

/// Statuts affichables par [BadgeStatut].
///
/// Enum d'affichage uniquement : la machine d'états des demandes reste dans
/// `features/demandes` (étape 2.1) et sera convertie vers cet enum.
enum StatutBadge { enAttente, acceptee, refusee, annulee, enCours, rendue }

/// Pastille colorée qui affiche le statut d'une demande ou d'un prêt.
///
/// Chaque statut a une icône en plus de sa couleur, pour rester lisible sans
/// distinguer les couleurs.
class BadgeStatut extends StatelessWidget {
  const BadgeStatut({required this.statut, required this.libelle, super.key});

  final StatutBadge statut;
  final String libelle;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;
    final (fond, texte, icone) = switch (statut) {
      StatutBadge.enAttente => (
        scheme.secondaryContainer,
        scheme.onSecondaryContainer,
        Icons.schedule,
      ),
      StatutBadge.acceptee => (
        scheme.primary,
        scheme.onPrimary,
        Icons.check_circle_outline,
      ),
      StatutBadge.refusee => (
        scheme.errorContainer,
        scheme.onErrorContainer,
        Icons.cancel_outlined,
      ),
      StatutBadge.annulee => (
        scheme.surfaceContainerHighest,
        scheme.onSurfaceVariant,
        Icons.block,
      ),
      StatutBadge.enCours => (
        scheme.tertiaryContainer,
        scheme.onTertiaryContainer,
        Icons.autorenew,
      ),
      StatutBadge.rendue => (
        scheme.surface,
        scheme.onSurface,
        Icons.inventory_2_outlined,
      ),
    };
    return DecoratedBox(
      decoration: ShapeDecoration(
        color: fond,
        shape: StadiumBorder(side: BorderSide(color: scheme.outlineVariant)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: Espacements.m,
          vertical: Espacements.s / 2,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icone, size: 14, color: texte),
            const SizedBox(width: Espacements.s / 2),
            Text(
              libelle,
              style: theme.textTheme.labelMedium?.copyWith(color: texte),
            ),
          ],
        ),
      ),
    );
  }
}
