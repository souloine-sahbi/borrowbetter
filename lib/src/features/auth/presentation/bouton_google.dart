import 'package:borrowbetter/src/features/auth/data/depot_auth.dart';
import 'package:borrowbetter/src/features/auth/presentation/message_erreur_auth.dart';
import 'package:borrowbetter/src/shared/l10n/app_localizations.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BoutonGoogle extends ConsumerStatefulWidget {
  const new({super.key});

  @override
  ConsumerState<BoutonGoogle> createState() => _EtatBoutonGoogle();
}

class _EtatBoutonGoogle extends ConsumerState<BoutonGoogle> {
  var _enChargement = false;

  static const _annulations = {
    'canceled',
    'web-context-canceled',
    'popup-closed-by-user',
  };

  Future<void> _connecter() async {
    if (_enChargement) return;
    final textes = AppLocalizations.of(context);
    final messager = ScaffoldMessenger.of(context);
    setState(() => _enChargement = true);
    try {
      await ref.read(depotAuthProvider).connexionGoogle();
    } on FirebaseAuthException catch (e) {
      if (!mounted || _annulations.contains(e.code)) return;
      messager.showSnackBar(
        SnackBar(content: Text(messageErreurAuth(textes, e))),
      );
    } finally {
      if (mounted) setState(() => _enChargement = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 48,
      child: OutlinedButton.icon(
        onPressed: _enChargement ? null : _connecter,
        icon: _enChargement
            ? const SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(strokeWidth: 2),
              )
            : const Icon(Icons.g_mobiledata, size: 30),
        label: Text(AppLocalizations.of(context).authContinuerGoogle),
      ),
    );
  }
}
