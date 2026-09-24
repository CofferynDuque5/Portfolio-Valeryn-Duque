import 'package:flutter/material.dart';
import 'routes/app_routes.dart';
import 'themes/app_theme.dart';
import 'screens/home_screen.dart';
import 'screens/about_screen.dart';
import 'screens/hobbies_screen.dart';
import 'screens/contact_screen.dart';
import 'screens/projects_screen.dart';
import 'screens/project_detail_screen.dart';
import 'data/projects_repository.dart';
import 'models/project.dart';

void main() {
  runApp(const MyApp());
  // Carga en segundo plano los proyectos publicados (si hay API configurada)
  ProjectsRepository.instancia.refrescar();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Portafolio Valeryn',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      initialRoute: AppRoutes.home,
      // Conectamos cada nombre de ruta con su pantalla
      routes: {
        AppRoutes.home: (context) => const HomeScreen(),
        AppRoutes.about: (context) => const AboutScreen(),
        AppRoutes.hobbies: (context) => const HobbiesScreen(),
        AppRoutes.contact: (context) => const ContactScreen(),
        AppRoutes.projects: (context) => const ProjectsScreen(),
      },
      // Rutas con parametro: /projects/<slug>. Si el slug no existe,
      // mostramos el archivo completo de proyectos. Se reconstruye cuando
      // llegan los datos de la API, por si el slug solo existe alli.
      onGenerateRoute: (settings) {
        final slug = AppRoutes.slugDeRuta(settings.name);
        if (slug == null) return null;
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => ValueListenableBuilder<List<Project>>(
            valueListenable: ProjectsRepository.instancia.proyectos,
            builder: (context, proyectos, _) {
              final proyecto = proyectos.porSlug(slug);
              return proyecto == null
                  ? const ProjectsScreen()
                  : ProjectDetailScreen(proyecto: proyecto);
            },
          ),
        );
      },
    );
  }
}
