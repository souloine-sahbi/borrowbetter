abstract final class Chemins {
  static const accueil = '/';
  static const recherche = '/recherche';
  static const demandes = '/demandes';
  static const profil = '/profil';
  static const modifierProfil = '/profil/modifier';
  static const parametres = '/parametres';
  static const connexion = '/connexion';
  static const inscription = '/inscription';
  static const splash = '/splash';
  static const nouvelObjet = '/objets/nouveau';
  static const signalement = '/signalement';

  /// Modèles de route : l'identifiant fait partie de l'adresse.
  static const objet = '/objet/:id';
  static const modifierObjet = '/objet/:id/modifier';

  /// Adresses concrètes.
  static String detailObjet(String id) => '/objet/$id';
  static String editerObjet(String id) => '/objet/$id/modifier';
  static String signalerObjet(String id) => Uri(
    path: signalement,
    queryParameters: {'type': 'objet', 'id': id},
  ).toString();
}
