import 'package:flutter/material.dart';

class SymptomTrackerScreen extends StatefulWidget {
  const SymptomTrackerScreen({super.key});

  @override
  State<SymptomTrackerScreen> createState() => _SymptomTrackerScreenState();
}

class _SymptomTrackerScreenState extends State<SymptomTrackerScreen> {
  // Selected date
  DateTime _selectedDate = DateTime.now();

  // Selected mood
  String _selectedMood = 'Neutral'; // Default value

  // List of available moods
  final List<String> _moods = ['Happy', 'Sad', 'Angry', 'Anxious', 'Neutral'];

  // Selected energy level
  int _selectedEnergyLevel = 3; // Default value

  // Selected pain level
  int _selectedPainLevel = 0; // Default value

  // Side effects checklist
  final Map<String, bool> _sideEffects = {
    'Nausea': false,
    'Headache': false,
    'Dizziness': false,
    'Fatigue': false,
  };

  // Additional notes
  final TextEditingController _notesController = TextEditingController();

  // Function to show date picker
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Symptom & Mood Tracker'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: <Widget>[
            // Date Picker
            Row(
              children: <Widget>[
                Text(
                  'Date: ${_selectedDate.toLocal()}'.split(' ')[0],
                  style: const TextStyle(fontSize: 16),
                ),
                IconButton(
                  icon: const Icon(Icons.calendar_today),
                  onPressed: () => _selectDate(context),
                ),
              ],
            ),
            const SizedBox(height: 10),
            // Mood Selection
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(labelText: 'Mood'),
              value: _selectedMood,
              items: _moods.map((String mood) {
                return DropdownMenuItem<String>(
                  value: mood,
                  child: Text(mood),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _selectedMood = newValue!;
                });
              },
            ),
            const SizedBox(height: 10),
            // Energy Level Selection
            const Text('Energy Level', style: TextStyle(fontSize: 16)),
            Slider(
              value: _selectedEnergyLevel.toDouble(),
              min: 1,
              max: 5,
              divisions: 4,
              label: _selectedEnergyLevel.toString(),
              onChanged: (double value) {
                setState(() {
                  _selectedEnergyLevel = value.round();
                });
              },
            ),
            const SizedBox(height: 10),
            // Pain Level Selection
            const Text('Pain Level', style: TextStyle(fontSize: 16)),
            Slider(
              value: _selectedPainLevel.toDouble(),
              min: 0,
              max: 10,
              divisions: 10,
              label: _selectedPainLevel.toString(),
              onChanged: (double value) {
                setState(() {
                  _selectedPainLevel = value.round();
                });
              },
            ),
            const SizedBox(height: 10),
            // Side Effects Checklist
            const Text('Side Effects', style: TextStyle(fontSize: 16)),
            Column(
              children: _sideEffects.keys.map((String key) {
                return CheckboxListTile(
                  title: Text(key),
                  value: _sideEffects[key],
                  onChanged: (bool? value) {
                    setState(() {
                      _sideEffects[key] = value!;
                    });
                  },
                );
              }).toList(),
            ),
            const SizedBox(height: 10),
            // Additional Notes
            TextFormField(
              controller: _notesController,
              decoration: const InputDecoration(labelText: 'Additional Notes'),
              maxLines: 3,
            ),
            const SizedBox(height: 20),
            // Save Log Button
            ElevatedButton(
              onPressed: () {
                // TODO: Implement Save Log functionality
                // Add logic to save the data to your data source
                // You can access the form values using the controllers
                // e.g., _selectedDate, _selectedMood, _selectedEnergyLevel, _selectedPainLevel, _sideEffects, _notesController.text
              },
              child: const Text('Save Log'),
            ),
          ],
        ),
      ),
    );
  }
}