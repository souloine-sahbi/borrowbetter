import 'package:borrowbetter/src/shared/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class BoutonGoogle extends StatelessWidget {
  const new({this.onPressed, super.key});

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 48,
      child: OutlinedButton.icon(
        onPressed: onPressed,
        icon: const Icon(Icons.g_mobiledata, size: 30),
        label: Text(AppLocalizations.of(context).authContinuerGoogle),
      ),
    );
  }
}
