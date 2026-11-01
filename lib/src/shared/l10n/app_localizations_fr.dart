// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get appTitre => 'BorrowBetter';

  @override
  String get actionReessayer => 'Réessayer';

  @override
  String get erreurChargement => 'Impossible de charger les données.';

  @override
  String get aucunResultat => 'Aucun résultat';

  @override
  String get statutEnAttente => 'En attente';

  @override
  String get statutAcceptee => 'Acceptée';

  @override
  String get statutRefusee => 'Refusée';

  @override
  String get statutAnnulee => 'Annulée';

  @override
  String get statutEnCours => 'En cours';

  @override
  String get statutRendue => 'Rendue';
}
