import 'package:borrowbetter/src/shared/l10n/langue_controleur.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

const _cleTheme = 'theme';

class ThemeControleur extends Notifier<ThemeMode> {
  @override
  ThemeMode build() {
    final nom = ref.watch(preferencesProvider).getString(_cleTheme);
    return ThemeMode.values.asNameMap()[nom] ?? ThemeMode.system;
  }

  Future<void> choisir(ThemeMode mode) async {
    state = mode;
    await ref.read(preferencesProvider).setString(_cleTheme, mode.name);
  }
}

final themeModeProvider = NotifierProvider<ThemeControleur, ThemeMode>(
  ThemeControleur.new,
);
