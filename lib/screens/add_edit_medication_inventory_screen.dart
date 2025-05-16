import 'package:flutter/material.dart';

class AddEditMedicationInventoryScreen extends StatefulWidget {
  const AddEditMedicationInventoryScreen({Key? key}) : super(key: key);

  @override
  State<AddEditMedicationInventoryScreen> createState() => _AddEditMedicationInventoryScreenState();
}

class _AddEditMedicationInventoryScreenState extends State<AddEditMedicationInventoryScreen> {
  // Form controllers
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _medicationNameController;
  late TextEditingController _dosageController;
  late TextEditingController _priceController;
  late TextEditingController _quantityController;

  @override
  void initState() {
    super.initState();
    _medicationNameController = TextEditingController();
    _dosageController = TextEditingController();
    _priceController = TextEditingController();
    _quantityController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add/Edit Medication Inventory'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              // Medication Name Field
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
              // Dosage Field
              TextFormField(
                controller: _dosageController,
                decoration: const InputDecoration(labelText: 'Dosage'),
              ),
              // Price Field
              TextFormField(
                controller: _priceController,
                decoration: const InputDecoration(labelText: 'Price'),
                keyboardType: TextInputType.number,
              ),
              // Quantity Field
              TextFormField(
                controller: _quantityController,
                decoration: const InputDecoration(labelText: 'Quantity'),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 20),
              // Buttons
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // TODO: Implement Add/Edit Medication functionality
                    // Add logic to save the medication data to your data source
                    // You can access the form values using the controllers
                    // e.g., _medicationNameController.text
                    Navigator.pop(context);
                  }
                },
                child: const Text('Save'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}