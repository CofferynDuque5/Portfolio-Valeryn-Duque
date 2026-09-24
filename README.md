# portafolio_valeryn

Un nuevo proyecto de Flutter.

## Primeros Pasos

Este proyecto es un punto de partida para una aplicación de Flutter.

Aquí tienes algunos recursos para empezar si este es tu primer proyecto de Flutter:

- [Aprende Flutter](https://docs.flutter.dev/get-started/learn-flutter)
- [Escribe tu primera aplicación](https://docs.flutter.dev/get-started/codelab)
- [Recursos de aprendizaje de Flutter](https://docs.flutter.dev/reference/learning-resources)

Para obtener ayuda para comenzar con el desarrollo en Flutter, consulta la 
[documentación en línea](https://docs.flutter.dev/), que ofrece tutoriales, 
ejemplos, guía sobre desarrollo móvil y una referencia completa de la API.

Con el propósito de mejorar el flujo de trabajo y facilitar la portabilidad del proyecto entre diferentes entornos, se han incorporado scripts de automatización en la raíz del proyecto, los cuales son:

setup.bat y setup.ps1 (Scripts de Entorno): Archivos que, en conjunto, ofrecen automatizar algunas tareas necesarias (limpieza, resolución de dependencias, aprovisionamiento de plataformas nativas (Android/Web)). Nos pareció correcto incluirlos para hacer frente a problemas comunes en los entornos de Windows relacionados con el manejo de rutas relativas, con las variables de entorno locales (PATH), con la ejecución de scripts de PowerShell, etc. Permite la posibilidad no solo de simplificar el proceso sino también compilar el entorno base de ejecución en un solo paso.

.metadata: Un archivo de configuración creado por las herramientas de instrumentación del SDK de Flutter. Resulta ser un archivo fundamental para el control de versiones de framework, pues proporciona la versión exacta del canal y las capacidades de migración ejecutadas durante el ciclo de vida del software.

.gitignore: Un archivo configurado para prevenir a toda costa la indexación de artefactos de compilación locales, la caché dinámica (como .dart_tool/ o build/) o incluso configuraciones específicas de un IDE que comprometerían la integridad del repositorio.  

## Proyectos

La app incluye un archivo de proyectos (`/projects`) con filtros por categoría y una pantalla de detalle por proyecto (`/projects/<slug>`). La pantalla de inicio muestra los proyectos marcados como destacados.

- Al abrir la app se muestra el catálogo local de `lib/data/projects_data.dart`, que es el mismo contenido que publica la web.
- Al arrancar, la app pide en segundo plano los proyectos publicados en `https://cofferyncode.nvcorx.com/api/projects` (el backend `backend-nodejs-postgres`) y los muestra en lugar del catálogo local. Así, lo que publiques desde el panel de administración aparece en la app sin tocar código. En la pantalla de Proyectos puedes deslizar hacia abajo para volver a cargarlos.
- Si la API no responde, devuelve un error o una lista vacía, la app sigue mostrando los datos locales.
- Los enlaces de demo y código solo aparecen si el proyecto los tiene.

### Cambiar la URL de la API

Por defecto la app usa `https://cofferyncode.nvcorx.com`. Para usar otro dominio (sin `/api` al final), por ejemplo un backend local:

```bash
flutter run --dart-define=API_BASE_URL=https://tu-dominio.com
flutter build apk --dart-define=API_BASE_URL=https://tu-dominio.com
flutter build web --dart-define=API_BASE_URL=https://tu-dominio.com
```

Con `--dart-define=API_BASE_URL=` (vacío), la app funciona solo con los datos locales. Mientras el backend Node no esté encendido, la app también muestra los datos locales. Para la versión web, el dominio donde publiques la app debe estar en la lista de orígenes permitidos (CORS) del backend.

Para verificar los cambios:

```bash
flutter analyze
flutter test
```

## APK para la web

Cada pull request y cada push a `main` ejecutan el workflow **App** (`.github/workflows/app.yml`): `flutter analyze`, `flutter test` y `flutter build apk --release`. El APK queda como artefacto `cofferyncode-app` del run, en la pestaña **Actions** del repositorio.

Descárgalo, descomprímelo y súbelo al backend como `public/downloads/cofferyncode-app.apk`, que es el archivo que enlaza el botón "Descargar la app" de la web. Para compilarlo contra otro dominio, lanza el workflow a mano desde **Actions → App → Run workflow** e indica la URL.

El APK se firma con la clave de depuración del runner, así que para actualizar la app en un teléfono puede hacer falta desinstalar la versión anterior. Para publicar en Play Store hará falta una clave de firma propia.
