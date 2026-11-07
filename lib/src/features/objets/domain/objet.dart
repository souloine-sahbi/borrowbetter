enum CategorieObjet {
  outils,
  camping,
  cuisine,
  sport,
  electronique,
  livres,
  jeux,
  autre,
}

enum EtatObjet { neuf, commeNeuf, bonEtat, usage }

enum StatutObjet { disponible, indisponible, enAttenteModeration, masque }

class Objet {
  const new({
    required this.id,
    required this.proprietaireId,
    required this.proprietaireNom,
    required this.titre,
    required this.description,
    required this.categorie,
    required this.etat,
    required this.gouvernoratId,
    required this.villeId,
    required this.langueAnnonce,
    required this.statut,
    required this.creeLe,
    this.photos = const [],
  });

  final String id;
  final String proprietaireId;
  final String proprietaireNom;
  final String titre;
  final String description;
  final CategorieObjet categorie;
  final EtatObjet etat;
  final String gouvernoratId;
  final String villeId;
  final String langueAnnonce;
  final StatutObjet statut;
  final DateTime creeLe;
  final List<String> photos;
}

/// Données saisies dans le formulaire, avant l'enregistrement.
class BrouillonObjet {
  const new({
    required this.titre,
    required this.description,
    required this.categorie,
    required this.etat,
    required this.gouvernoratId,
    required this.villeId,
    required this.langueAnnonce,
    required this.cite,
    this.rue,
  });

  final String titre;
  final String description;
  final CategorieObjet categorie;
  final EtatObjet etat;
  final String gouvernoratId;
  final String villeId;
  final String langueAnnonce;
  final String cite;
  final String? rue;
}
