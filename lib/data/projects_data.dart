import '../models/project.dart';

// Catalogo local de proyectos. Es el mismo contenido que publica la web
// (seed del backend), ordenado igual. Se muestra al abrir la app y queda
// como respaldo si la API no responde.
class ProjectsData {
  static const List<Project> todos = [
    Project(
      slug: 'perla',
      category: ProjectCategory.mobile,
      frame: ProjectFrame.phone,
      acentoVerde: true,
      destacado: true,
      nombre: 'Perla Tour',
      lema:
          'Guía turística digital para la Isla de Margarita, con enfoque multiplataforma.',
      descripcion:
          'App de guía turística para la Isla de Margarita, Nueva Esparta. Construida en '
          'Flutter con enfoque dual-system para funcionar de forma fluida en Android e iOS.',
      caracteristicas: [
        'Mapa de puntos de interés',
        'Recomendaciones locales',
        'Multiplataforma Android/iOS',
      ],
      tecnologias: ['Flutter', 'Dart', 'Dual-system'],
    ),
    Project(
      slug: 'dyc',
      category: ProjectCategory.mobile,
      frame: ProjectFrame.phone,
      acentoVerde: true,
      destacado: true,
      nombre: 'Design Your Core',
      lema:
          'Tu sistema operativo personal: productividad y gestión del tiempo en dark mode.',
      descripcion:
          'App de productividad concebida como un "sistema operativo personal", con estética '
          'dark-mode estilizada y características avanzadas de gestión del tiempo.',
      caracteristicas: [
        'Gestión del tiempo',
        'Modo oscuro estilizado',
        'Enfoque en hábitos',
      ],
      tecnologias: ['Flutter', 'Dark UI', 'UX'],
    ),
    Project(
      slug: 'varoduva',
      category: ProjectCategory.web,
      frame: ProjectFrame.browser,
      destacado: true,
      nombre: 'VAROUDUVA.STORE',
      lema:
          'E-commerce de moda: ropa, calzado, gorras y accesorios en Margarita.',
      descripcion:
          'Sitio web y catálogo comercial para una tienda de moda en Margarita. Trabajo '
          'enfocado en marketing, edición y optimización de imágenes de producto.',
      caracteristicas: [
        'Catálogo de productos',
        'Imágenes optimizadas',
        'Material de marketing',
      ],
      tecnologias: ['Next.js', 'Tailwind', 'E-commerce'],
    ),
    Project(
      slug: 'codigo',
      category: ProjectCategory.web,
      frame: ProjectFrame.browser,
      nombre: 'Un Código Creativo',
      lema:
          'Biblioteca digital de guías y tutoriales, con base de datos y panel de administración.',
      descripcion:
          'Plataforma educativa como biblioteca digital para alojar guías de estudio y '
          'tutoriales de programación. Base de datos estructurada y panel de administración.',
      caracteristicas: [
        'Base de datos estructurada',
        'Panel de administración',
        'Guías y tutoriales',
      ],
      tecnologias: ['Astro', 'PostgreSQL', 'Admin'],
    ),
    Project(
      slug: 'pulso',
      category: ProjectCategory.web,
      frame: ProjectFrame.browser,
      nombre: 'El Pulso de la Naturaleza',
      lema: 'Sistema web de concientización y conservación ambiental.',
      descripcion:
          'Sistema web de concientización ambiental, diseñado para mostrar el valor del '
          'entorno natural mediante una arquitectura pensada de cara al usuario.',
      caracteristicas: [
        'Enfoque en conservación',
        'Arquitectura de cara al usuario',
        'Contenido educativo',
      ],
      tecnologias: ['Next.js', 'UI/UX'],
    ),
    Project(
      slug: 'nv',
      category: ProjectCategory.auto,
      frame: ProjectFrame.browser,
      acentoVerde: true,
      nombre: 'NV Streaming',
      lema:
          'Plataforma de reventa de perfiles de streaming con facturación automatizada.',
      descripcion:
          'Negocio de reventa de perfiles de servicios de streaming. Flujos de facturación '
          'automatizada para gestionar perfiles de clientes y material promocional.',
      caracteristicas: [
        'Facturación automatizada',
        'Gestión de perfiles',
        'Material promocional',
      ],
      tecnologias: ['Automatización', 'Billing', 'Blog'],
    ),
    Project(
      slug: 'ciclo',
      category: ProjectCategory.web,
      frame: ProjectFrame.browser,
      nombre: 'Un Ciclo Creativo',
      lema: 'Blog personal multidisciplinario: ingeniería, música y fitness.',
      descripcion:
          'Blog personal estructurado por categorías temáticas para documentar avances '
          'multidisciplinarios en ingeniería, música y fitness.',
      caracteristicas: [
        'Categorías temáticas',
        'Publicación de avances',
        'Enfoque multidisciplinario',
      ],
      tecnologias: ['Astro', 'Blog', 'CMS'],
    ),
    Project(
      slug: 'inventario',
      category: ProjectCategory.eng,
      frame: ProjectFrame.lab,
      formula: 'inventory.optimize(sales × climate) → stock*',
      nombre: 'Modelo de Optimización de Inventario',
      lema:
          'Cálculo de inventario con históricos de ventas y datos climatológicos para farmacias.',
      descripcion:
          'Sistema de software académico que calcula fórmulas de inventario a partir de '
          'históricos de ventas y datos climatológicos, diseñado para una cadena de farmacias.',
      caracteristicas: [
        'Modelo predictivo',
        'Datos históricos + clima',
        'Optimización de stock',
      ],
      tecnologias: ['Algoritmos', 'Data', 'Optimización'],
    ),
    Project(
      slug: 'opamp',
      category: ProjectCategory.eng,
      frame: ProjectFrame.lab,
      acentoVerde: true,
      formula: 'Vout = (1 + Rf/Rin) · Vin',
      nombre: 'Amplificador Operacional 741',
      lema:
          'Amplificador no inversor simulado y verificado con osciloscopio virtual en Proteus.',
      descripcion:
          'Diseño paso a paso de un amplificador no inversor basado en el chip 741, verificado '
          'con osciloscopio virtual en Proteus para una exposición universitaria.',
      caracteristicas: [
        'Chip 741',
        'Verificación con osciloscopio',
        'Simulación en Proteus',
      ],
      tecnologias: ['Proteus', '741', 'Hardware'],
    ),
  ];
}
