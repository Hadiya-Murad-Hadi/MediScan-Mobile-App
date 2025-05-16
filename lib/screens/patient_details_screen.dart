import 'package:flutter/material.dart';

class PatientDetailsScreen extends StatelessWidget {
  // Receive patient data as parameter
  final Map<String, dynamic> patient;

  const PatientDetailsScreen({Key? key, required this.patient}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Patient Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: <Widget>[
            // Patient's name
            Text(
              patient['name'],
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            // Patient's medication list
            const Text(
              'Medication List',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            // TODO: Implement Patient's medication list UI
            const Text(
              'TODO: Add Patient\'s medication list here',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            // Compliance history
            const Text(
              'Compliance History',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            // TODO: Implement Compliance history UI
            const Text(
              'TODO: Add Compliance history here',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            // Symptom/mood logs
            const Text(
              'Symptom/Mood Logs',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            // TODO: Implement Symptom/mood logs UI
            const Text(
              'TODO: Add Symptom/mood logs here',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            // Confirm Intake Button
            ElevatedButton(
              onPressed: () {
                // TODO: Implement Confirm Intake functionality
                // Add logic to confirm medication intake
              },
              child: const Text('Confirm Intake'),
            ),
          ],
        ),
      ),
    );
  }
}