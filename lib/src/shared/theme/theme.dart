import 'package:borrowbetter/src/shared/theme/couleurs_marque.dart';
import 'package:borrowbetter/src/shared/theme/dimensions.dart';
import 'package:flutter/material.dart';

const _police = 'Poppins';

/// Construit le thème clair ou sombre de l'application.
ThemeData construireTheme(Brightness luminosite) {
  final estClair = luminosite == Brightness.light;
  final base = ColorScheme.fromSeed(
    seedColor: CouleursMarque.prune,
    brightness: luminosite,
  );
  final schema = base.copyWith(
    primary: estClair ? CouleursMarque.prune : null,
    onPrimary: estClair ? Colors.white : null,
    secondary: CouleursMarque.corail,
    onSecondary: CouleursMarque.texte,
    tertiary: CouleursMarque.mauve,
    onTertiary: Colors.white,
    surface: estClair ? CouleursMarque.creme : null,
  );

  return ThemeData(
    useMaterial3: true,
    colorScheme: schema,
    fontFamily: _police,
    scaffoldBackgroundColor: schema.surface,
    appBarTheme: AppBarTheme(
      backgroundColor: schema.surface,
      foregroundColor: schema.onSurface,
      elevation: 0,
      scrolledUnderElevation: 0,
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        backgroundColor: schema.secondary,
        foregroundColor: schema.onSecondary,
        minimumSize: const Size(88, 48),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Rayons.m),
        ),
        textStyle: const TextStyle(
          fontFamily: _police,
          fontWeight: FontWeight.w600,
        ),
      ),
    ),
  );
}
