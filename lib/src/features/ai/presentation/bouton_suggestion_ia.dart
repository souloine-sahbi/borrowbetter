import 'package:borrowbetter/src/features/ai/domain/suggestion_annonce.dart';
import 'package:borrowbetter/src/features/ai/presentation/ia_providers.dart';
import 'package:borrowbetter/src/features/auth/presentation/decoration_champ.dart';
import 'package:borrowbetter/src/shared/l10n/app_localizations.dart';
import 'package:borrowbetter/src/shared/theme/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BoutonSuggestionIA extends ConsumerStatefulWidget {
  const new({
    required this.cheminPhoto,
    required this.langue,
    required this.onSuggestion,
    super.key,
  });

  /// Première photo choisie ; null tant qu'aucune photo n'est ajoutée.
  final String? cheminPhoto;
  final String langue;
  final ValueChanged<SuggestionAnnonce> onSuggestion;

  @override
  ConsumerState<BoutonSuggestionIA> createState() => _EtatBoutonSuggestionIA();
}

class _EtatBoutonSuggestionIA extends ConsumerState<BoutonSuggestionIA> {
  final _indice = TextEditingController();

  @override
  void dispose() {
    _indice.dispose();
    super.dispose();
  }

  Future<bool> _consentement() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.getBool('ia_consentement') ?? false) return true;
    if (!mounted) return false;
    final textes = AppLocalizations.of(context);
    final accepte = await showDialog<bool>(
      context: context,
      builder: (dialogue) => AlertDialog(
        title: Text(textes.iaConfidTitre),
        content: Text(textes.iaConfidTexte),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogue).pop(false),
            child: Text(textes.iaRefuser),
          ),
          FilledButton(
            onPressed: () => Navigator.of(dialogue).pop(true),
            child: Text(textes.iaAccepter),
          ),
        ],
      ),
    );
    if (accepte ?? false) await prefs.setBool('ia_consentement', true);
    return accepte ?? false;
  }

  Future<void> _analyser() async {
    final chemin = widget.cheminPhoto;
    if (chemin == null) return;
    if (!await _consentement() || !mounted) return;
    FocusScope.of(context).unfocus();
    await ref
        .read(suggestionIAProvider.notifier)
        .analyser(
          cheminPhoto: chemin,
          indice: _indice.text,
          langue: widget.langue,
        );
  }

  @override
  Widget build(BuildContext context) {
    final textes = AppLocalizations.of(context);
    final etat = ref.watch(suggestionIAProvider);

    ref.listen(suggestionIAProvider, (avant, apres) {
      if (apres is AsyncError) {
        debugPrint('IA erreur : ${apres.error}');
        debugPrintStack(stackTrace: apres.stackTrace, maxFrames: 5);
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(textes.iaEchec)));
        return;
      }
      final suggestion = apres.value;
      if ((avant?.isLoading ?? false) && suggestion != null) {
        widget.onSuggestion(suggestion);
      }
    });

    final aPhoto = widget.cheminPhoto != null;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextField(
          controller: _indice,
          maxLength: 100,
          decoration: decorationChamp(
            libelle: textes.iaIndice,
            icone: Icons.edit_note,
          ),
        ),
        const SizedBox(height: Espacements.s),
        OutlinedButton.icon(
          onPressed: (!aPhoto || etat.isLoading) ? null : _analyser,
          icon: etat.isLoading
              ? const SizedBox(
                  width: 18,
                  height: 18,
                  child: CircularProgressIndicator(strokeWidth: 2),
                )
              : const Icon(Icons.auto_awesome),
          label: Text(aPhoto ? textes.iaBouton : textes.iaPhotoRequise),
        ),
      ],
    );
  }
}
