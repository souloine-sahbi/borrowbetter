import 'dart:async';
import 'dart:io';

import 'package:borrowbetter/src/shared/domain/failure.dart';
import 'package:firebase_ai/firebase_ai.dart';
import 'package:flutter/foundation.dart';

// À confirmer dans la console Firebase (AI Logic) : modèle gratuit disponible.
const nomModeleGemini = 'gemini-3.5-flash-lite';

class SourceGemini {
  const new();

  /// Renvoie le JSON brut de la réponse. Les erreurs sont traduites en Failure.
  Future<String> analyser({
    required Uint8List photo,
    required String consigne,
    required List<String> categories,
    required List<String> etats,
  }) async {
    final modele = FirebaseAI.googleAI().generativeModel(
      model: nomModeleGemini,
      generationConfig: GenerationConfig(
        responseMimeType: 'application/json',
        responseSchema: Schema.object(
          properties: {
            'titre': Schema.string(),
            'categorie': Schema.enumString(enumValues: categories),
            'etat': Schema.enumString(enumValues: etats),
            'description': Schema.string(),
          },
        ),
      ),
    );
    try {
      final reponse = await modele
          .generateContent([
            Content.multi([
              TextPart(consigne),
              InlineDataPart('image/jpeg', photo),
            ]),
          ])
          .timeout(const Duration(seconds: 25));
      final texte = reponse.text;
      if (texte == null || texte.trim().isEmpty) {
        throw const ErreurServeur('reponse-vide');
      }
      return texte;
    } on TimeoutException {
      throw const PasDeReseau();
    } on SocketException {
      throw const PasDeReseau();
    } on FirebaseAIException catch (e, trace) {
      debugPrint('Gemini : ${e.message}');
      final quota = e.message.toLowerCase().contains('quota');
      Error.throwWithStackTrace(ErreurServeur(quota ? 'quota' : 'ia'), trace);
    }
  }
}
