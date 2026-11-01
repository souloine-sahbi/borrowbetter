import 'package:borrowbetter/src/shared/l10n/langue_controleur.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SelecteurLangue extends ConsumerWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final actuelle = Localizations.localeOf(context).languageCode;
    return SegmentedButton<String>(
      showSelectedIcon: false,
      segments: const [
        ButtonSegment(value: 'fr', label: Text('Français')),
        ButtonSegment(value: 'en', label: Text('English')),
        ButtonSegment(value: 'ar', label: Text('العربية')),
      ],
      selected: {actuelle},
      onSelectionChanged: (choix) =>
          ref.read(langueProvider.notifier).choisir(choix.first),
    );
  }
}
