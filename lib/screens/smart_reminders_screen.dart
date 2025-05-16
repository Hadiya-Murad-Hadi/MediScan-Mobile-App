import 'package:flutter/material.dart';


class SmartRemindersScreen extends StatelessWidget {
  SmartRemindersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Smart Reminders'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              'Upcoming Reminders',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            // Upcoming Reminders List
            Expanded(
              child: ListView.builder(
                itemCount: upcomingReminders.length,
                itemBuilder: (context, index) {
                  final reminder = upcomingReminders[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    child: ListTile(
                      title: Text(reminder['medicationName']!),
                      subtitle: Text('Time: ${reminder['time']}'),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Refill Predictions',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            // Refill Prediction List
            Expanded(
              child: ListView.builder(
                itemCount: refillPredictions.length,
                itemBuilder: (context, index) {
                  final prediction = refillPredictions[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    child: ListTile(
                      title: Text(prediction['medicationName']!),
                      subtitle: Text('Predicted Date: ${prediction['predictedDate']}'),
                      trailing: ElevatedButton(
                        onPressed: () {
                          // TODO: Implement Request Refill functionality
                          // Add logic to request refill here
                        },
                        child: const Text('Request Refill'),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Sample data for upcoming reminders (replace with your actual data source)
  final List<Map<String, String>> upcomingReminders = [
    {'medicationName': 'Vitamin B-12', 'time': '8:00 PM'},
    {'medicationName': 'UC-II Advanced', 'time': '8:00 PM'},
  ];

  // Sample data for refill predictions (replace with your actual data source)
  final List<Map<String, String>> refillPredictions = [
    {'medicationName': 'Vitamin B-12', 'predictedDate': '2024-01-15'},
    {'medicationName': 'UC-II Advanced', 'predictedDate': '2024-01-20'},
  ];
}