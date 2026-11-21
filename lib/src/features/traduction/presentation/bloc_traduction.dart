import 'package:borrowbetter/src/features/traduction/domain/objet_traduit.dart';
import 'package:borrowbetter/src/features/traduction/presentation/traduction_providers.dart';
import 'package:borrowbetter/src/shared/l10n/app_localizations.dart';
import 'package:borrowbetter/src/shared/theme/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BlocTraduction extends ConsumerStatefulWidget {
  const new({
    required this.titre,
    required this.description,
    required this.langueAnnonce,
    super.key,
  });

  final String titre;
  final String description;
  final String langueAnnonce;

  @override
  ConsumerState<BlocTraduction> createState() => _EtatBlocTraduction();
}

class _EtatBlocTraduction extends ConsumerState<BlocTraduction> {
  var _traduit = false;

  TextDirection _sens(String langue) =>
      langue == 'ar' ? TextDirection.rtl : TextDirection.ltr;

  Widget _texte(
    BuildContext context,
    String langue,
    String titre,
    String desc,
  ) {
    final theme = Theme.of(context);
    return SizedBox(
      width: double.infinity,
      child: Directionality(
        textDirection: _sens(langue),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              titre,
              style: theme.textTheme.titleLarge?.copyWith(
                color: theme.colorScheme.primary,
                fontWeight: FontWeight.w700,
              ),
            ),
            if (desc.isNotEmpty) ...[
              const SizedBox(height: Espacements.s),
              Text(desc, style: theme.textTheme.bodyLarge),
            ],
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final textes = AppLocalizations.of(context);
    final langueApp = Localizations.localeOf(context).languageCode;
    final original = _texte(
      context,
      widget.langueAnnonce,
      widget.titre,
      widget.description,
    );

    // Même langue : rien à traduire, pas de bouton.
    if (widget.langueAnnonce == langueApp) return original;

    if (!_traduit) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          original,
          TextButton.icon(
            onPressed: () => setState(() => _traduit = true),
            icon: const Icon(Icons.translate),
            label: Text(textes.traductionTraduire),
          ),
        ],
      );
    }

    final cle = (
      titre: widget.titre,
      description: widget.description,
      de: widget.langueAnnonce,
      vers: langueApp,
    );

    return FutureBuilder<ObjetTraduit>(
      future: ref.watch(traductionProvider(cle).future),
      builder: (context, instantane) {
        if (instantane.connectionState != ConnectionState.done) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              original,
              const SizedBox(height: Espacements.m),
              const Center(child: CircularProgressIndicator()),
            ],
          );
        }
        final resultat = instantane.data;
        if (instantane.hasError || resultat == null) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              original,
              const SizedBox(height: Espacements.s),
              Text(
                textes.traductionEchec,
                style: TextStyle(color: Theme.of(context).colorScheme.error),
              ),
              TextButton(
                onPressed: () {
                  ref.invalidate(traductionProvider(cle));
                  setState(() {});
                },
                child: Text(textes.traductionReessayer),
              ),
            ],
          );
        }
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _texte(context, langueApp, resultat.titre, resultat.description),
            const SizedBox(height: Espacements.s),
            Text(
              textes.traductionTraduitAuto,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
            ),
            TextButton(
              onPressed: () => setState(() => _traduit = false),
              child: Text(textes.traductionVoirOriginal),
            ),
          ],
        );
      },
    );
  }
}
