import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';
import 'app_localizations_fr.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en'),
    Locale('fr'),
  ];

  /// No description provided for @appTitre.
  ///
  /// In fr, this message translates to:
  /// **'BorrowBetter'**
  String get appTitre;

  /// No description provided for @actionReessayer.
  ///
  /// In fr, this message translates to:
  /// **'Réessayer'**
  String get actionReessayer;

  /// No description provided for @erreurChargement.
  ///
  /// In fr, this message translates to:
  /// **'Impossible de charger les données.'**
  String get erreurChargement;

  /// No description provided for @aucunResultat.
  ///
  /// In fr, this message translates to:
  /// **'Aucun résultat'**
  String get aucunResultat;

  /// No description provided for @statutEnAttente.
  ///
  /// In fr, this message translates to:
  /// **'En attente'**
  String get statutEnAttente;

  /// No description provided for @statutAcceptee.
  ///
  /// In fr, this message translates to:
  /// **'Acceptée'**
  String get statutAcceptee;

  /// No description provided for @statutRefusee.
  ///
  /// In fr, this message translates to:
  /// **'Refusée'**
  String get statutRefusee;

  /// No description provided for @statutAnnulee.
  ///
  /// In fr, this message translates to:
  /// **'Annulée'**
  String get statutAnnulee;

  /// No description provided for @statutEnCours.
  ///
  /// In fr, this message translates to:
  /// **'En cours'**
  String get statutEnCours;

  /// No description provided for @statutRendue.
  ///
  /// In fr, this message translates to:
  /// **'Rendue'**
  String get statutRendue;

  /// No description provided for @navAccueil.
  ///
  /// In fr, this message translates to:
  /// **'Accueil'**
  String get navAccueil;

  /// No description provided for @navRecherche.
  ///
  /// In fr, this message translates to:
  /// **'Recherche'**
  String get navRecherche;

  /// No description provided for @navParametres.
  ///
  /// In fr, this message translates to:
  /// **'Paramètres'**
  String get navParametres;

  /// No description provided for @parametresLangue.
  ///
  /// In fr, this message translates to:
  /// **'Langue'**
  String get parametresLangue;

  /// No description provided for @parametresTheme.
  ///
  /// In fr, this message translates to:
  /// **'Thème'**
  String get parametresTheme;

  /// No description provided for @authConnexion.
  ///
  /// In fr, this message translates to:
  /// **'Connexion'**
  String get authConnexion;

  /// No description provided for @authInscription.
  ///
  /// In fr, this message translates to:
  /// **'Inscription'**
  String get authInscription;

  /// No description provided for @authEmail.
  ///
  /// In fr, this message translates to:
  /// **'Adresse e-mail'**
  String get authEmail;

  /// No description provided for @authMotDePasse.
  ///
  /// In fr, this message translates to:
  /// **'Mot de passe'**
  String get authMotDePasse;

  /// No description provided for @authNom.
  ///
  /// In fr, this message translates to:
  /// **'Nom complet'**
  String get authNom;

  /// No description provided for @authPasDeCompte.
  ///
  /// In fr, this message translates to:
  /// **'Pas encore de compte ? S’inscrire'**
  String get authPasDeCompte;

  /// No description provided for @authDejaCompte.
  ///
  /// In fr, this message translates to:
  /// **'Déjà un compte ? Se connecter'**
  String get authDejaCompte;

  /// No description provided for @authDeconnexion.
  ///
  /// In fr, this message translates to:
  /// **'Se déconnecter'**
  String get authDeconnexion;

  /// No description provided for @validationObligatoire.
  ///
  /// In fr, this message translates to:
  /// **'Ce champ est obligatoire'**
  String get validationObligatoire;

  /// No description provided for @validationEmail.
  ///
  /// In fr, this message translates to:
  /// **'Adresse e-mail invalide'**
  String get validationEmail;

  /// No description provided for @validationMotDePasse.
  ///
  /// In fr, this message translates to:
  /// **'6 caractères minimum'**
  String get validationMotDePasse;

  /// No description provided for @erreurIdentifiants.
  ///
  /// In fr, this message translates to:
  /// **'E-mail ou mot de passe incorrect'**
  String get erreurIdentifiants;

  /// No description provided for @erreurEmailUtilise.
  ///
  /// In fr, this message translates to:
  /// **'Cette adresse e-mail est déjà utilisée'**
  String get erreurEmailUtilise;

  /// No description provided for @erreurMotDePasseFaible.
  ///
  /// In fr, this message translates to:
  /// **'Mot de passe trop faible'**
  String get erreurMotDePasseFaible;

  /// No description provided for @erreurReseau.
  ///
  /// In fr, this message translates to:
  /// **'Problème de connexion réseau'**
  String get erreurReseau;

  /// No description provided for @erreurInconnue.
  ///
  /// In fr, this message translates to:
  /// **'Une erreur est survenue, réessayez'**
  String get erreurInconnue;

  /// No description provided for @forceFaible.
  ///
  /// In fr, this message translates to:
  /// **'Faible'**
  String get forceFaible;

  /// No description provided for @forceMoyenne.
  ///
  /// In fr, this message translates to:
  /// **'Moyen'**
  String get forceMoyenne;

  /// No description provided for @forceBonne.
  ///
  /// In fr, this message translates to:
  /// **'Bon'**
  String get forceBonne;

  /// No description provided for @forceForte.
  ///
  /// In fr, this message translates to:
  /// **'Fort'**
  String get forceForte;

  /// No description provided for @forceConseil.
  ///
  /// In fr, this message translates to:
  /// **'Utilisez 8 caractères ou plus, avec majuscules, chiffres et symboles'**
  String get forceConseil;

  /// No description provided for @authBienvenue.
  ///
  /// In fr, this message translates to:
  /// **'Bon retour !'**
  String get authBienvenue;

  /// No description provided for @authSousTitreConnexion.
  ///
  /// In fr, this message translates to:
  /// **'Connectez-vous à votre compte'**
  String get authSousTitreConnexion;

  /// No description provided for @authCreerTitre.
  ///
  /// In fr, this message translates to:
  /// **'Créez votre compte'**
  String get authCreerTitre;

  /// No description provided for @authCreerSousTitre.
  ///
  /// In fr, this message translates to:
  /// **'Rejoignez la communauté et commencez à emprunter ou prêter.'**
  String get authCreerSousTitre;

  /// No description provided for @authMotDePasseOublie.
  ///
  /// In fr, this message translates to:
  /// **'Mot de passe oublié ?'**
  String get authMotDePasseOublie;

  /// No description provided for @authContinuerGoogle.
  ///
  /// In fr, this message translates to:
  /// **'Continuer avec Google'**
  String get authContinuerGoogle;

  /// No description provided for @authPasDeCompteQuestion.
  ///
  /// In fr, this message translates to:
  /// **'Pas encore de compte ?'**
  String get authPasDeCompteQuestion;

  /// No description provided for @authSInscrire.
  ///
  /// In fr, this message translates to:
  /// **'S’inscrire'**
  String get authSInscrire;

  /// No description provided for @authDejaCompteQuestion.
  ///
  /// In fr, this message translates to:
  /// **'Déjà un compte ?'**
  String get authDejaCompteQuestion;

  /// No description provided for @authSeConnecter.
  ///
  /// In fr, this message translates to:
  /// **'Se connecter'**
  String get authSeConnecter;

  /// No description provided for @authReinitEnvoyee.
  ///
  /// In fr, this message translates to:
  /// **'E-mail de réinitialisation envoyé'**
  String get authReinitEnvoyee;

  /// No description provided for @lieuGouvernorat.
  ///
  /// In fr, this message translates to:
  /// **'Gouvernorat'**
  String get lieuGouvernorat;

  /// No description provided for @lieuVille.
  ///
  /// In fr, this message translates to:
  /// **'Ville'**
  String get lieuVille;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['ar', 'en', 'fr'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'en':
      return AppLocalizationsEn();
    case 'fr':
      return AppLocalizationsFr();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
