/// Envoi des photos d'un objet vers un hébergeur d'images.
///
/// Les photos sont désignées par leur chemin local : aucun type de
/// `image_picker` ne traverse le domaine. Les implémentations renvoient les
/// adresses publiques, dans le même ordre, et traduisent leurs erreurs en
/// `Failure`.
abstract interface class DepotPhotos {
  Future<List<String>> envoyer(List<String> chemins);
}
