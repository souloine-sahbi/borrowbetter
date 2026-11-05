import 'package:borrowbetter/src/shared/theme/dimensions.dart';
import 'package:flutter/material.dart';

class LogoMarque extends StatelessWidget {
  const new({this.hauteur = 88, super.key});

  final double hauteur;

  @override
  Widget build(BuildContext context) {
    final schema = Theme.of(context).colorScheme;
    final style = Theme.of(context).textTheme.headlineSmall
        ?.copyWith(fontWeight: FontWeight.w700);
    return Column(
      children: [
        Image.asset(
          'assets/images/logo_icone.png',
          height: hauteur,
          semanticLabel: 'BorrowBetter',
        ),
        const SizedBox(height: Espacements.s),
        Text.rich(
          TextSpan(
            style: style,
            children: [
              TextSpan(
                text: 'Borrow',
                style: TextStyle(color: schema.primary),
              ),
              TextSpan(
                text: 'Better',
                style: TextStyle(color: schema.secondary),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
