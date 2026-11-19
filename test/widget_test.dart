import 'package:flutter_test/flutter_test.dart';
import 'package:mi_primera_app/main.dart';

void main() {
  testWidgets('La aplicación Cursos ADSO inicia correctamente', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MiApp());

    expect(find.text('Cursos ADSO'), findsOneWidget);
    expect(find.text('Correo'), findsOneWidget);
    expect(find.text('Contraseña'), findsOneWidget);
    expect(find.text('Ingresar'), findsOneWidget);
  });
  testWidgets('Muestra un mensaje cuando el correo está vacío', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MiApp());

    await tester.tap(find.text('Ingresar'));
    await tester.pumpAndSettle();

    expect(find.text('Escriba su correo'), findsOneWidget);
  });
}
