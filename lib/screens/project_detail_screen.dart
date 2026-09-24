import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/project.dart';
import '../themes/app_theme.dart';
import '../widgets/custom_footer.dart';
import '../widgets/tech_chips.dart';

// Detalle de un proyecto: cabecera, descripcion, caracteristicas,
// tecnologias y enlaces (solo si el proyecto los tiene)
class ProjectDetailScreen extends StatelessWidget {
  final Project proyecto;
  const ProjectDetailScreen({super.key, required this.proyecto});

  Future<void> _abrir(String url) async {
    await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
  }

  // Cabecera con el monograma, o la formula en proyectos de laboratorio
  Widget _cabecera(Color acento) {
    final formula = proyecto.formula;
    return Container(
      width: double.infinity,
      height: 150,
      alignment: Alignment.center,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.card2,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: acento, width: 1.5),
        boxShadow: [
          BoxShadow(
              color: proyecto.acentoVerde ? AppColors.co : AppColors.gr,
              offset: const Offset(4, 4),
              blurRadius: 0),
        ],
      ),
      child: formula != null
          ? Text(formula,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: 'monospace',
                  fontSize: 16,
                  color: acento,
                  height: 1.4))
          : Text(proyecto.iniciales,
              style: AppTheme.heading(48).copyWith(color: acento)),
    );
  }

  Widget _enlace(IconData icono, String texto, String url) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: OutlinedButton.icon(
        onPressed: () => _abrir(url),
        icon: Icon(icono, size: 18, color: AppColors.co),
        label: Text(texto,
            style: const TextStyle(
                color: AppColors.ink, fontWeight: FontWeight.w600)),
        style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
          side: const BorderSide(color: AppColors.line),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final acento = proyecto.acentoVerde ? AppColors.gr : AppColors.co;
    final demo = proyecto.demoUrl;
    final github = proyecto.githubUrl;
    return Scaffold(
      appBar: AppBar(title: Text(proyecto.nombre, style: AppTheme.heading(18))),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          _cabecera(acento),
          const SizedBox(height: 24),
          Text(proyecto.frame.etiqueta.toUpperCase(),
              style: AppTheme.mono(11, color: acento)),
          const SizedBox(height: 8),
          Text(proyecto.nombre, style: AppTheme.heading(28)),
          const SizedBox(height: 10),
          Text(proyecto.lema,
              style: const TextStyle(
                  color: AppColors.ink, fontSize: 16, height: 1.5)),
          const SizedBox(height: 22),
          Text('CONTEXTO', style: AppTheme.mono(11, color: AppColors.dim)),
          const SizedBox(height: 8),
          Text(proyecto.descripcion,
              style: const TextStyle(color: AppColors.mut, height: 1.6)),
          if (proyecto.caracteristicas.isNotEmpty) ...[
            const SizedBox(height: 22),
            Text('CARACTERISTICAS',
                style: AppTheme.mono(11, color: AppColors.dim)),
            const SizedBox(height: 8),
            for (final c in proyecto.caracteristicas)
              Padding(
                padding: const EdgeInsets.only(bottom: 6),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 7, right: 10),
                      child: Container(width: 6, height: 6, color: acento),
                    ),
                    Expanded(
                        child: Text(c,
                            style: const TextStyle(
                                color: AppColors.ink, height: 1.5))),
                  ],
                ),
              ),
          ],
          const SizedBox(height: 22),
          Text('TECNOLOGIAS', style: AppTheme.mono(11, color: AppColors.dim)),
          const SizedBox(height: 10),
          TechChips(tecnologias: proyecto.tecnologias),
          if (demo != null || github != null) ...[
            const SizedBox(height: 26),
            Text('ENLACES', style: AppTheme.mono(11, color: AppColors.dim)),
            const SizedBox(height: 10),
            if (demo != null) _enlace(Icons.open_in_new, 'Ver demo', demo),
            if (github != null) _enlace(Icons.code, 'Ver codigo', github),
          ],
          const CustomFooter(),
        ],
      ),
    );
  }
}
