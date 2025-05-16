import 'package:flutter/material.dart';

class AddEditAllergiesConditionsScreen extends StatefulWidget {
  const AddEditAllergiesConditionsScreen({Key? key}) : super(key: key);

  @override
  State<AddEditAllergiesConditionsScreen> createState() => _AddEditAllergiesConditionsScreenState();
}

class _AddEditAllergiesConditionsScreenState extends State<AddEditAllergiesConditionsScreen> {
  // Form controllers
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _allergiesController;
  late TextEditingController _conditionsController;

  @override
  void initState() {
    super.initState();
    // Initialize controllers
    _allergiesController = TextEditingController();
    _conditionsController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add/Edit Allergies/Conditions'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              // Allergies Input Field
              TextFormField(
                controller: _allergiesController,
                decoration: const InputDecoration(labelText: 'Allergies (comma-separated)'),
              ),
              // Conditions Input Field
              TextFormField(
                controller: _conditionsController,
                decoration: const InputDecoration(labelText: 'Conditions (comma-separated)'),
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
                          // TODO: Save the allergies/conditions data
                          // Implement the logic to save the data to your data source
                          // You can access the form values using the controllers
                          // e.g., _allergiesController.text
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