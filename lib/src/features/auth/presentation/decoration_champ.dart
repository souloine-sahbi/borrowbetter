import 'package:borrowbetter/src/shared/theme/dimensions.dart';
import 'package:flutter/material.dart';

InputDecoration decorationChamp({
  required String libelle,
  required IconData icone,
  Widget? suffixe,
}) {
  return InputDecoration(
    hintText: libelle,
    prefixIcon: Icon(icone),
    suffixIcon: suffixe,
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(Rayons.m)),
  );
}
