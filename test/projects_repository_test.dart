import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';

import 'package:portafolio_valeryn/data/projects_data.dart';
import 'package:portafolio_valeryn/data/projects_repository.dart';

// Un proyecto con la forma que devuelve /api/projects
Map<String, dynamic> proyectoApi(String slug) => {
      'id': 'id-$slug',
      'slug': slug,
      'category': 'web',
      'frameType': 'browser',
      'accent': 'co',
      'name': {'es': 'Proyecto $slug', 'en': 'Project $slug'},
      'tagline': {'es': 'Lema', 'en': 'Tagline'},
      'desc': {'es': 'Descripción', 'en': 'Description'},
      'features': {'es': <String>[], 'en': <String>[]},
      'tech': ['Next.js'],
      'labFormula': null,
      'demoUrl': null,
      'githubUrl': null,
      'isFeatured': false,
    };

http.Response respuestaJson(Object cuerpo, [int estado = 200]) =>
    http.Response.bytes(utf8.encode(jsonEncode(cuerpo)), estado,
        headers: {'content-type': 'application/json; charset=utf-8'});

void main() {
  test('sin API configurada no hace peticiones y usa el catalogo local',
      () async {
    var llamadas = 0;
    final repo = ProjectsRepository(
      baseUrl: '',
      client: MockClient((_) async {
        llamadas++;
        return respuestaJson({});
      }),
    );

    expect(await repo.refrescar(), isFalse);
    expect(llamadas, 0);
    expect(repo.proyectos.value, ProjectsData.todos);
  });

  test('reemplaza el catalogo con los proyectos publicados en la API',
      () async {
    Uri? pedida;
    final repo = ProjectsRepository(
      baseUrl: 'https://ejemplo.com/',
      client: MockClient((req) async {
        pedida = req.url;
        return respuestaJson({
          'ok': true,
          'data': [proyectoApi('uno'), proyectoApi('dos')],
        });
      }),
    );

    expect(await repo.refrescar(), isTrue);
    expect(pedida.toString(), 'https://ejemplo.com/api/projects');
    expect(repo.proyectos.value.map((p) => p.slug), ['uno', 'dos']);
    expect(repo.proyectos.value.first.descripcion, 'Descripción');
  });

  group('conserva los datos actuales si la API', () {
    Future<void> comprobar(MockClientHandler handler) async {
      final repo = ProjectsRepository(
        baseUrl: 'https://ejemplo.com',
        client: MockClient(handler),
      );
      expect(await repo.refrescar(), isFalse);
      expect(repo.proyectos.value, ProjectsData.todos);
    }

    test('responde con error', () async {
      await comprobar((_) async => respuestaJson({'ok': false}, 500));
    });

    test('devuelve una lista vacia', () async {
      await comprobar((_) async => respuestaJson({'ok': true, 'data': []}));
    });

    test('devuelve algo que no es JSON', () async {
      await comprobar((_) async => http.Response('<html></html>', 200));
    });

    test('no hay conexion', () async {
      await comprobar((_) async => throw http.ClientException('sin red'));
    });

    test('tarda demasiado', () async {
      final repo = ProjectsRepository(
        baseUrl: 'https://ejemplo.com',
        timeout: const Duration(milliseconds: 10),
        client: MockClient((_) async {
          await Future<void>.delayed(const Duration(milliseconds: 200));
          return respuestaJson({
            'ok': true,
            'data': [proyectoApi('tarde')],
          });
        }),
      );
      expect(await repo.refrescar(), isFalse);
      expect(repo.proyectos.value, ProjectsData.todos);
    });
  });
}
