import 'package:flutter/material.dart';
import '../themes/app_theme.dart';

// Etiquetas pequenas con las tecnologias de un proyecto
class TechChips extends StatelessWidget {
  final List<String> tecnologias;
  const TechChips({super.key, required this.tecnologias});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 6,
      runSpacing: 6,
      children: [
        for (final t in tecnologias)
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: AppColors.card2,
              borderRadius: BorderRadius.circular(100),
              border: Border.all(color: AppColors.line),
            ),
            child: Text(t, style: AppTheme.mono(10, color: AppColors.mut)),
          ),
      ],
    );
  }
}
