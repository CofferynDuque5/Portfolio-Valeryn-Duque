import 'package:flutter/material.dart';
import '../data/projects_data.dart';
import '../models/project.dart';
import '../routes/app_routes.dart';
import '../themes/app_theme.dart';
import '../widgets/custom_footer.dart';
import '../widgets/project_card.dart';
import '../widgets/section_header.dart';

// Archivo completo de proyectos con filtros por categoria (como en la web)
class ProjectsScreen extends StatefulWidget {
  const ProjectsScreen({super.key});

  @override
  State<ProjectsScreen> createState() => _ProjectsScreenState();
}

class _ProjectsScreenState extends State<ProjectsScreen> {
  ProjectCategory? _filtro; // null = todos

  Widget _chip(String texto, ProjectCategory? categoria) {
    final activo = _filtro == categoria;
    return Semantics(
      selected: activo,
      button: true,
      child: GestureDetector(
        onTap: () => setState(() => _filtro = categoria),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          decoration: BoxDecoration(
            color: activo ? AppColors.ink : AppColors.card,
            borderRadius: BorderRadius.circular(100),
            border: Border.all(color: activo ? AppColors.ink : AppColors.line),
          ),
          child: Text(
            texto,
            style: TextStyle(
              color: activo ? AppColors.card : AppColors.ink,
              fontWeight: FontWeight.w600,
              fontSize: 13,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final proyectos = ProjectsData.porCategoria(_filtro);
    return Scaffold(
      appBar: AppBar(title: Text('Proyectos', style: AppTheme.heading(18))),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const SectionHeader(
            kicker: '// 04 - proyectos',
            titulo: 'De apps moviles a sistemas web y laboratorios.',
          ),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              _chip('Todos', null),
              for (final c in ProjectCategory.values) _chip(c.etiqueta, c),
            ],
          ),
          const SizedBox(height: 20),
          Text('${proyectos.length} PROYECTOS',
              style: AppTheme.mono(11, color: AppColors.dim)),
          const SizedBox(height: 12),
          for (final p in proyectos)
            ProjectCard(
              proyecto: p,
              onTap: () =>
                  Navigator.pushNamed(context, AppRoutes.projectDetail(p.slug)),
            ),
          const CustomFooter(),
        ],
      ),
    );
  }
}
