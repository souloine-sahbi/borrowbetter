/// Erreurs métier. Aucune exception technique (Firebase, Dio) ne franchit
/// la frontière de la couche données : le dépôt les traduit en [Failure].
sealed class Failure implements Exception {
  const new();
}

class PasDeReseau extends Failure {
  const new();
}

class NonAutorise extends Failure {
  const new();
}

class Introuvable extends Failure {
  const new();
}

class ErreurServeur extends Failure {
  const new([this.code]);

  final String? code;
}
