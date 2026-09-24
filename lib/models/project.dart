// Categorias de proyecto (mismos valores que usa la web: mobile | web | auto | eng)
enum ProjectCategory {
  mobile('mobile', 'Movil'),
  web('web', 'Web & Sistemas'),
  auto('auto', 'Automatizacion'),
  eng('eng', 'Ingenieria & Labs');

  final String id;
  final String etiqueta;
  const ProjectCategory(this.id, this.etiqueta);

  static ProjectCategory fromId(String? id) => ProjectCategory.values
      .firstWhere((c) => c.id == id, orElse: () => ProjectCategory.web);
}

// Tipo de "marco" visual del proyecto (telefono, navegador o laboratorio)
enum ProjectFrame {
  phone('phone', 'App movil'),
  browser('browser', 'Sitio web / Sistema'),
  lab('lab', 'Ingenieria / Lab');

  final String id;
  final String etiqueta;
  const ProjectFrame(this.id, this.etiqueta);

  static ProjectFrame fromId(String? id) => ProjectFrame.values
      .firstWhere((f) => f.id == id, orElse: () => ProjectFrame.browser);
}

// Un proyecto del portafolio. La forma coincide con el JSON publico de
// /api/projects del backend, para poder conectarlo mas adelante sin cambios.
class Project {
  final String slug;
  final ProjectCategory category;
  final ProjectFrame frame;
  final bool acentoVerde; // accent "gr" (salvia); si no, terracota
  final String nombre;
  final String lema;
  final String descripcion;
  final List<String> caracteristicas;
  final List<String> tecnologias;
  final String? formula; // solo para proyectos de laboratorio
  final String? demoUrl;
  final String? githubUrl;
  final bool destacado;

  const Project({
    required this.slug,
    required this.category,
    required this.frame,
    required this.nombre,
    required this.lema,
    required this.descripcion,
    this.acentoVerde = false,
    this.caracteristicas = const [],
    this.tecnologias = const [],
    this.formula,
    this.demoUrl,
    this.githubUrl,
    this.destacado = false,
  });

  // Iniciales para el monograma (misma regla que la web: primera letra de
  // cada palabra, separando por espacios y puntos; maximo 2)
  String get iniciales {
    final letras = nombre
        .split(RegExp(r'[\s.]+'))
        .where((p) => p.isNotEmpty)
        .map((p) => p[0])
        .join()
        .toUpperCase();
    if (letras.isEmpty) return '··';
    return letras.length > 2 ? letras.substring(0, 2) : letras;
  }

  // Lee un proyecto desde el JSON de la API (textos bilingues {es, en}).
  factory Project.fromJson(Map<String, dynamic> json) {
    String texto(dynamic bi) {
      if (bi is Map) return (bi['es'] ?? bi['en'] ?? '').toString();
      return bi?.toString() ?? '';
    }

    List<String> lista(dynamic bi) {
      final valor = bi is Map ? (bi['es'] ?? bi['en']) : bi;
      if (valor is List) return valor.map((e) => e.toString()).toList();
      return const [];
    }

    String? enlace(dynamic v) {
      final s = v?.toString() ?? '';
      return s.isEmpty ? null : s;
    }

    return Project(
      slug: json['slug'].toString(),
      category: ProjectCategory.fromId(json['category'] as String?),
      frame: ProjectFrame.fromId(json['frameType'] as String?),
      acentoVerde: json['accent'] == 'gr',
      nombre: texto(json['name']),
      lema: texto(json['tagline']),
      descripcion: texto(json['desc']),
      caracteristicas: lista(json['features']),
      tecnologias: lista(json['tech']),
      formula: enlace(json['labFormula']),
      demoUrl: enlace(json['demoUrl']),
      githubUrl: enlace(json['githubUrl']),
      destacado: json['isFeatured'] == true,
    );
  }
}

// Consultas comunes sobre una lista de proyectos
extension ProjectListX on List<Project> {
  List<Project> get destacados => where((p) => p.destacado).toList();

  List<Project> porCategoria(ProjectCategory? categoria) =>
      categoria == null ? this : where((p) => p.category == categoria).toList();

  Project? porSlug(String slug) {
    for (final p in this) {
      if (p.slug == slug) return p;
    }
    return null;
  }
}
