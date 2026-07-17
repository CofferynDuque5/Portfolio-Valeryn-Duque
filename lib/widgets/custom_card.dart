import 'package:flutter/material.dart';
import '../themes/app_theme.dart';

// Tarjeta calida reutilizable con el icono dentro de un cuadro con borde de acento
class CustomCard extends StatelessWidget {
  final IconData icono;
  final String titulo;
  final String descripcion;
  final Color acento;
  const CustomCard({
    super.key,
    required this.icono,
    required this.titulo,
    required this.descripcion,
    this.acento = AppColors.co,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: AppColors.line),
        boxShadow: const [
          BoxShadow(color: Color(0x14000000), offset: Offset(0, 10), blurRadius: 24),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 44,
            height: 44,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: acento, width: 1.5),
            ),
            child: Icon(icono, color: acento, size: 22),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(titulo, style: AppTheme.heading(18)),
                const SizedBox(height: 6),
                Text(descripcion, style: const TextStyle(color: AppColors.mut, height: 1.5)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
