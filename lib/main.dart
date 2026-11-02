import 'package:borrowbetter/firebase_options.dart';
import 'package:borrowbetter/src/routing/routeur.dart';
import 'package:borrowbetter/src/shared/l10n/app_localizations.dart';
import 'package:borrowbetter/src/shared/l10n/langue_controleur.dart';
import 'package:borrowbetter/src/shared/theme/theme.dart';
import 'package:borrowbetter/src/shared/theme/theme_controleur.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  final preferences = await SharedPreferences.getInstance();
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
