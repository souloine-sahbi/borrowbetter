import 'dart:async';

import 'package:borrowbetter/firebase_options.dart';
import 'package:borrowbetter/src/features/profil/presentation/providers/utilisateur_providers.dart';
import 'package:borrowbetter/src/routing/routeur.dart';
import 'package:borrowbetter/src/shared/l10n/app_localizations.dart';
import 'package:borrowbetter/src/shared/l10n/langue_controleur.dart';
import 'package:borrowbetter/src/shared/theme/theme.dart';
import 'package:borrowbetter/src/shared/theme/theme_controleur.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await FirebaseAppCheck.instance.activate(
    providerAndroid: const AndroidDebugProvider(),
  );
  final preferences = await SharedPreferences.getInstance();
  unawaited(MobileAds.instance.initialize());
  runApp(
    ProviderScope(
      overrides: [preferencesProvider.overrideWithValue(preferences)],
      child: const BorrowBetterApp(),
    ),
  );
}

class BorrowBetterApp extends ConsumerWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Crée le document users/{uid} au besoin et observe le profil connecté.
    ref.watch(utilisateurCourantProvider);
    return MaterialApp.router(
      onGenerateTitle: (context) => AppLocalizations.of(context).appTitre,
      theme: construireTheme(Brightness.light),
      darkTheme: construireTheme(Brightness.dark),
      themeMode: ref.watch(themeModeProvider),
      locale: ref.watch(langueProvider),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      routerConfig: ref.watch(routeurProvider),
    );
  }
}
