class Ville {
  const new({required this.id, required this.nomFr, required this.nomAr});

  final String id;
  final String nomFr;
  final String nomAr;

  String nom(String codeLangue) => codeLangue == 'ar' ? nomAr : nomFr;
}

class Gouvernorat {
  const new({
    required this.id,
    required this.nomFr,
    required this.nomAr,
    required this.villes,
  });

  final String id;
  final String nomFr;
  final String nomAr;
  final List<Ville> villes;

  String nom(String codeLangue) => codeLangue == 'ar' ? nomAr : nomFr;
}
