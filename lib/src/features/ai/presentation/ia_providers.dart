import 'dart:io';

import 'package:borrowbetter/src/features/ai/data/depot_ia_gemini.dart';
import 'package:borrowbetter/src/features/ai/data/source_gemini.dart';
import 'package:borrowbetter/src/features/ai/domain/depot_ia.dart';
import 'package:borrowbetter/src/features/ai/domain/suggestion_annonce.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final depotIAProvider = Provider<DepotIA>(
  (ref) => const DepotIAGemini(SourceGemini()),
);

class SuggestionIANotifier extends AsyncNotifier<SuggestionAnnonce?> {
  @override
  Future<SuggestionAnnonce?> build() async => null;

  Future<void> analyser({
    required String cheminPhoto,
    required String indice,
    required String langue,
  }) async {
    if (state.isLoading) return;
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final octets = await File(cheminPhoto).readAsBytes();
      return await ref
          .read(depotIAProvider)
          .suggerer(photo: octets, indice: indice, langue: langue);
    });
  }
}

// Riverpod 3.4.3 n'expose pas de type public pour ce provider autoDispose.
// ignore: specify_nonobvious_property_types
final suggestionIAProvider =
    AsyncNotifierProvider.autoDispose<SuggestionIANotifier, SuggestionAnnonce?>(
      SuggestionIANotifier.new,
    );
