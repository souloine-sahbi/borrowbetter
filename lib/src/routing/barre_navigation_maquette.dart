import 'package:borrowbetter/src/shared/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

/// Barre à cinq éléments d'après la maquette : le « + » central est une
/// action (publier), pas une destination.
class BarreNavigationMaquette extends StatelessWidget {
  const new({
    required this.indexCourant,
    required this.onSelection,
    required this.onAjouter,
    super.key,
  });

  /// Index de la branche active : 0 accueil, 1 recherche, 2 demandes, 3 profil.
  final int indexCourant;
  final ValueChanged<int> onSelection;
  final VoidCallback onAjouter;

  @override
  Widget build(BuildContext context) {
    final textes = AppLocalizations.of(context);
    final scheme = Theme.of(context).colorScheme;
    return Material(
      color: scheme.surface,
      elevation: 3,
      child: SafeArea(
        top: false,
        child: SizedBox(
          height: 64,
          child: Row(
            children: [
              _ElementBarre(
                icone: Icons.home_outlined,
                iconeActive: Icons.home,
                libelle: textes.barreAccueil,
                actif: indexCourant == 0,
                onTap: () => onSelection(0),
              ),
              _ElementBarre(
                icone: Icons.search,
                iconeActive: Icons.search,
                libelle: textes.barreRecherche,
                actif: indexCourant == 1,
                onTap: () => onSelection(1),
              ),
              Expanded(
                child: Center(
                  child: _BoutonAjouter(
                    libelle: textes.barreAjouter,
                    onTap: onAjouter,
                  ),
                ),
              ),
              _ElementBarre(
                icone: Icons.swap_horiz,
                iconeActive: Icons.swap_horiz,
                libelle: textes.barreDemandes,
                actif: indexCourant == 2,
                onTap: () => onSelection(2),
              ),
              _ElementBarre(
                icone: Icons.person_outline,
                iconeActive: Icons.person,
                libelle: textes.barreProfil,
                actif: indexCourant == 3,
                onTap: () => onSelection(3),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ElementBarre extends StatelessWidget {
  const new({
    required this.icone,
    required this.iconeActive,
    required this.libelle,
    required this.actif,
    required this.onTap,
  });

  final IconData icone;
  final IconData iconeActive;
  final String libelle;
  final bool actif;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final couleur = actif
        ? theme.colorScheme.primary
        : theme.colorScheme.onSurfaceVariant;
    return Expanded(
      child: Semantics(
        button: true,
        selected: actif,
        label: libelle,
        child: ExcludeSemantics(
          child: InkWell(
            onTap: onTap,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(actif ? iconeActive : icone, color: couleur),
                const SizedBox(height: 2),
                Text(
                  libelle,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.labelSmall?.copyWith(color: couleur),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _BoutonAjouter extends StatelessWidget {
  const new({required this.libelle, required this.onTap});

  final String libelle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Semantics(
      button: true,
      label: libelle,
      child: Tooltip(
        message: libelle,
        child: Material(
          color: scheme.primary,
          shape: const CircleBorder(),
          elevation: 2,
          child: InkWell(
            customBorder: const CircleBorder(),
            onTap: onTap,
            child: SizedBox(
              width: 52,
              height: 52,
              child: Icon(Icons.add, color: scheme.onPrimary, size: 28),
            ),
          ),
        ),
      ),
    );
  }
}
