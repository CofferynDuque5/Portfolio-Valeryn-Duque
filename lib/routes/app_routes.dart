// Guardamos los nombres de las rutas en un solo lugar para no repetirlos
class AppRoutes {
  static const home = '/';
  static const about = '/about';
  static const hobbies = '/hobbies';
  static const contact = '/contact';
  static const projects = '/projects';

  // Detalle de un proyecto: /projects/<slug>
  static String projectDetail(String slug) => '$projects/$slug';

  // Devuelve el slug si la ruta es de detalle de proyecto, si no null
  static String? slugDeRuta(String? ruta) {
    if (ruta == null || !ruta.startsWith('$projects/')) return null;
    final slug = ruta.substring(projects.length + 1);
    return slug.isEmpty || slug.contains('/') ? null : slug;
  }
}
