import 'package:borrowbetter/src/features/objets/domain/objet.dart';
import 'package:borrowbetter/src/features/objets/presentation/objets_providers.dart';
import 'package:borrowbetter/src/features/recherche/domain/filtres_recherche.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Les filtres de la recherche. Ils survivent au changement d'onglet.
class FiltresRechercheNotifier extends Notifier<FiltresRecherche> {
  @override
  FiltresRecherche build() => const FiltresRecherche();

  // L'état est toujours remplacé, jamais modifié en place.
  void changerTexte(String texte) => state = state.copyWith(texte: texte);

  void choisirCategorie(CategorieObjet? categorie) =>
      state = state.copyWith(categorie: categorie);

  void choisirLieu(String? gouvernoratId, String? villeId) =>
      state = state.copyWith(gouvernoratId: gouvernoratId, villeId: villeId);

  void reinitialiser() => state = const FiltresRecherche();
}

final filtresRechercheProvider =
    NotifierProvider<FiltresRechercheNotifier, FiltresRecherche>(
      FiltresRechercheNotifier.new,
    );

/// Objets correspondant à la catégorie et au lieu choisis.
///
/// Le texte n'est volontairement pas lu ici : le taper ne doit pas relancer
/// la requête Firestore à chaque lettre. L'écran le filtre sur ce résultat.
final resultatsRechercheProvider = StreamProvider<List<Objet>>((ref) {
  final depot = ref.watch(depotObjetsProvider);
  final (categorie, gouvernoratId, villeId) = ref.watch(
    filtresRechercheProvider.select(
      (f) => (f.categorie, f.gouvernoratId, f.villeId),
    ),
  );
  return depot.surveillerDisponibles(
    categorie: categorie,
    gouvernoratId: gouvernoratId,
    villeId: villeId,
  );
});
