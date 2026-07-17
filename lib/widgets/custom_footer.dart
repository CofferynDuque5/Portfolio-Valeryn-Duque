import 'package:flutter/material.dart';
import '../themes/app_theme.dart';
import 'monogram.dart';

// Pie de pagina con el monograma y la firma (como el footer de la web)
class CustomFooter extends StatelessWidget {
  const CustomFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 26),
      child: Column(
        children: [
          const Divider(color: AppColors.line),
          const SizedBox(height: 16),
          const Monogram(size: 36),
          const SizedBox(height: 10),
          Text(
            'Valeryn · Isla de Margarita · 2026',
            style: AppTheme.mono(11, color: AppColors.dim),
          ),
        ],
      ),
    );
  }
}
