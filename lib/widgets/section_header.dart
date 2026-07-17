import 'package:flutter/material.dart';
import '../themes/app_theme.dart';

// Encabezado de seccion: etiqueta mono pequena + titulo grande (como en la web)
class SectionHeader extends StatelessWidget {
  final String kicker;
  final String titulo;
  const SectionHeader({super.key, required this.kicker, required this.titulo});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(kicker.toUpperCase(), style: AppTheme.mono(12)),
        const SizedBox(height: 8),
        Text(titulo, style: AppTheme.heading(26)),
        const SizedBox(height: 20),
      ],
    );
  }
}
