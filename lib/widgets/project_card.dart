import 'package:flutter/material.dart';
import '../models/project.dart';
import '../themes/app_theme.dart';
import 'tech_chips.dart';

// Tarjeta de proyecto para listas: monograma, categoria, nombre, lema y chips
class ProjectCard extends StatelessWidget {
  final Project proyecto;
  final VoidCallback onTap;
  const ProjectCard({super.key, required this.proyecto, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final acento = proyecto.acentoVerde ? AppColors.gr : AppColors.co;
    return Semantics(
      button: true,
      label: 'Ver proyecto ${proyecto.nombre}',
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          margin: const EdgeInsets.only(bottom: 14),
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            color: AppColors.card,
            borderRadius: BorderRadius.circular(18),
            border: Border.all(color: AppColors.line),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 48,
                height: 48,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: AppColors.card2,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: acento, width: 1.5),
                ),
                child: Text(proyecto.iniciales,
                    style: AppTheme.heading(16).copyWith(color: acento)),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(proyecto.frame.etiqueta.toUpperCase(),
                        style: AppTheme.mono(10, color: acento)),
                    const SizedBox(height: 4),
                    Text(proyecto.nombre, style: AppTheme.heading(18)),
                    const SizedBox(height: 6),
                    Text(proyecto.lema,
                        style:
                            const TextStyle(color: AppColors.mut, height: 1.5)),
                    const SizedBox(height: 10),
                    TechChips(tecnologias: proyecto.tecnologias),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 8, top: 2),
                child: Icon(Icons.arrow_forward_ios,
                    size: 14, color: AppColors.dim),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
