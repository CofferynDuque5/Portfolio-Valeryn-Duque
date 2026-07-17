import 'package:flutter/material.dart';
import '../themes/app_theme.dart';
import '../widgets/section_header.dart';
import '../widgets/custom_footer.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  // Bloque de texto con una etiqueta de acento arriba (estilo secciones web)
  Widget _bloque(String etiqueta, String titulo, String cuerpo, Color acento) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: AppColors.line),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(etiqueta.toUpperCase(), style: AppTheme.mono(11, color: acento)),
          const SizedBox(height: 8),
          Text(titulo, style: AppTheme.heading(22)),
          const SizedBox(height: 10),
          Text(cuerpo, style: const TextStyle(color: AppColors.mut, height: 1.6)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sobre mi', style: AppTheme.heading(18))),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const SectionHeader(
            kicker: '// 01 - el nucleo',
            titulo: 'Rigor de ingenieria, calidez creativa.',
          ),
          _bloque(
            'Quien soy',
            'Quien soy',
            'Hola! Soy Valeryn, estudiante de Ingenieria de Sistemas y '
            'desarrollador web/movil autodidacta. Me apasiona construir soluciones '
            'digitales que combinen una logica de backend solida con interfaces '
            'modernas y funcionales.',
            AppColors.co,
          ),
          _bloque(
            'Que hago',
            'Que hago',
            'Me dedico al desarrollo de software y a la gestion de proyectos de '
            'e-commerce. Construyo aplicaciones web con Next.js y Astro, integrando '
            'bases de datos PostgreSQL y servicios como Firebase. Tambien trabajo la '
            'identidad visual de marcas independientes.',
            AppColors.gr,
          ),
          const CustomFooter(),
        ],
      ),
    );
  }
}
