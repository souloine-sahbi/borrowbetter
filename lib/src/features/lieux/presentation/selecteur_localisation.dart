import 'package:borrowbetter/src/features/lieux/presentation/lieux_provider.dart';
import 'package:borrowbetter/src/shared/l10n/app_localizations.dart';
import 'package:borrowbetter/src/shared/theme/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SelecteurLocalisation extends ConsumerWidget {
  const new({
    required this.onChanged,
    this.gouvernoratId,
    this.villeId,
    this.obligatoire = true,
    super.key,
  });

  final String? gouvernoratId;
  final String? villeId;
  final bool obligatoire;
  final void Function(String? gouvernoratId, String? villeId) onChanged;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textes = AppLocalizations.of(context);
    final langue = Localizations.localeOf(context).languageCode;
    final lieux = ref.watch(lieuxProvider);

    return lieux.when(
      loading: () => const LinearProgressIndicator(),
      error: (erreur, trace) => Row(
        children: [
          Expanded(child: Text(textes.erreurChargement)),
          TextButton(
            onPressed: () => ref.invalidate(lieuxProvider),
            child: Text(textes.actionReessayer),
          ),
        ],
      ),
      data: (gouvernorats) {
        final gouvernoratsTries = [...gouvernorats]
          ..sort((a, b) => a.nom(langue).compareTo(b.nom(langue)));
        final villesTriees =
            gouvernorats
                .where((gouvernorat) => gouvernorat.id == gouvernoratId)
                .expand((gouvernorat) => gouvernorat.villes)
                .toList()
              ..sort((a, b) => a.nom(langue).compareTo(b.nom(langue)));

        String? valider(String? valeur) {
          if (obligatoire && valeur == null) {
            return textes.validationObligatoire;
          }
          return null;
        }

        return Column(
          children: [
            DropdownButtonFormField<String>(
              initialValue: gouvernoratId,
              isExpanded: true,
              decoration: _decoration(
                textes.lieuGouvernorat,
                Icons.map_outlined,
              ),
              items: [
                for (final gouvernorat in gouvernoratsTries)
                  DropdownMenuItem(
                    value: gouvernorat.id,
                    child: Text(gouvernorat.nom(langue)),
                  ),
              ],
              validator: valider,
              onChanged: (id) => onChanged(id, null),
            ),
            const SizedBox(height: Espacements.m),
            DropdownButtonFormField<String>(
              key: ValueKey(gouvernoratId),
              initialValue: villeId,
              isExpanded: true,
              decoration: _decoration(
                textes.lieuVille,
                Icons.location_city_outlined,
              ),
              items: [
                for (final ville in villesTriees)
                  DropdownMenuItem(
                    value: ville.id,
                    child: Text(ville.nom(langue)),
                  ),
              ],
              validator: valider,
              onChanged: gouvernoratId == null
                  ? null
                  : (id) => onChanged(gouvernoratId, id),
            ),
          ],
        );
      },
    );
  }
}

InputDecoration _decoration(String libelle, IconData icone) {
  return InputDecoration(
    labelText: libelle,
    prefixIcon: Icon(icone),
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(Rayons.m)),
  );
}
