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

  @override
  String get authBienvenue => 'Bon retour !';

  @override
  String get authSousTitreConnexion => 'Connectez-vous à votre compte';

  @override
  String get authCreerTitre => 'Créez votre compte';

  @override
  String get authCreerSousTitre =>
      'Rejoignez la communauté et commencez à emprunter ou prêter.';

  @override
  String get authMotDePasseOublie => 'Mot de passe oublié ?';

  @override
  String get authContinuerGoogle => 'Continuer avec Google';

  @override
  String get authPasDeCompteQuestion => 'Pas encore de compte ?';

  @override
  String get authSInscrire => 'S’inscrire';

  @override
  String get authDejaCompteQuestion => 'Déjà un compte ?';

  @override
  String get authSeConnecter => 'Se connecter';

  @override
  String get authReinitEnvoyee => 'E-mail de réinitialisation envoyé';

  @override
  String get lieuGouvernorat => 'Gouvernorat';

  @override
  String get lieuVille => 'Ville';

  @override
  String get objetNouveau => 'Ajouter un objet';

  @override
  String get objetTitre => 'Titre de l’annonce';

  @override
  String get objetDescription => 'Description';

  @override
  String get objetCategorie => 'Catégorie';

  @override
  String get objetEtat => 'État';

  @override
  String get objetCite => 'Cité ou quartier';

  @override
  String get objetRue => 'Rue (facultatif)';

  @override
  String get objetPublier => 'Publier';

  @override
  String get objetPublie => 'Objet publié';

  @override
  String get categorieOutils => 'Outils';

  @override
  String get categorieCamping => 'Camping';

  @override
  String get categorieCuisine => 'Cuisine';

  @override
  String get categorieSport => 'Sport';

  @override
  String get categorieElectronique => 'Électronique';

  @override
  String get categorieLivres => 'Livres';

  @override
  String get categorieJeux => 'Jeux';

  @override
  String get categorieAutre => 'Autre';

  @override
  String get etatNeuf => 'Neuf';

  @override
  String get etatCommeNeuf => 'Comme neuf';

  @override
  String get etatBonEtat => 'Bon état';

  @override
  String get etatUsage => 'Usagé';

  @override
  String get erreurNonAutorise => 'Votre session a expiré';

  @override
  String get erreurIntrouvable => 'Cet objet n\'existe plus';

  @override
  String get erreurServeur => 'Service indisponible';

  @override
  String get photosAjouter => 'Ajouter des photos';

  @override
  String get photosRetirer => 'Retirer la photo';

  @override
  String get objetDetailTitre => 'Détails de l\'objet';

  @override
  String objetProposePar(String nom) {
    return 'Proposé par $nom';
  }

  @override
  String get objetDemander => 'Demander à emprunter';

  @override
  String get objetDemanderBientot => 'La demande d\'emprunt arrive bientôt.';

  @override
  String get objetProprietaire => 'Propriétaire';

  @override
  String get accueilBonjour => 'Bonjour';

  @override
  String accueilBonjourNom(String nom) {
    return 'Bonjour, $nom';
  }

  @override
  String get accueilRechercher => 'Rechercher un objet…';

  @override
  String get accueilRecents => 'Récemment ajoutés';

  @override
  String get rechercheToutes => 'Tout';

  @override
  String get rechercheFiltres => 'Filtres';

  @override
  String get rechercheReinitialiser => 'Réinitialiser le lieu';

  @override
  String get rechercheTerminer => 'Terminer';

  @override
  String get profilTitre => 'Profil';

  @override
  String get profilModifier => 'Modifier le profil';

  @override
  String get profilChangerPhoto => 'Changer la photo';

  @override
  String get profilEnregistrer => 'Enregistrer';

  @override
  String get profilEchec => 'Enregistrement impossible. Réessayez.';

  @override
  String get profilLieu => 'Zone';

  @override
  String get profilLieuVide => 'Non renseignée';

  @override
  String get barreAccueil => 'Accueil';

  @override
  String get barreRecherche => 'Recherche';

  @override
  String get barreAjouter => 'Ajouter un objet';

  @override
  String get barreDemandes => 'Demandes';

  @override
  String get barreProfil => 'Profil';

  @override
  String get bientotMessage => 'Cette section arrive bientôt.';

  @override
  String get tiroirMenu => 'Menu';

  @override
  String get tiroirAide => 'Aide';

  @override
  String get tiroirAideTexte =>
      'Pour publier un objet, touchez le bouton + de la barre du bas. Pour emprunter, ouvrez la fiche d\'un objet.';

  @override
  String get tiroirFermer => 'Fermer';

  @override
  String get tarifGratuit => 'Gratuit';

  @override
  String get tarifPrix => 'Prix (DT)';

  @override
  String get tarifUnite => 'Par';

  @override
  String get tarifPrixInvalide => 'Saisissez un prix supérieur à 0';

  @override
  String get tarifPrixTropEleve => 'Prix trop élevé';

  @override
  String get tarifUniteManquante => 'Choisissez une unité';

  @override
  String get uniteHeure => 'heure';

  @override
  String get uniteJour => 'jour';

  @override
  String get uniteSemaine => 'semaine';

  @override
  String get uniteMois => 'mois';

  @override
  String tarifPrixUnite(String prix, String unite) {
    return '$prix DT / $unite';
  }

  @override
  String get objetModifierTitre => 'Modifier l\'objet';

  @override
  String get objetModifier => 'Modifier';

  @override
  String get objetEchecModification => 'Modification impossible. Réessayez.';

  @override
  String get traductionTraduire => 'Traduire';

  @override
  String get traductionTraduitAuto => 'Traduit automatiquement';

  @override
  String get traductionVoirOriginal => 'Voir l\'original';

  @override
  String get traductionEchec =>
      'Traduction impossible. Le texte original reste affiché.';

  @override
  String get traductionReessayer => 'Réessayer';

  @override
  String get signalementTitre => 'Signaler';

  @override
  String get signalementSignaler => 'Signaler cet objet';

  @override
  String get signalementMotif => 'Motif';

  @override
  String get signalementDescription => 'Description';

  @override
  String get signalementQuestion => 'Pourquoi signalez-vous cet objet ?';

  @override
  String get signalementDetails => 'Détails (facultatif)';

  @override
  String get signalementDetailsAutre => 'Précisez le motif';

  @override
  String get signalementEnvoyer => 'Envoyer le signalement';

  @override
  String get signalementMerci => 'Merci, votre signalement a été envoyé.';

  @override
  String get signalementEchec => 'Envoi impossible. Réessayez.';

  @override
  String get signalementMotifObligatoire => 'Choisissez un motif';

  @override
  String get signalementDescriptionCourte => '10 caractères minimum';

  @override
  String get signalementDescriptionLongue => '500 caractères maximum';

  @override
  String get motifContenu => 'Contenu inapproprié';

  @override
  String get motifArnaque => 'Arnaque ou fraude';

  @override
  String get motifInexistant => 'Objet inexistant ou trompeur';

  @override
  String get motifComportement => 'Comportement problématique';

  @override
  String get motifAutre => 'Autre';

  @override
  String get iaBouton => 'Remplir à partir de la photo';

  @override
  String get iaPhotoRequise => 'Ajoutez d\'abord une photo';

  @override
  String get iaIndice => 'Quelques mots (facultatif)';

  @override
  String get iaBandeau => 'Suggestion IA, à vérifier avant de publier';

  @override
  String get iaConfidTitre => 'Analyse de la photo';

  @override
  String get iaConfidTexte =>
      'La photo est envoyée à Google (Gemini) pour proposer une fiche. Vous pouvez tout modifier avant de publier. Ce bouton est facultatif.';

  @override
  String get iaAccepter => 'Continuer';

  @override
  String get iaRefuser => 'Annuler';

  @override
  String get iaEchec =>
      'Suggestion indisponible. Remplissez la fiche à la main.';
}
