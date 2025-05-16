import 'package:flutter/material.dart';

class EditMedicationScreen extends StatefulWidget {
  // Receive medication data as parameter
  final Map<String, String> medication;

  const EditMedicationScreen({super.key, required this.medication});

  @override
  State<EditMedicationScreen> createState() => _EditMedicationScreenState();
}

class _EditMedicationScreenState extends State<EditMedicationScreen> {
  // Form controllers
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _medicationNameController;
  late TextEditingController _dosageController;
  late TextEditingController _unitController;
  late TextEditingController _timingsController;
  late TextEditingController _routeController;
  late TextEditingController _notesController;

  // Selected frequency
  String _selectedFrequency = 'Daily'; // Default value

  // List of available frequencies
  final List<String> _frequencies = ['Daily', 'Weekly', 'Monthly', 'As Needed'];

  // Symptom categories linked
  bool _linkToSymptoms = false;

  @override
  void initState() {
    super.initState();
    // Initialize controllers with medication data
    _medicationNameController = TextEditingController(text: widget.medication['name']);
    _dosageController = TextEditingController(text: widget.medication['dosage']);
    _unitController = TextEditingController(text: widget.medication['unit'] ?? '');
    _timingsController = TextEditingController(text: widget.medication['timings'] ?? '');
    _routeController = TextEditingController(text: widget.medication['route'] ?? '');
    _notesController = TextEditingController(text: widget.medication['notes'] ?? '');

    // TODO: Set initial values for frequency and symptom linking
    // You might need to fetch these values from your data source
    _selectedFrequency = widget.medication['frequency'] ?? 'Daily';
    _linkToSymptoms = widget.medication['linkToSymptoms'] == 'true';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Medication'),
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
                          // TODO: Save the edited medication data
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