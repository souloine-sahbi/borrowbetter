import 'package:borrowbetter/src/features/traduction/data/source_traduction.dart';
import 'package:borrowbetter/src/features/traduction/domain/decoupe_texte.dart';
import 'package:borrowbetter/src/features/traduction/domain/depot_traduction.dart';

class DepotTraductionMyMemory implements DepotTraduction {
  new(this._source);

  final SourceTraduction _source;

  @override
  Future<String> traduire(
    String texte, {
    required String de,
    required String vers,
  }) async {
    if (de == vers) return texte;
    final resultats = <String>[];
    // Séquentiel : on ménage le quota gratuit de l'API.
    for (final morceau in decouperTexte(texte)) {
      final dto = await _source.traduire(morceau, de: de, vers: vers);
      resultats.add(dto.versDomaine());
    }
    return resultats.join(' ');
  }
}
