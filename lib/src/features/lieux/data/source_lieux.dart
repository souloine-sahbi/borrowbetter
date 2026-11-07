import 'dart:convert';

import 'package:borrowbetter/src/features/lieux/domain/lieux.dart';
import 'package:flutter/services.dart';

Future<List<Gouvernorat>> chargerLieux() async {
  final texte = await rootBundle.loadString('assets/data/tunisie_lieux.json');
  final json = jsonDecode(texte) as Map<String, dynamic>;
  final liste = json['gouvernorats'] as List<dynamic>;
  return [
    for (final element in liste)
      _versGouvernorat(element as Map<String, dynamic>),
  ];
}

Gouvernorat _versGouvernorat(Map<String, dynamic> json) {
  final villes = json['villes'] as List<dynamic>;
  return Gouvernorat(
    id: json['id'] as String,
    nomFr: json['fr'] as String,
    nomAr: json['ar'] as String,
    villes: [
      for (final ville in villes) _versVille(ville as Map<String, dynamic>),
    ],
  );
}

Ville _versVille(Map<String, dynamic> json) {
  return Ville(
    id: json['id'] as String,
    nomFr: json['fr'] as String,
    nomAr: json['ar'] as String,
  );
}
