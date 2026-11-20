abstract final class Chemins {
  static const accueil = '/';
  static const recherche = '/recherche';
  static const parametres = '/parametres';
  static const connexion = '/connexion';
  static const inscription = '/inscription';
  static const splash = '/splash';
  static const nouvelObjet = '/objets/nouveau';
  static const profil = '/profil';
  static const modifierProfil = '/profil/modifier';

  /// Modèle de route : l'identifiant fait partie de l'adresse.
  static const objet = '/objet/:id';

  /// Adresse concrète du détail d'un objet.
  static String detailObjet(String id) => '/objet/$id';
}
