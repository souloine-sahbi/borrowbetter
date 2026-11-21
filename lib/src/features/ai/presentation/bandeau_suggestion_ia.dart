import 'package:borrowbetter/src/shared/l10n/app_localizations.dart';
import 'package:borrowbetter/src/shared/theme/dimensions.dart';
import 'package:flutter/material.dart';

class BandeauSuggestionIA extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return DecoratedBox(
      decoration: BoxDecoration(
        color: scheme.tertiaryContainer,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(Espacements.m),
        child: Row(
          children: [
            Icon(Icons.auto_awesome, color: scheme.onTertiaryContainer),
            const SizedBox(width: Espacements.s),
            Expanded(
              child: Text(
                AppLocalizations.of(context).iaBandeau,
                style: Theme.of(context).textTheme.bodyMedium
                    ?.copyWith(color: scheme.onTertiaryContainer),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
