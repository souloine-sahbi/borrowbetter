enum CibleSignalement { objet, utilisateur }

enum MotifSignalement {
  contenuInapproprie,
  arnaque,
  inexistant,
  comportement,
  autre,
}

class BrouillonSignalement {
  const new({
    required this.cible,
    required this.cibleId,
    required this.motif,
    required this.description,
  });

  final CibleSignalement cible;
  final String cibleId;
  final MotifSignalement motif;
  final String description;
}
