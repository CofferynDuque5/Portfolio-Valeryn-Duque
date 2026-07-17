import 'package:flutter/material.dart';
import '../themes/app_theme.dart';
import '../widgets/section_header.dart';
import '../widgets/custom_card.dart';
import '../widgets/custom_footer.dart';

class HobbiesScreen extends StatelessWidget {
  const HobbiesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Hobbies', style: AppTheme.heading(18))),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: const [
          SectionHeader(
            kicker: '// 02 - fuera del codigo',
            titulo: 'Lo que me mantiene inspirado.',
          ),
          CustomCard(
            icono: Icons.music_note,
            titulo: 'Musica',
            descripcion: 'Canto y aprendo a dominar la guitarra en mis tiempos libres.',
            acento: AppColors.co,
          ),
          CustomCard(
            icono: Icons.fitness_center,
            titulo: 'Deportes',
            descripcion: 'Hago ejercicio a diario para mantener la mente enfocada.',
            acento: AppColors.gr,
          ),
          CustomCard(
            icono: Icons.storefront,
            titulo: 'Marcas independientes',
            descripcion: 'Doy vida a proyectos propios, del diseno a la base de datos.',
            acento: AppColors.co,
          ),
          CustomFooter(),
        ],
      ),
    );
  }
}
