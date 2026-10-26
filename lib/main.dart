import 'package:borrowbetter/firebase_options.dart';
import 'package:borrowbetter/src/shared/theme/dimensions.dart';
import 'package:borrowbetter/src/shared/theme/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const ProviderScope(child: BorrowBetterApp()));
}

class BorrowBetterApp extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: construireTheme(Brightness.light),
      darkTheme: construireTheme(Brightness.dark),
      home: const _ApercuTheme(),
    );
  }
}

class _ApercuTheme extends StatelessWidget {
  const new();

  @override
  Widget build(BuildContext context) {
    final textes = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(title: const Text('BorrowBetter')),
      body: Padding(
        padding: const EdgeInsets.all(Espacements.l),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Titre', style: textes.headlineMedium),
            const SizedBox(height: Espacements.s),
            Text('Texte courant du thème.', style: textes.bodyLarge),
            const SizedBox(height: Espacements.xl),
            FilledButton(onPressed: () {}, child: const Text('Bouton')),
          ],
        ),
      ),
    );
  }
}
