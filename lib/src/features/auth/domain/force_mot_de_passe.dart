enum ForceMotDePasse { aucune, faible, moyenne, bonne, forte }

final _minuscule = RegExp('[a-z]');
final _majuscule = RegExp('[A-Z]');
final _chiffre = RegExp('[0-9]');
final _symbole = RegExp('[^A-Za-z0-9]');

/// Évalue la force d'un mot de passe.
///
/// Un point par critère : 8 caractères ou plus, 12 ou plus, minuscules et
/// majuscules, chiffre, symbole. Sous 8 caractères, le résultat reste faible.
ForceMotDePasse evaluerForce(String motDePasse) {
  if (motDePasse.isEmpty) return ForceMotDePasse.aucune;
  if (motDePasse.length < 8) return ForceMotDePasse.faible;

  var points = 1;
  if (motDePasse.length >= 12) points++;
  if (_minuscule.hasMatch(motDePasse) && _majuscule.hasMatch(motDePasse)) {
    points++;
  }
  if (_chiffre.hasMatch(motDePasse)) points++;
  if (_symbole.hasMatch(motDePasse)) points++;

  return switch (points) {
    1 || 2 => ForceMotDePasse.faible,
    3 => ForceMotDePasse.moyenne,
    4 => ForceMotDePasse.bonne,
    _ => ForceMotDePasse.forte,
  };
}
