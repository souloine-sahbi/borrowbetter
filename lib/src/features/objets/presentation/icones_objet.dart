import 'package:borrowbetter/src/features/objets/domain/objet.dart';
import 'package:flutter/material.dart';

/// Icône d'une catégorie, pour la grille de l'accueil.
IconData iconeCategorie(CategorieObjet categorie) {
  return switch (categorie) {
    CategorieObjet.outils => Icons.handyman_outlined,
    CategorieObjet.camping => Icons.cabin_outlined,
    CategorieObjet.cuisine => Icons.soup_kitchen_outlined,
    CategorieObjet.sport => Icons.sports_basketball_outlined,
    CategorieObjet.electronique => Icons.devices_outlined,
    CategorieObjet.livres => Icons.menu_book_outlined,
    CategorieObjet.jeux => Icons.sports_esports_outlined,
    CategorieObjet.autre => Icons.more_horiz,
  };
}
