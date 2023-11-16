import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mynotes/controller/reminder_controller.dart';
import 'package:mynotes/model/reminder_model.dart';
import 'package:mynotes/view/reminder_page.dart';
void main() {
  testWidgets('ReminderPage should initialize and display widgets', (WidgetTester tester) async {
    // Build app and trigger a frame.
    await tester.pumpWidget(MaterialApp(
      home: ReminderPage(),
    ));
    // Verify that the title and dateTime TextFields are displayed.
    expect(find.byType(TextField), findsNWidgets(2));
    // Verify that the Add Reminder button is displayed.
    expect(find.byType(ElevatedButton), findsOneWidget);
  });
  testWidgets('Adding a reminder should update the reminder list', (WidgetTester tester) async {
    // Build app and trigger a frame.
    await tester.pumpWidget(MaterialApp(
      home: ReminderPage(),
    ));
    // Enter title and dateTime in TextFields
    await tester.enterText(find.widgetWithText(TextField, 'Title'), 'Test Title');
    await tester.enterText(find.widgetWithText(TextField, 'Date and Time'), '2023-11-16 10:00:00');
    // Tap the Add Reminder button
    await tester.tap(find.widgetWithText(ElevatedButton, 'Add Reminder'));
    // Wait for the async operation to complete
    await tester.pump();
    // Verify that the reminder list is updated
    expect(find.text('Test Title'), findsOneWidget);
    expect(find.text('2023-11-16 10:00:00'), findsOneWidget);
  });
}
