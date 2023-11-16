import 'package:flutter_test/flutter_test.dart';
import 'package:mynotes/controller/reminder_controller.dart';
import 'package:mynotes/model/reminder_model.dart';

void main() {
  group('ReminderController', () {
    test('insertReminder should insert a reminder into the database', () async {
      // Arrange
      final reminderController = ReminderController();
      final reminder = Reminder(id: 1, title: 'Test Reminder', dateTime: '2023-11-16 10:00:00');

      // Act
      final result = await reminderController.insertReminder(reminder);

      // Assert
      expect(result, 1); // Assuming 1 is the expected ID for the inserted reminder
    });
    test('getReminders should return a list of reminders from the database', () async {
      // Arrange
      final reminderController = ReminderController();

      // Act
      final reminders = await reminderController.getReminders();

      // Assert
      expect(reminders, isList); // Ensure it returns a list
    });
  });
}
