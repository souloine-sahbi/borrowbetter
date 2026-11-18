// freezed écrit le nom de la classe dans ses constructeurs factory.
// ignore_for_file: unnecessary_type_name_in_constructor

import 'package:borrowbetter/src/features/objets/domain/objet.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'filtres_recherche.freezed.dart';

/// Ce que l'utilisateur a demandé à la recherche.
///
/// La catégorie et le lieu partent à Firestore (égalités simples). Le texte
/// se filtre dans l'application : Firestore n'a pas de recherche plein texte.
@freezed
abstract class FiltresRecherche with _$FiltresRecherche {
  const factory FiltresRecherche({
    @Default('') String texte,
    CategorieObjet? categorie,
    String? gouvernoratId,
    String? villeId,
  }) = _FiltresRecherche;
}