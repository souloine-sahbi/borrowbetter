import 'package:borrowbetter/src/features/auth/presentation/decoration_champ.dart';
import 'package:flutter/material.dart';

class ChampMotDePasse extends StatefulWidget {
  const new({
    required this.controleur,
    required this.libelle,
    this.validateur,
    this.onChanged,
    super.key,
  });

  final TextEditingController controleur;
  final String libelle;
  final String? Function(String?)? validateur;
  final ValueChanged<String>? onChanged;

  @override
  State<ChampMotDePasse> createState() => _EtatChampMotDePasse();
}

class _EtatChampMotDePasse extends State<ChampMotDePasse> {
  var _masque = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controleur,
      obscureText: _masque,
      onChanged: widget.onChanged,
      validator: widget.validateur,
      decoration: decorationChamp(
        libelle: widget.libelle,
        icone: Icons.lock_outline,
        suffixe: IconButton(
          icon: Icon(
            _masque ? Icons.visibility_outlined : Icons.visibility_off_outlined,
          ),
          onPressed: () => setState(() => _masque = !_masque),
        ),
      ),
    );
  }
}
