import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mynotes/controller/note_controller.dart';
import 'package:mynotes/model/note_model.dart';
import 'package:mynotes/view/note_page.dart';
void main() {
  testWidgets('NotePage should initialize and display widgets', (WidgetTester tester) async {
    // Build app and trigger a frame.
    await tester.pumpWidget(MaterialApp(
      home: NotePage(),
    ));
    // Verify that the title and content TextFields are displayed.
    expect(find.byType(TextField), findsNWidgets(2));
    // Verify that the Add Note button is displayed.
    expect(find.byType(ElevatedButton), findsOneWidget);
  });
  testWidgets('Adding a note should update the note list', (WidgetTester tester) async {
    // Build app and trigger a frame.
    await tester.pumpWidget(MaterialApp(
      home: NotePage(),
    ));
    // Enter title and content in TextFields
    await tester.enterText(find.widgetWithText(TextField, 'Title'), 'Test Title');
    await tester.enterText(find.widgetWithText(TextField, 'Content'), 'Test Content');
    // Tap the Add Note button
    await tester.tap(find.widgetWithText(ElevatedButton, 'Add Note'));
    // Wait for the async operation to complete
    await tester.pump();
    // Verify that the note list is updated
    expect(find.text('Test Title'), findsOneWidget);
    expect(find.text('Test Content'), findsOneWidget);
  });
}
