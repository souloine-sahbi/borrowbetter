/// Valeurs qui changent selon l'environnement. Ce ne sont pas des secrets :
/// le nom du compte Cloudinary et celui du preset non signé sont visibles
/// dans toute requête d'envoi. Ne jamais mettre ici la clé ou le secret d'API.
///
/// Pour les remplacer sans modifier le code :
/// `flutter run --dart-define=CLOUDINARY_CLOUD=autre`
abstract final class Environnement {
  static const cloudinaryNom = String.fromEnvironment(
    'CLOUDINARY_CLOUD',
    defaultValue: 'ckhyx2hp',
  );

  static const cloudinaryPreset = String.fromEnvironment(
    'CLOUDINARY_PRESET',
    defaultValue: 'borrowbetter_objets',
  );
}
