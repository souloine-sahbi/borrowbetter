import 'package:borrowbetter/src/features/auth/presentation/decoration_champ.dart';
import 'package:borrowbetter/src/features/objets/domain/tarif.dart';
import 'package:borrowbetter/src/features/objets/domain/unite_tarif.dart';
import 'package:borrowbetter/src/features/objets/presentation/libelle_tarif.dart';
import 'package:borrowbetter/src/shared/l10n/app_localizations.dart';
import 'package:borrowbetter/src/shared/theme/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// Interrupteur « Gratuit » (actif par défaut) ; quand il est coupé,
/// le prix et l'unité apparaissent. L'état appartient au formulaire parent.
class ChampTarif extends StatelessWidget {
  const new({
    required this.gratuit,
    required this.onGratuitChange,
    required this.prix,
    required this.unite,
    required this.onUniteChange,
    super.key,
  });

  final bool gratuit;
  final ValueChanged<bool> onGratuitChange;
  final TextEditingController prix;
  final UniteTarif? unite;
  final ValueChanged<UniteTarif?> onUniteChange;

  String? _messagePrix(AppLocalizations textes, String? valeur) =>
      switch (validerPrix(valeur)) {
        ErreurTarif.prixInvalide => textes.tarifPrixInvalide,
        ErreurTarif.prixTropEleve => textes.tarifPrixTropEleve,
        _ => null,
      };

  @override
  Widget build(BuildContext context) {
    final textes = AppLocalizations.of(context);
    return Column(
      children: [
        SwitchListTile(
          contentPadding: EdgeInsets.zero,
          title: Text(textes.tarifGratuit),
          value: gratuit,
          onChanged: onGratuitChange,
        ),
        AnimatedSize(
          duration: const Duration(milliseconds: 200),
          alignment: Alignment.topCenter,
          child: gratuit
              ? const SizedBox(width: double.infinity)
              : Column(
                  children: [
                    TextFormField(
                      controller: prix,
                      keyboardType: const TextInputType.numberWithOptions(
                        decimal: true,
                      ),
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp('[0-9.,]')),
                      ],
                      decoration: decorationChamp(
                        libelle: textes.tarifPrix,
                        icone: Icons.sell_outlined,
                      ),
                      validator: (valeur) => _messagePrix(textes, valeur),
                    ),
                    const SizedBox(height: Espacements.m),
                    DropdownButtonFormField<UniteTarif>(
                      initialValue: unite,
                      decoration: decorationChamp(
                        libelle: textes.tarifUnite,
                        icone: Icons.schedule,
                      ),
                      items: [
                        for (final u in UniteTarif.values)
                          DropdownMenuItem(
                            value: u,
                            child: Text(libelleUnite(textes, u)),
                          ),
                      ],
                      onChanged: onUniteChange,
                      validator: (valeur) => validerUnite(valeur) == null
                          ? null
                          : textes.tarifUniteManquante,
                    ),
                  ],
                ),
        ),
      ],
    );
  }
}
