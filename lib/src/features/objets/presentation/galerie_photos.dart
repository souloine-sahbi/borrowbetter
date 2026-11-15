import 'package:borrowbetter/src/shared/theme/dimensions.dart';
import 'package:flutter/material.dart';

/// Photos d'un objet, à faire défiler, avec des points d'avancement.
///
/// Remplit l'espace que le parent lui donne : c'est lui qui décide de la
/// taille. La première photo porte l'étiquette [heroTag] : elle prolonge
/// l'animation partie de la carte de la liste.
class GaleriePhotos extends StatefulWidget {
  const new({
    required this.photos,
    this.heroTag,
    this.ajustement = BoxFit.cover,
    this.margeBasse = 0,
    super.key,
  });

  final List<String> photos;
  final Object? heroTag;

  /// [BoxFit.cover] remplit tout l'espace, [BoxFit.contain] montre la photo
  /// entière.
  final BoxFit ajustement;

  /// Espace sous les points d'avancement, pour qu'un élément qui recouvre le
  /// bas de la galerie ne les cache pas.
  final double margeBasse;

  @override
  State<GaleriePhotos> createState() => _EtatGaleriePhotos();
}

class _EtatGaleriePhotos extends State<GaleriePhotos> {
  final _controleur = PageController();
  var _page = 0;

  @override
  void dispose() {
    _controleur.dispose();
    super.dispose();
  }

  Widget _avecHero(int index, Widget enfant) {
    final etiquette = widget.heroTag;
    if (index != 0 || etiquette == null) return enfant;
    return Hero(tag: etiquette, child: enfant);
  }

  @override
  Widget build(BuildContext context) {
    final photos = widget.photos;
    if (photos.isEmpty) return _avecHero(0, const _PhotoAbsente());

    return Stack(
      fit: StackFit.expand,
      children: [
        PageView.builder(
          controller: _controleur,
          itemCount: photos.length,
          onPageChanged: (page) => setState(() => _page = page),
          itemBuilder: (context, index) => _avecHero(
            index,
            Image.network(
              photos[index],
              fit: widget.ajustement,
              errorBuilder: (_, _, _) => const _PhotoAbsente(),
            ),
          ),
        ),
        if (photos.length > 1)
          PositionedDirectional(
            bottom: widget.margeBasse,
            start: 0,
            end: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (var i = 0; i < photos.length; i++)
                  _Point(actif: i == _page),
              ],
            ),
          ),
      ],
    );
  }
}

class _Point extends StatelessWidget {
  const new({required this.actif});

  final bool actif;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Espacements.s / 2),
      child: SizedBox.square(
        dimension: 8,
        child: DecoratedBox(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: actif ? scheme.secondary : scheme.outlineVariant,
          ),
        ),
      ),
    );
  }
}

class _PhotoAbsente extends StatelessWidget {
  const new();

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Center(
      child: Icon(Icons.image_outlined, color: scheme.onSurfaceVariant),
    );
  }
}
