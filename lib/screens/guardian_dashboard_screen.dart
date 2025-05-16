import 'package:flutter/material.dart';
import 'package:mediscan/screens/patient_details_screen.dart';


class GuardianDashboardScreen extends StatelessWidget {
  // Sample data for linked patients (replace with your actual data source)
  final List<Map<String, dynamic>> _linkedPatients = [
    {'name': 'Hadiya', 'compliance': '80%', 'alerts': 2},
    {'name': 'Murad', 'compliance': '90%', 'alerts': 0},
  ];

GuardianDashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Guardian Dashboard'),
      ),
      body: ListView.builder(
        itemCount: _linkedPatients.length,
        itemBuilder: (context, index) {
          final patient = _linkedPatients[index];
          return Card(
            margin: const EdgeInsets.all(8.0),
            child: ListTile(
              title: Text(patient['name']),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Compliance: ${patient['compliance']}'),
                  Text('Alerts: ${patient['alerts']}'),
                ],
              ),
              // onTap: () {
              //   // TODO: Implement navigation to Patient Details Screen
              //   // Add logic to navigate to the Patient Details Screen
              //   // Pass the patient data to the Patient Details Screen
              //   Navigator.pushNamed(context, '/patientDetails', arguments: patient);
              // },
              onTap: () {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => PatientDetailsScreen(patient: patient),
    ),
  );
},
            ),
          );
        },
      ),
    );
  }
}