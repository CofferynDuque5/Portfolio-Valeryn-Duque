import 'package:flutter_test/flutter_test.dart';

import 'package:portafolio_valeryn/data/projects_data.dart';
import 'package:portafolio_valeryn/models/project.dart';
import 'package:portafolio_valeryn/routes/app_routes.dart';

void main() {
  group('Project.fromJson', () {
    test('lee la forma publica de /api/projects', () {
      final p = Project.fromJson({
        'id': 'abc',
        'slug': 'perla',
        'category': 'mobile',
        'frameType': 'phone',
        'accent': 'gr',
        'name': {'es': 'Perla Tour', 'en': 'Perla Tour'},
        'tagline': {'es': 'Guia turistica', 'en': 'Tourism guide'},
        'desc': {'es': 'Descripcion', 'en': 'Description'},
        'features': {
          'es': ['Mapa'],
          'en': ['Map']
        },
        'tech': ['Flutter', 'Dart'],
        'labFormula': null,
        'demoUrl': '',
        'githubUrl': 'https://github.com/CofferynDuque5',
        'isFeatured': true,
      });

      expect(p.slug, 'perla');
      expect(p.category, ProjectCategory.mobile);
      expect(p.frame, ProjectFrame.phone);
      expect(p.acentoVerde, isTrue);
      expect(p.lema, 'Guia turistica');
      expect(p.caracteristicas, ['Mapa']);
      expect(p.tecnologias, ['Flutter', 'Dart']);
      expect(p.demoUrl, isNull); // cadena vacia = sin enlace
      expect(p.githubUrl, 'https://github.com/CofferynDuque5');
      expect(p.destacado, isTrue);
    });

    test('usa valores por defecto con categoria o marco desconocidos', () {
      final p = Project.fromJson({
        'slug': 'x',
        'category': 'otra',
        'frameType': 'otro',
        'name': {'es': 'X'},
      });
      expect(p.category, ProjectCategory.web);
      expect(p.frame, ProjectFrame.browser);
      expect(p.tecnologias, isEmpty);
    });
  });

  test('iniciales del monograma (misma regla que la web)', () {
    expect(ProjectsData.porSlug('perla')!.iniciales, 'PT');
    expect(ProjectsData.porSlug('varoduva')!.iniciales, 'VS');
    expect(ProjectsData.porSlug('codigo')!.iniciales, 'UC');
    expect(
        const Project(
          slug: 'x',
          category: ProjectCategory.web,
          frame: ProjectFrame.browser,
          nombre: '',
          lema: '',
          descripcion: '',
        ).iniciales,
        '··');
  });

  test('catalogo: slugs unicos, destacados y filtros', () {
    final slugs = ProjectsData.todos.map((p) => p.slug).toSet();
    expect(slugs.length, ProjectsData.todos.length);
    expect(ProjectsData.destacados.map((p) => p.slug),
        ['perla', 'dyc', 'varoduva']);
    expect(ProjectsData.porCategoria(ProjectCategory.eng).length, 2);
    expect(ProjectsData.porCategoria(null).length, 9);
    expect(ProjectsData.porSlug('no-existe'), isNull);
  });

  test('rutas de detalle de proyecto', () {
    expect(AppRoutes.projectDetail('perla'), '/projects/perla');
    expect(AppRoutes.slugDeRuta('/projects/perla'), 'perla');
    expect(AppRoutes.slugDeRuta('/projects'), isNull);
    expect(AppRoutes.slugDeRuta('/projects/'), isNull);
    expect(AppRoutes.slugDeRuta('/projects/a/b'), isNull);
    expect(AppRoutes.slugDeRuta('/about'), isNull);
  });
}
