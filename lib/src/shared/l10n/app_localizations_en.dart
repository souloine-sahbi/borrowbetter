// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitre => 'BorrowBetter';

  @override
  String get actionReessayer => 'Retry';

  @override
  String get erreurChargement => 'Unable to load the data.';

  @override
  String get aucunResultat => 'No results';

  @override
  String get statutEnAttente => 'Pending';

  @override
  String get statutAcceptee => 'Accepted';

  @override
  String get statutRefusee => 'Declined';

  @override
  String get statutAnnulee => 'Cancelled';

  @override
  String get statutEnCours => 'In progress';

  @override
  String get statutRendue => 'Returned';
}
