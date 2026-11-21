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

  @override
  String get photosAjouter => 'Add photos';

  @override
  String get photosRetirer => 'Remove photo';

  @override
  String get objetDetailTitre => 'Item details';

  @override
  String objetProposePar(String nom) {
    return 'Offered by $nom';
  }

  @override
  String get objetDemander => 'Request to borrow';

  @override
  String get objetDemanderBientot => 'Borrow requests are coming soon.';

  @override
  String get objetProprietaire => 'Owner';

  @override
  String get accueilBonjour => 'Hello';

  @override
  String accueilBonjourNom(String nom) {
    return 'Hello, $nom';
  }

  @override
  String get accueilRechercher => 'Search for items…';

  @override
  String get accueilRecents => 'Recently added';

  @override
  String get rechercheToutes => 'All';

  @override
  String get rechercheFiltres => 'Filters';

  @override
  String get rechercheReinitialiser => 'Reset location';

  @override
  String get rechercheTerminer => 'Done';

  @override
  String get profilTitre => 'Profile';

  @override
  String get profilModifier => 'Edit profile';

  @override
  String get profilChangerPhoto => 'Change photo';

  @override
  String get profilEnregistrer => 'Save';

  @override
  String get profilEchec => 'Could not save. Please try again.';

  @override
  String get profilLieu => 'Area';

  @override
  String get profilLieuVide => 'Not set';

  @override
  String get barreAccueil => 'Home';

  @override
  String get barreRecherche => 'Search';

  @override
  String get barreAjouter => 'Add an item';

  @override
  String get barreDemandes => 'Requests';

  @override
  String get barreProfil => 'Profile';

  @override
  String get bientotMessage => 'This section is coming soon.';

  @override
  String get tiroirMenu => 'Menu';

  @override
  String get tiroirAide => 'Help';

  @override
  String get tiroirAideTexte =>
      'To publish an item, tap the + button in the bottom bar. To borrow, open an item\'s page.';

  @override
  String get tiroirFermer => 'Close';

  @override
  String get tarifGratuit => 'Free';

  @override
  String get tarifPrix => 'Price (DT)';

  @override
  String get tarifUnite => 'Per';

  @override
  String get tarifPrixInvalide => 'Enter a price greater than 0';

  @override
  String get tarifPrixTropEleve => 'Price too high';

  @override
  String get tarifUniteManquante => 'Choose a unit';

  @override
  String get uniteHeure => 'hour';

  @override
  String get uniteJour => 'day';

  @override
  String get uniteSemaine => 'week';

  @override
  String get uniteMois => 'month';

  @override
  String tarifPrixUnite(String prix, String unite) {
    return '$prix DT / $unite';
  }

  @override
  String get objetModifierTitre => 'Edit item';

  @override
  String get objetModifier => 'Edit';

  @override
  String get objetEchecModification =>
      'Could not save changes. Please try again.';

  @override
  String get traductionTraduire => 'Translate';

  @override
  String get traductionTraduitAuto => 'Automatically translated';

  @override
  String get traductionVoirOriginal => 'View original';

  @override
  String get traductionEchec =>
      'Translation failed. The original text is still shown.';

  @override
  String get traductionReessayer => 'Retry';

  @override
  String get signalementTitre => 'Report';

  @override
  String get signalementSignaler => 'Report this item';

  @override
  String get signalementMotif => 'Reason';

  @override
  String get signalementDescription => 'Description';

  @override
  String get signalementQuestion => 'Why are you reporting this item?';

  @override
  String get signalementDetails => 'Details (optional)';

  @override
  String get signalementDetailsAutre => 'Please describe the reason';

  @override
  String get signalementEnvoyer => 'Send report';

  @override
  String get signalementMerci => 'Thank you, your report has been sent.';

  @override
  String get signalementEchec => 'Could not send. Please try again.';

  @override
  String get signalementMotifObligatoire => 'Choose a reason';

  @override
  String get signalementDescriptionCourte => '10 characters minimum';

  @override
  String get signalementDescriptionLongue => '500 characters maximum';

  @override
  String get motifContenu => 'Inappropriate content';

  @override
  String get motifArnaque => 'Scam or fraud';

  @override
  String get motifInexistant => 'Item missing or misleading';

  @override
  String get motifComportement => 'Problematic behavior';

  @override
  String get motifAutre => 'Other';

  @override
  String get iaBouton => 'Fill from the photo';

  @override
  String get iaPhotoRequise => 'Add a photo first';

  @override
  String get iaIndice => 'A few words (optional)';

  @override
  String get iaBandeau => 'AI suggestion, please check before publishing';

  @override
  String get iaConfidTitre => 'Photo analysis';

  @override
  String get iaConfidTexte =>
      'The photo is sent to Google (Gemini) to suggest a listing. You can edit everything before publishing. This button is optional.';

  @override
  String get iaAccepter => 'Continue';

  @override
  String get iaRefuser => 'Cancel';

  @override
  String get iaEchec =>
      'Suggestion unavailable. Please fill in the listing by hand.';
}
