import 'package:flutter/material.dart';
import '../themes/app_theme.dart';

// Boton terracota con sombra solida verde (identico a los CTA de la web)
class AccentButton extends StatelessWidget {
  final String texto;
  final IconData icono;
  final VoidCallback onTap;
  const AccentButton({
    super.key,
    required this.texto,
    required this.icono,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
        decoration: BoxDecoration(
          color: AppColors.co,
          borderRadius: BorderRadius.circular(14),
          boxShadow: const [
            BoxShadow(color: AppColors.gr, offset: Offset(4, 4), blurRadius: 0),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              texto,
              style: const TextStyle(
                color: Color(0xFFFFF7EC),
                fontWeight: FontWeight.w700,
                fontSize: 15,
              ),
            ),
            const SizedBox(width: 8),
            Icon(icono, color: const Color(0xFFFFF7EC), size: 18),
          ],
        ),
      ),
    );
  }
}
