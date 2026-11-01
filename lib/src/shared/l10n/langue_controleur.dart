import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _cleLangue = 'langue';

/// Fournit les préférences locales (valeur injectée dans `main`).
final preferencesProvider = Provider<SharedPreferences>(
  (ref) => throw UnimplementedError('Injecter dans ProviderScope'),
);

class LangueControleur extends Notifier<Locale?> {
  @override
  Locale? build() {
    final code = ref.watch(preferencesProvider).getString(_cleLangue);
    return code == null ? null : Locale(code);
  }

  Future<void> choisir(String code) async {
    state = Locale(code);
    await ref.read(preferencesProvider).setString(_cleLangue, code);
  }
}

final langueProvider = NotifierProvider<LangueControleur, Locale?>(
  LangueControleur.new,
);
