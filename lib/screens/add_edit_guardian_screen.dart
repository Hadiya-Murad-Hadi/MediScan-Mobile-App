import 'package:flutter/material.dart';

class AddEditGuardianScreen extends StatefulWidget {
  const AddEditGuardianScreen({Key? key}) : super(key: key);

  @override
  State<AddEditGuardianScreen> createState() => _AddEditGuardianScreenState();
}

class _AddEditGuardianScreenState extends State<AddEditGuardianScreen> {
  // Form controllers
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _linkingCodeController;
  late TextEditingController _guardianNameController;
  late TextEditingController _guardianContactController;

  @override
  void initState() {
    super.initState();
    // Initialize controllers
    _linkingCodeController = TextEditingController();
    _guardianNameController = TextEditingController();
    _guardianContactController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add/Edit Guardian'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              // Guardian Linking Code Field
              TextFormField(
                controller: _linkingCodeController,
                decoration: const InputDecoration(labelText: 'Guardian Linking Code'),
              ),
              // Guardian Name Field
              TextFormField(
                controller: _guardianNameController,
                decoration: const InputDecoration(labelText: 'Guardian Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter guardian name';
                  }
                  return null;
                },
              ),
              // Guardian Contact Info Field
              TextFormField(
                controller: _guardianContactController,
                decoration: const InputDecoration(labelText: 'Guardian Contact Info'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter guardian contact info';
                  }
                  return null;
                },
              ),
              // Buttons
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Column(
                  children: <Widget>[
                    ElevatedButton(
                      onPressed: () {
                        // TODO: Implement Link Guardian functionality
                        // Add logic to link guardian using the linking code
                      },
                      child: const Text('Link Guardian'),
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          // TODO: Save the guardian data
                          // Implement the logic to save the data to your data source
                          // You can access the form values using the controllers
                          // e.g., _guardianNameController.text
                          Navigator.pop(context); // Go back to the previous screen
                        }
                      },
                      child: const Text('Save'),
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {
                        // TODO: Implement Remove Guardian functionality
                        // Add logic to remove the linked guardian
                      },
                      child: const Text('Remove Guardian'),
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