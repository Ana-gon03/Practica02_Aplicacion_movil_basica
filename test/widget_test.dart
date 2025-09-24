import 'package:flutter_test/flutter_test.dart';
import 'package:tarea02/main.dart'; // Asegúrate de que esta ruta sea correcta

void main() {
  testWidgets('Zoo Adventure app has a title', (WidgetTester tester) async {
    // Construye la aplicación y dispara un frame.
    await tester.pumpWidget(const ZooAdventureApp());

    // Verifica que el título "Zoo Adventure" esté presente.
    expect(find.text('Zoo Adventure'), findsOneWidget);
  });
}