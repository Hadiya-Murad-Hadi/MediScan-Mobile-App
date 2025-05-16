import 'package:flutter/material.dart';
import 'package:mediscan/screens/edit_medication_screen.dart';
class MedicationsScreen extends StatefulWidget {
  const MedicationsScreen({super.key});

  @override
  State<MedicationsScreen> createState() => _MedicationsScreenState();
}

class _MedicationsScreenState extends State<MedicationsScreen> {
  // Sample data for medications (replace with your actual data source)
  final List<Map<String, String>> medications = [
    {'name': 'Vitamin B-12', 'dosage': '2 capsules', 'frequency': 'Daily', 'nextDose': '8:00 PM'},
    {'name': 'UC-II Advanced', 'dosage': '1 capsule', 'frequency': 'Daily', 'nextDose': '8:00 PM'},
    {'name': 'Sunflower Lecithin', 'dosage': '1 capsule', 'frequency': 'Daily', 'nextDose': '8:00 PM'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Medications'),
        actions: [
          
        ],
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search for medications',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              // TODO: Implement search functionality
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: medications.length,
              itemBuilder: (context, index) {
                final medication = medications[index];
                return Card(
                  margin: const EdgeInsets.all(8.0),
                  child: ListTile(
                    title: Text(medication['name']!),
                    subtitle: Text(
                        '${medication['dosage']} - ${medication['frequency']} - Next dose: ${medication['nextDose']}'),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        IconButton(
                          icon: const Icon(Icons.edit),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => EditMedicationScreen(medication: medication),
                ),
            );
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () {
                            // TODO: Implement delete functionality
                            // Add delete medication logic here
                          },
                        ),
                        
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
  onPressed: () {
    Navigator.pushNamed(context, '/addMedication');
  },
  child: const Icon(Icons.add),
),
    );
  }
}