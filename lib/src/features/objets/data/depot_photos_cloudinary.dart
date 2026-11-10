import 'package:borrowbetter/src/features/objets/domain/depot_photos.dart';
import 'package:borrowbetter/src/shared/data/traduire_dio.dart';
import 'package:borrowbetter/src/shared/domain/failure.dart';
import 'package:borrowbetter/src/shared/reseau/environnement.dart';
import 'package:dio/dio.dart';

class DepotPhotosCloudinary implements DepotPhotos {
  new(this._dio);

  final Dio _dio;

  static const _hote = 'https://api.cloudinary.com/v1_1';

  @override
  Future<List<String>> envoyer(List<String> chemins) {
    return Future.wait(chemins.map(_envoyerUne));
  }

  Future<String> _envoyerUne(String chemin) async {
    try {
      final formulaire = FormData.fromMap({
        'upload_preset': Environnement.cloudinaryPreset,
        'file': await MultipartFile.fromFile(chemin),
      });
      final reponse = await _dio.post<Map<String, dynamic>>(
        '$_hote/${Environnement.cloudinaryNom}/image/upload',
        data: formulaire,
      );
      final url = reponse.data?['secure_url'] as String?;
      if (url == null || url.isEmpty) {
        throw const ErreurServeur('reponse-invalide');
      }
      return url;
    } on DioException catch (e, trace) {
      Error.throwWithStackTrace(traduireDio(e), trace);
    }
  }
}
