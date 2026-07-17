import 'package:flutter/material.dart';
import '../themes/app_theme.dart';

// Monograma 'VD' con borde terracota y sombra solida verde
// (el detalle brutalista suave que se repite en la web)
class Monogram extends StatelessWidget {
  final double size;
  const Monogram({super.key, this.size = 48});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.co, width: 2),
        boxShadow: const [
          BoxShadow(color: AppColors.gr, offset: Offset(4, 4), blurRadius: 0),
        ],
      ),
      child: Text('VD', style: AppTheme.heading(size * 0.4).copyWith(color: AppColors.co)),
    );
  }
}
