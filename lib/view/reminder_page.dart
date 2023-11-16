// lib/view/reminder_page.dart
import 'package:flutter/material.dart';
import 'package:mynotes/controller/reminder_controller.dart';
import 'package:mynotes/model/reminder_model.dart';

class ReminderPage extends StatefulWidget {
  @override
  _ReminderPageState createState() => _ReminderPageState();
}

class _ReminderPageState extends State<ReminderPage> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _dateTimeController = TextEditingController();
  final ReminderController _reminderController = ReminderController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reminders'),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(16.0),
            child: TextField(
              controller: _titleController,
              decoration: InputDecoration(labelText: 'Title'),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: TextField(
              controller: _dateTimeController,
              decoration: InputDecoration(labelText: 'Date and Time'),
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              Reminder reminder = Reminder(
                id: 0,
                title: _titleController.text,
                dateTime: _dateTimeController.text,
              );
              await _reminderController.insertReminder(reminder);
              setState(() {
                _titleController.clear();
                _dateTimeController.clear();
              });
            },
            child: Text('Add Reminder'),
          ),
          Expanded(
            child: FutureBuilder<List<Reminder>>(
              future: _reminderController.getReminders(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  List<Reminder> reminders = snapshot.data!;
                  return ListView.builder(
                    itemCount: reminders.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(reminders[index].title),
                        subtitle: Text(reminders[index].dateTime),
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
