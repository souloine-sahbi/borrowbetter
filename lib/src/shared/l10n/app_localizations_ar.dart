// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get appTitre => 'BorrowBetter';

  @override
  String get actionReessayer => 'إعادة المحاولة';

  @override
  String get erreurChargement => 'تعذّر تحميل البيانات.';

  @override
  String get aucunResultat => 'لا توجد نتائج';

  @override
  String get statutEnAttente => 'قيد الانتظار';

  @override
  String get statutAcceptee => 'مقبولة';

  @override
  String get statutRefusee => 'مرفوضة';

  @override
  String get statutAnnulee => 'ملغاة';

  @override
  String get statutEnCours => 'جارية';

  @override
  String get statutRendue => 'تمت الإعادة';

  @override
  String get navAccueil => 'الرئيسية';

  @override
  String get navRecherche => 'البحث';

  @override
  String get navParametres => 'الإعدادات';

  @override
  String get parametresLangue => 'اللغة';

  @override
  String get parametresTheme => 'المظهر';
}
