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
