import 'package:borrowbetter/src/features/objets/domain/unite_tarif.dart';
import 'package:borrowbetter/src/shared/l10n/app_localizations.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

String libelleUnite(AppLocalizations textes, UniteTarif unite) =>
    switch (unite) {
      UniteTarif.heure => textes.uniteHeure,
      UniteTarif.jour => textes.uniteJour,
      UniteTarif.semaine => textes.uniteSemaine,
      UniteTarif.mois => textes.uniteMois,
    };

/// « Gratuit » ou « 5 DT / jour », selon la langue de l'application.
String libelleTarif(
  BuildContext context, {
  required double? prix,
  required UniteTarif? unite,
}) {
  final textes = AppLocalizations.of(context);
  if (prix == null || unite == null) return textes.tarifGratuit;
  final nombre = NumberFormat.decimalPattern(
    Localizations.localeOf(context).toString(),
  ).format(prix);
  return textes.tarifPrixUnite(nombre, libelleUnite(textes, unite));
}
