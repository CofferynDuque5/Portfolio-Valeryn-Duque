import 'package:flutter/material.dart';

// Paleta identica a la web (calida y minimalista)
class AppColors {
  static const bg = Color(0xFFF4ECDD);    // fondo crema
  static const card = Color(0xFFFFFDF8);   // tarjetas
  static const card2 = Color(0xFFFBF4E7);
  static const ink = Color(0xFF33291F);    // texto principal
  static const mut = Color(0xFF6F6355);    // texto secundario
  static const dim = Color(0xFFA99A85);    // texto tenue
  static const co = Color(0xFFD65A3B);     // terracota (acento)
  static const coD = Color(0xFFC4502F);
  static const gr = Color(0xFF5A7358);     // verde salvia (acento 2)
  static const line = Color(0x1A33291F);   // lineas y bordes sutiles
}

class AppTheme {
  static ThemeData get light {
    final base = ThemeData(useMaterial3: true, brightness: Brightness.light);
    return base.copyWith(
      scaffoldBackgroundColor: AppColors.bg,
      colorScheme: base.colorScheme.copyWith(
        primary: AppColors.co,
        secondary: AppColors.gr,
        surface: AppColors.card,
      ),
      // Texto con la fuente del sistema, en color tinta
      textTheme: base.textTheme.apply(
        bodyColor: AppColors.ink,
        displayColor: AppColors.ink,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.bg,
        foregroundColor: AppColors.ink,
        elevation: 0,
        centerTitle: false,
      ),
    );
  }

  // Titulos grandes (fuente del sistema, en negrita)
  static TextStyle heading(double size) => TextStyle(
        fontSize: size,
        fontWeight: FontWeight.w700,
        color: AppColors.ink,
        height: 1.05,
      );

  // Etiquetas tipo codigo (mas espaciado entre letras)
  static TextStyle mono(double size, {Color color = AppColors.coD}) => TextStyle(
        fontSize: size,
        color: color,
        letterSpacing: 1.0,
        fontWeight: FontWeight.w500,
      );
}
