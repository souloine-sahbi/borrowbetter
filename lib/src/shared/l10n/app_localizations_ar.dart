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

  @override
  String get authConnexion => 'تسجيل الدخول';

  @override
  String get authInscription => 'إنشاء حساب';

  @override
  String get authEmail => 'البريد الإلكتروني';

  @override
  String get authMotDePasse => 'كلمة المرور';

  @override
  String get authNom => 'الاسم الكامل';

  @override
  String get authPasDeCompte => 'ليس لديك حساب؟ سجّل الآن';

  @override
  String get authDejaCompte => 'لديك حساب؟ سجّل الدخول';

  @override
  String get authDeconnexion => 'تسجيل الخروج';

  @override
  String get validationObligatoire => 'هذا الحقل مطلوب';

  @override
  String get validationEmail => 'بريد إلكتروني غير صالح';

  @override
  String get validationMotDePasse => '6 أحرف على الأقل';

  @override
  String get erreurIdentifiants => 'البريد الإلكتروني أو كلمة المرور غير صحيحة';

  @override
  String get erreurEmailUtilise => 'هذا البريد الإلكتروني مستعمل بالفعل';

  @override
  String get erreurMotDePasseFaible => 'كلمة المرور ضعيفة جدًا';

  @override
  String get erreurReseau => 'مشكلة في الاتصال بالشبكة';

  @override
  String get erreurInconnue => 'حدث خطأ، حاول مرة أخرى';

  @override
  String get forceFaible => 'ضعيفة';

  @override
  String get forceMoyenne => 'متوسطة';

  @override
  String get forceBonne => 'جيدة';

  @override
  String get forceForte => 'قوية';

  @override
  String get forceConseil => 'استخدم 8 أحرف أو أكثر مع أرقام ورموز وأحرف كبيرة';
}
