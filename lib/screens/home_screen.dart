import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../data/projects_repository.dart';
import '../models/project.dart';
import '../routes/app_routes.dart';
import '../themes/app_theme.dart';
import '../widgets/accent_button.dart';
import '../widgets/custom_footer.dart';
import '../widgets/project_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  // Abre mi sitio web en el navegador
  Future<void> _abrirSitio() async {
    await launchUrl(
      Uri.parse('http://valerynduque.cofferynduque.com/'),
      mode: LaunchMode.externalApplication,
    );
  }

  // Tarjeta del menu para navegar a cada seccion
  Widget _menuItem(
      BuildContext context, IconData icono, String texto, String ruta) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, ruta),
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.card,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.line),
        ),
        child: Row(
          children: [
            Icon(icono, color: AppColors.gr),
            const SizedBox(width: 14),
            Expanded(child: Text(texto, style: AppTheme.heading(16))),
            const Icon(Icons.arrow_forward_ios, size: 16, color: AppColors.dim),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      appBar: AppBar(
        backgroundColor: AppColors.bg,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        title: Text('valeryn.dev', style: AppTheme.heading(18)),
        actions: [
          IconButton(
            icon: const Icon(Icons.alternate_email, color: AppColors.co),
            tooltip: 'Contacto',
            onPressed: () => Navigator.pushNamed(context, AppRoutes.contact),
          ),
          const SizedBox(width: 6),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const SizedBox(height: 8),
          // Enlace a mi sitio web (reemplaza el antiguo badge)
          Align(
            alignment: Alignment.centerLeft,
            child: GestureDetector(
              onTap: _abrirSitio,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                decoration: BoxDecoration(
                  color: const Color(0x17D65A3B),
                  borderRadius: BorderRadius.circular(100),
                  border: Border.all(color: const Color(0x47D65A3B)),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.language, size: 15, color: AppColors.co),
                    const SizedBox(width: 8),
                    Text('valerynduque.cofferynduque.com',
                        style: AppTheme.mono(11)),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          // Foto de perfil: borde terracota + sombra salvia
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.co, width: 3),
                boxShadow: const [
                  BoxShadow(
                      color: AppColors.gr, offset: Offset(4, 4), blurRadius: 0),
                ],
              ),
              child: CircleAvatar(
                radius: 52,
                backgroundColor: AppColors.card2,
                backgroundImage: const AssetImage('assets/perfil.jpg'),
                onBackgroundImageError: (_, __) {},
              ),
            ),
          ),
          const SizedBox(height: 22),
          Text('Valeryn Rouse Duque Valladares', style: AppTheme.heading(30)),
          const SizedBox(height: 8),
          Text('DESARROLLADORA FULL-STACK · ING. DE SISTEMAS',
              style: AppTheme.mono(11, color: AppColors.dim)),
          const SizedBox(height: 6),
          Text('@cofferyn', style: AppTheme.mono(12, color: AppColors.co)),
          const SizedBox(height: 16),
          const Text(
            'Estudiante de Ingenieria de Sistemas y desarrollador autodidacta. '
            'Construyo apps moviles y plataformas web con logica solida y una '
            'estetica moderna y limpia.',
            style: TextStyle(color: AppColors.mut, height: 1.6, fontSize: 15),
          ),
          const SizedBox(height: 22),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: [
              AccentButton(
                texto: 'Sobre mi',
                icono: Icons.arrow_forward,
                onTap: () => Navigator.pushNamed(context, AppRoutes.about),
              ),
              GestureDetector(
                onTap: () => Navigator.pushNamed(context, AppRoutes.contact),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                  decoration: BoxDecoration(
                    color: AppColors.card,
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(color: AppColors.line),
                  ),
                  child: const Text('Contacto',
                      style: TextStyle(
                          color: AppColors.ink,
                          fontWeight: FontWeight.w600,
                          fontSize: 15)),
                ),
              ),
            ],
          ),
          const SizedBox(height: 34),
          // Proyectos destacados (los marcados como destacados en la web)
          Row(
            children: [
              Expanded(
                child: Text('PROYECTOS DESTACADOS',
                    style: AppTheme.mono(11, color: AppColors.dim)),
              ),
              TextButton(
                onPressed: () =>
                    Navigator.pushNamed(context, AppRoutes.projects),
                child: Text('Ver todos', style: AppTheme.mono(11)),
              ),
            ],
          ),
          const SizedBox(height: 8),
          ValueListenableBuilder<List<Project>>(
            valueListenable: ProjectsRepository.instancia.proyectos,
            builder: (context, proyectos, _) => Column(
              children: [
                for (final p in proyectos.destacados)
                  ProjectCard(
                    proyecto: p,
                    onTap: () => Navigator.pushNamed(
                        context, AppRoutes.projectDetail(p.slug)),
                  ),
              ],
            ),
          ),
          const SizedBox(height: 22),
          Text('EXPLORA', style: AppTheme.mono(11, color: AppColors.dim)),
          const SizedBox(height: 12),
          _menuItem(
              context, Icons.work_outline, 'Proyectos', AppRoutes.projects),
          _menuItem(context, Icons.person_outline, 'Sobre mi', AppRoutes.about),
          _menuItem(context, Icons.music_note, 'Hobbies', AppRoutes.hobbies),
          _menuItem(
              context, Icons.email_outlined, 'Contacto', AppRoutes.contact),
          const CustomFooter(),
        ],
      ),
    );
  }
}
