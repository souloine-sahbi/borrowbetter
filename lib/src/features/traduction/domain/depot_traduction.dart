/// Traduction automatique d'un texte. Les implémentations traduisent leurs
/// erreurs en `Failure`.
abstract interface class DepotTraduction {
  Future<String> traduire(
    String texte, {
    required String de,
    required String vers,
  });
}
