import 'package:flutter/material.dart';

class AddMedicationScreen extends StatefulWidget {
  const AddMedicationScreen({super.key});

  @override
  State<AddMedicationScreen> createState() => _AddMedicationScreenState();
}

class _AddMedicationScreenState extends State<AddMedicationScreen> {
  // Form controllers
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _medicationNameController = TextEditingController();
  final TextEditingController _dosageController = TextEditingController();
  final TextEditingController _unitController = TextEditingController();
  final TextEditingController _timingsController = TextEditingController();
  final TextEditingController _routeController = TextEditingController();
  final TextEditingController _notesController = TextEditingController();

  // Selected frequency
  String _selectedFrequency = 'Daily'; // Default value

  // List of available frequencies
  final List<String> _frequencies = ['Daily', 'Weekly', 'Monthly', 'As Needed'];

  // Symptom categories linked
  bool _linkToSymptoms = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Medication'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              // Medication Name
              TextFormField(
                controller: _medicationNameController,
                decoration: const InputDecoration(labelText: 'Medication Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter medication name';
                  }
                  return null;
                },
              ),
              // Dosage
              TextFormField(
                controller: _dosageController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'Dosage'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter dosage';
                  }
                  return null;
                },
              ),
              // Unit
              TextFormField(
                controller: _unitController,
                decoration: const InputDecoration(labelText: 'Unit (e.g., mg, ml)'),
              ),
              // Frequency
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(labelText: 'Frequency'),
                value: _selectedFrequency,
                items: _frequencies.map((String frequency) {
                  return DropdownMenuItem<String>(
                    value: frequency,
                    child: Text(frequency),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedFrequency = newValue!;
                  });
                },
              ),
              // Timings
              TextFormField(
                controller: _timingsController,
                decoration: const InputDecoration(labelText: 'Timings (e.g., 8:00 AM, 12:00 PM)'),
              ),
              // Route (Optional)
              TextFormField(
                controller: _routeController,
                decoration: const InputDecoration(labelText: 'Route (Optional)'),
              ),
              // Notes (Optional)
              TextFormField(
                controller: _notesController,
                decoration: const InputDecoration(labelText: 'Notes (Optional)'),
                maxLines: 3,
              ),
              // Link to Symptom Categories
              Row(
                children: <Widget>[
                  const Text('Link to Symptom Categories'),
                  Switch(
                    value: _linkToSymptoms,
                    onChanged: (bool value) {
                      setState(() {
                        _linkToSymptoms = value;
                      });
                    },
                  ),
                ],
              ),
              // Buttons
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          // TODO: Save the medication data
                          // Implement the logic to save the data to your data source
                          // You can access the form values using the controllers
                          // e.g., _medicationNameController.text
                          Navigator.pop(context); // Go back to the previous screen
                        }
                      },
                      child: const Text('Save'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context); // Go back to the previous screen
                      },
                      child: const Text('Cancel'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // TODO: Implement AI Pill Identifier functionality
                        // Add navigation to the AI Pill Identifier screen here
                      },
                      child: const Text('Use AI Pill Identifier'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}