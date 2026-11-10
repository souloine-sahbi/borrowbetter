import 'dart:io';

import 'package:borrowbetter/src/shared/l10n/app_localizations.dart';
import 'package:borrowbetter/src/shared/theme/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

/// Choix des photos d'un objet : vignettes, ajout, retrait.
///
/// L'état (la liste des chemins) appartient au parent.
class SelecteurPhotos extends StatelessWidget {
  const new({
    required this.chemins,
    required this.onChanged,
    this.maximum = 3,
    super.key,
  });

  final List<String> chemins;
  final ValueChanged<List<String>> onChanged;
  final int maximum;

  Future<void> _ajouter(BuildContext context) async {
    final restant = maximum - chemins.length;
    if (restant <= 0) return;
    // Réduit la taille avant l'envoi : photos plus rapides à téléverser.
    final choisies = await ImagePicker().pickMultiImage(
      maxWidth: 1600,
      imageQuality: 80,
    );
    if (choisies.isEmpty || !context.mounted) return;
    onChanged([...chemins, for (final f in choisies.take(restant)) f.path]);
  }

  @override
  Widget build(BuildContext context) {
    final textes = AppLocalizations.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (chemins.isNotEmpty) ...[
          SizedBox(
            height: _Vignette.taille,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: chemins.length,
              separatorBuilder: (_, _) => const SizedBox(width: Espacements.s),
              itemBuilder: (context, index) => _Vignette(
                chemin: chemins[index],
                libelleRetirer: textes.photosRetirer,
                onRetirer: () => onChanged([...chemins]..removeAt(index)),
              ),
            ),
          ),
          const SizedBox(height: Espacements.s),
        ],
        OutlinedButton.icon(
          onPressed: chemins.length >= maximum ? null : () => _ajouter(context),
          icon: const Icon(Icons.add_photo_alternate_outlined),
          label: Text(textes.photosAjouter),
        ),
      ],
    );
  }
}

class _Vignette extends StatelessWidget {
  const new({
    required this.chemin,
    required this.libelleRetirer,
    required this.onRetirer,
  });

  static const taille = 96.0;

  final String chemin;
  final String libelleRetirer;
  final VoidCallback onRetirer;

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: taille,
      child: Stack(
        fit: StackFit.expand,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(Espacements.s),
            child: Image.file(File(chemin), fit: BoxFit.cover),
          ),
          PositionedDirectional(
            top: 0,
            end: 0,
            child: IconButton.filledTonal(
              tooltip: libelleRetirer,
              icon: const Icon(Icons.close),
              onPressed: onRetirer,
            ),
          ),
        ],
      ),
    );
  }
}
