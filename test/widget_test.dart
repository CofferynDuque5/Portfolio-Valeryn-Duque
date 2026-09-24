import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:portafolio_valeryn/main.dart';

void main() {
  // Hace scroll en la pantalla actual hasta que el widget sea visible
  Future<void> verYTocar(WidgetTester tester, Finder finder) async {
    await tester.scrollUntilVisible(finder, 200,
        scrollable: find.byType(Scrollable).last);
    // Lo lleva arriba de la pantalla para que el toque no quede en el borde
    await tester.ensureVisible(finder);
    await tester.pumpAndSettle();
    await tester.tap(finder);
    await tester.pumpAndSettle();
  }

  testWidgets('Inicio muestra el perfil y los proyectos destacados',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Valeryn Rouse Duque Valladares'), findsOneWidget);

    await tester.scrollUntilVisible(find.text('Perla Tour'), 200);
    expect(find.text('PROYECTOS DESTACADOS'), findsOneWidget);
    expect(find.text('Perla Tour'), findsOneWidget);
  });

  testWidgets('Archivo de proyectos filtra por categoria y abre el detalle',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    await verYTocar(tester, find.text('Ver todos'));
    expect(find.text('9 PROYECTOS'), findsOneWidget);

    await tester.tap(find.text('Ingenieria & Labs'));
    await tester.pumpAndSettle();
    expect(find.text('2 PROYECTOS'), findsOneWidget);
    expect(find.text('Perla Tour'), findsNothing);

    await verYTocar(tester, find.text('Amplificador Operacional 741'));
    expect(find.text('Vout = (1 + Rf/Rin) · Vin'), findsOneWidget);
    await tester.scrollUntilVisible(find.text('TECNOLOGIAS'), 200,
        scrollable: find.byType(Scrollable).last);
    expect(find.text('Proteus'), findsOneWidget);
    // Este proyecto no tiene enlaces, asi que no se muestra la seccion
    expect(find.text('ENLACES'), findsNothing);
  });

  testWidgets(
      'Ruta /projects/<slug> abre el detalle y un slug invalido el archivo',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    final navegador = tester.state<NavigatorState>(find.byType(Navigator));

    navegador.pushNamed('/projects/dyc');
    await tester.pumpAndSettle();
    expect(find.text('Design Your Core'), findsWidgets);
    expect(find.text('CONTEXTO'), findsOneWidget);

    navegador.pushNamed('/projects/no-existe');
    await tester.pumpAndSettle();
    expect(find.text('9 PROYECTOS'), findsOneWidget);
  });
}
