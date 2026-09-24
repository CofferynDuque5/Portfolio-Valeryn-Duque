import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../models/project.dart';
import 'projects_data.dart';

// Fuente de proyectos de la app. Empieza con el catalogo local y, si hay una
// API configurada, lo reemplaza con lo publicado en /api/projects. Si la API
// falla o no hay conexion, se conservan los datos que ya se estaban mostrando.
//
// La URL se define al compilar:
//   flutter run --dart-define=API_BASE_URL=https://tu-dominio.com
class ProjectsRepository {
  ProjectsRepository({
    http.Client? client,
    String? baseUrl,
    this.timeout = const Duration(seconds: 8),
  })  : _client = client ?? http.Client(),
        baseUrl = baseUrl ?? const String.fromEnvironment('API_BASE_URL');

  // Instancia que usan las pantallas
  static final instancia = ProjectsRepository();

  final http.Client _client;
  final String baseUrl;
  final Duration timeout;

  final ValueNotifier<List<Project>> proyectos =
      ValueNotifier(ProjectsData.todos);

  bool get usaApi => baseUrl.isNotEmpty;

  Uri get _url {
    final base = baseUrl.endsWith('/')
        ? baseUrl.substring(0, baseUrl.length - 1)
        : baseUrl;
    return Uri.parse('$base/api/projects');
  }

  // Pide los proyectos publicados. Devuelve true si se actualizaron.
  Future<bool> refrescar() async {
    if (!usaApi) return false;
    try {
      final r = await _client
          .get(_url, headers: {'Accept': 'application/json'}).timeout(timeout);
      if (r.statusCode != 200) return false;

      // Respuesta esperada: { ok: true, data: [ ...proyectos ] }
      final json = jsonDecode(utf8.decode(r.bodyBytes));
      if (json is! Map || json['ok'] != true || json['data'] is! List) {
        return false;
      }
      final lista = (json['data'] as List)
          .whereType<Map<String, dynamic>>()
          .map(Project.fromJson)
          .toList();
      if (lista.isEmpty) return false; // igual que la web: conserva lo local
      proyectos.value = lista;
      return true;
    } catch (e) {
      debugPrint('No se pudieron cargar los proyectos de la API: $e');
      return false;
    }
  }
}
