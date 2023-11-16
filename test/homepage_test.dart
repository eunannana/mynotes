import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mynotes/view/homepage.dart';
import 'package:mynotes/view/note_page.dart';
import 'package:mynotes/view/reminder_page.dart';

void main() {
  testWidgets('HomePage should contain two ElevatedButtons', (WidgetTester tester) async {
    // Build app and trigger a frame.
    await tester.pumpWidget(MaterialApp(
      home: HomePage(),
    ));

    // Verify that the page contains two ElevatedButtons
    expect(find.byType(ElevatedButton), findsNWidgets(2));
  });

  testWidgets('Tapping Notes button should navigate to NotePage', (WidgetTester tester) async {
    // Build app and trigger a frame.
    await tester.pumpWidget(MaterialApp(
      home: HomePage(),
    ));

    // Tap the 'Notes' button
    await tester.tap(find.widgetWithText(ElevatedButton, 'Notes'));

    // Wait for the Navigator to finish pushing a new route
    await tester.pumpAndSettle();

    // Verify that the NotePage is on the screen
    expect(find.byType(NotePage), findsOneWidget);
  });

  testWidgets('Tapping Reminders button should navigate to ReminderPage', (WidgetTester tester) async {
    // Build app and trigger a frame.
    await tester.pumpWidget(MaterialApp(
      home: HomePage(),
    ));

    // Tap the 'Reminders' button
    await tester.tap(find.widgetWithText(ElevatedButton, 'Reminders'));

    // Wait for the Navigator to finish pushing a new route
    await tester.pumpAndSettle();

    // Verify that the ReminderPage is on the screen
    expect(find.byType(ReminderPage), findsOneWidget);
  });
}
