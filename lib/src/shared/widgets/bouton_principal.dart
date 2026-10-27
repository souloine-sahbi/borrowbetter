import 'package:flutter/material.dart';

/// Bouton principal de l'application, avec état de chargement.
///
/// Pendant le chargement, le bouton reste visible mais ignore les appuis :
/// cela empêche le double envoi d'un formulaire.
class BoutonPrincipal extends StatelessWidget {
  const new({
    required this.libelle,
    required this.onPressed,
    this.enChargement = false,
    this.icone,
    super.key,
  });

  final String libelle;
  final VoidCallback? onPressed;
  final bool enChargement;
  final IconData? icone;

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: enChargement ? () {} : onPressed,
      child: enChargement
          ? const _IndicateurBouton()
          : Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (icone != null) ...[Icon(icone), const SizedBox(width: 8)],
                Flexible(child: Text(libelle)),
              ],
            ),
    );
  }
}

class _IndicateurBouton extends StatelessWidget {
  const new();

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: 20,
      child: CircularProgressIndicator(
        strokeWidth: 2,
        color: DefaultTextStyle.of(context).style.color,
      ),
    );
  }
}
