import 'package:borrowbetter/src/features/objets/domain/objet.dart';
import 'package:borrowbetter/src/shared/l10n/app_localizations.dart';

String libelleCategorie(AppLocalizations textes, CategorieObjet categorie) {
  return switch (categorie) {
    CategorieObjet.outils => textes.categorieOutils,
    CategorieObjet.camping => textes.categorieCamping,
    CategorieObjet.cuisine => textes.categorieCuisine,
    CategorieObjet.sport => textes.categorieSport,
    CategorieObjet.electronique => textes.categorieElectronique,
    CategorieObjet.livres => textes.categorieLivres,
    CategorieObjet.jeux => textes.categorieJeux,
    CategorieObjet.autre => textes.categorieAutre,
  };
}

String libelleEtat(AppLocalizations textes, EtatObjet etat) {
  return switch (etat) {
    EtatObjet.neuf => textes.etatNeuf,
    EtatObjet.commeNeuf => textes.etatCommeNeuf,
    EtatObjet.bonEtat => textes.etatBonEtat,
    EtatObjet.usage => textes.etatUsage,
  };
}
