import 'package:borrowbetter/src/features/objets/domain/adresse_privee.dart';
import 'package:borrowbetter/src/features/objets/domain/depot_objets.dart';
import 'package:borrowbetter/src/features/objets/domain/objet.dart';
import 'package:borrowbetter/src/features/objets/presentation/objets_providers.dart';
import 'package:borrowbetter/src/shared/domain/failure.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

class _DepotFactice implements DepotObjets {
  new(this._objet);

  final Objet? _objet;

  @override
  Stream<List<Objet>> surveillerDisponibles({
    CategorieObjet? categorie,
    String? gouvernoratId,
    String? villeId,
  }) => const Stream.empty();

  @override
  Future<Objet?> parId(String id) async => _objet;

  @override
  Future<String> publier(
    BrouillonObjet brouillon, {
    required String proprietaireId,
    required String proprietaireNom,
  }) async => 'id';

  @override
  Future<void> modifier(String id, BrouillonObjet brouillon) async {}

  @override
  Future<AdressePrivee?> lireAdresse(String id) async => null;
}

final _objet = Objet(
  id: 'a1',
  proprietaireId: 'u1',
  proprietaireNom: 'Souloine',
  titre: 'Perceuse',
  description: 'Perceuse sans fil',
  categorie: CategorieObjet.outils,
  etat: EtatObjet.bonEtat,
  gouvernoratId: 'tunis',
  villeId: 'el-menzah',
  langueAnnonce: 'fr',
  statut: StatutObjet.disponible,
  creeLe: DateTime(2026, 11, 10),
);

ProviderContainer _conteneur(Objet? objet) {
  final conteneur = ProviderContainer(
    overrides: [depotObjetsProvider.overrideWithValue(_DepotFactice(objet))],
  );
  addTearDown(conteneur.dispose);
  return conteneur;
}

void main() {
  group('objetProvider', () {
    test('renvoie l’objet trouvé', () async {
      // Un auditeur garde le provider vivant (il est autoDispose).
      final conteneur = _conteneur(_objet)
        ..listen(objetProvider('a1'), (_, _) {});

      expect(await conteneur.read(objetProvider('a1').future), _objet);
    });

    test('un objet absent devient une Introuvable', () async {
      final conteneur = _conteneur(null)..listen(objetProvider('x'), (_, _) {});

      expect(
        conteneur.read(objetProvider('x').future),
        throwsA(isA<Introuvable>()),
      );
    });
  });
}
