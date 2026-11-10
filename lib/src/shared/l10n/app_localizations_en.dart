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

  @override
  String get navAccueil => 'Home';

  @override
  String get navRecherche => 'Search';

  @override
  String get navParametres => 'Settings';

  @override
  String get parametresLangue => 'Language';

  @override
  String get parametresTheme => 'Theme';

  @override
  String get authConnexion => 'Sign in';

  @override
  String get authInscription => 'Sign up';

  @override
  String get authEmail => 'Email address';

  @override
  String get authMotDePasse => 'Password';

  @override
  String get authNom => 'Full name';

  @override
  String get authPasDeCompte => 'No account yet? Sign up';

  @override
  String get authDejaCompte => 'Already have an account? Sign in';

  @override
  String get authDeconnexion => 'Sign out';

  @override
  String get validationObligatoire => 'This field is required';

  @override
  String get validationEmail => 'Invalid email address';

  @override
  String get validationMotDePasse => 'At least 6 characters';

  @override
  String get erreurIdentifiants => 'Incorrect email or password';

  @override
  String get erreurEmailUtilise => 'This email address is already in use';

  @override
  String get erreurMotDePasseFaible => 'Password too weak';

  @override
  String get erreurReseau => 'Network connection problem';

  @override
  String get erreurInconnue => 'Something went wrong, please try again';

  @override
  String get forceFaible => 'Weak';

  @override
  String get forceMoyenne => 'Fair';

  @override
  String get forceBonne => 'Good';

  @override
  String get forceForte => 'Strong';

  @override
  String get forceConseil =>
      'Use 8 or more characters with uppercase letters, numbers and symbols';

  @override
  String get authBienvenue => 'Welcome back!';

  @override
  String get authSousTitreConnexion => 'Log in to your account';

  @override
  String get authCreerTitre => 'Create your account';

  @override
  String get authCreerSousTitre =>
      'Join our community and start borrowing or lending.';

  @override
  String get authMotDePasseOublie => 'Forgot password?';

  @override
  String get authContinuerGoogle => 'Continue with Google';

  @override
  String get authPasDeCompteQuestion => 'Don’t have an account?';

  @override
  String get authSInscrire => 'Sign up';

  @override
  String get authDejaCompteQuestion => 'Already have an account?';

  @override
  String get authSeConnecter => 'Log in';

  @override
  String get authReinitEnvoyee => 'Password reset email sent';

  @override
  String get lieuGouvernorat => 'Governorate';

  @override
  String get lieuVille => 'City';

  @override
  String get objetNouveau => 'Add an item';

  @override
  String get objetTitre => 'Listing title';

  @override
  String get objetDescription => 'Description';

  @override
  String get objetCategorie => 'Category';

  @override
  String get objetEtat => 'Condition';

  @override
  String get objetCite => 'Neighborhood';

  @override
  String get objetRue => 'Street (optional)';

  @override
  String get objetPublier => 'Publish';

  @override
  String get objetPublie => 'Item published';

  @override
  String get categorieOutils => 'Tools';

  @override
  String get categorieCamping => 'Camping';

  @override
  String get categorieCuisine => 'Kitchen';

  @override
  String get categorieSport => 'Sports';

  @override
  String get categorieElectronique => 'Electronics';

  @override
  String get categorieLivres => 'Books';

  @override
  String get categorieJeux => 'Games';

  @override
  String get categorieAutre => 'Other';

  @override
  String get etatNeuf => 'New';

  @override
  String get etatCommeNeuf => 'Like new';

  @override
  String get etatBonEtat => 'Good';

  @override
  String get etatUsage => 'Used';

  @override
  String get erreurNonAutorise => 'Your session has expired';

  @override
  String get erreurIntrouvable => 'This item no longer exists';

  @override
  String get erreurServeur => 'Service unavailable';
}
