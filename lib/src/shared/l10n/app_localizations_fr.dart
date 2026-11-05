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

  @override
  String get navAccueil => 'Accueil';

  @override
  String get navRecherche => 'Recherche';

  @override
  String get navParametres => 'Paramètres';

  @override
  String get parametresLangue => 'Langue';

  @override
  String get parametresTheme => 'Thème';

  @override
  String get authConnexion => 'Connexion';

  @override
  String get authInscription => 'Inscription';

  @override
  String get authEmail => 'Adresse e-mail';

  @override
  String get authMotDePasse => 'Mot de passe';

  @override
  String get authNom => 'Nom complet';

  @override
  String get authPasDeCompte => 'Pas encore de compte ? S’inscrire';

  @override
  String get authDejaCompte => 'Déjà un compte ? Se connecter';

  @override
  String get authDeconnexion => 'Se déconnecter';

  @override
  String get validationObligatoire => 'Ce champ est obligatoire';

  @override
  String get validationEmail => 'Adresse e-mail invalide';

  @override
  String get validationMotDePasse => '6 caractères minimum';

  @override
  String get erreurIdentifiants => 'E-mail ou mot de passe incorrect';

  @override
  String get erreurEmailUtilise => 'Cette adresse e-mail est déjà utilisée';

  @override
  String get erreurMotDePasseFaible => 'Mot de passe trop faible';

  @override
  String get erreurReseau => 'Problème de connexion réseau';

  @override
  String get erreurInconnue => 'Une erreur est survenue, réessayez';

  @override
  String get forceFaible => 'Faible';

  @override
  String get forceMoyenne => 'Moyen';

  @override
  String get forceBonne => 'Bon';

  @override
  String get forceForte => 'Fort';

  @override
  String get forceConseil =>
      'Utilisez 8 caractères ou plus, avec majuscules, chiffres et symboles';
}
