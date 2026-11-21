import 'dart:typed_data';

import 'package:borrowbetter/src/features/ai/domain/suggestion_annonce.dart';

abstract interface class DepotIA {
  Future<SuggestionAnnonce> suggerer({
    required Uint8List photo,
    required String indice,
    required String langue,
  });
}
