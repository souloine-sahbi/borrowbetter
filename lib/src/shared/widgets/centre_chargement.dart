import 'package:flutter/material.dart';

/// Indicateur de chargement centré.
class CentreChargement extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator());
  }
}
