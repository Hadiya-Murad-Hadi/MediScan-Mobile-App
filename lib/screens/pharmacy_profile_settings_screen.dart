import 'package:flutter/material.dart';

class PharmacyProfileSettingsScreen extends StatefulWidget {
  const PharmacyProfileSettingsScreen({Key? key}) : super(key: key);

  @override
  State<PharmacyProfileSettingsScreen> createState() => _PharmacyProfileSettingsScreenState();
}

class _PharmacyProfileSettingsScreenState extends State<PharmacyProfileSettingsScreen> {
  // Form controllers
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _pharmacyNameController;
  late TextEditingController _addressController;
  late TextEditingController _contactNumberController;

  // State for delivery status
  bool _deliveryStatus = false;

  @override
  void initState() {
    super.initState();
    _pharmacyNameController = TextEditingController(text: 'MediCare Pharmacy'); // Replace with pharmacy name
    _addressController = TextEditingController(text: '123 Main St'); // Replace with pharmacy address
    _contactNumberController = TextEditingController(text: '(123) 456-7890'); // Replace with pharmacy contact number
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pharmacy Profile & Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              // Pharmacy Name Field
              TextFormField(
                controller: _pharmacyNameController,
                decoration: const InputDecoration(labelText: 'Pharmacy Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter pharmacy name';
                  }
                  return null;
                },
              ),
              // Address Field
              TextFormField(
                controller: _addressController,
                decoration: const InputDecoration(labelText: 'Address'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter address';
                  }
                  return null;
                },
              ),
              // Contact Number Field
              TextFormField(
                controller: _contactNumberController,
                decoration: const InputDecoration(labelText: 'Contact Number'),
                keyboardType: TextInputType.phone,
              ),
              // Delivery Status Toggle
              Row(
                children: <Widget>[
                  const Text('Delivery Status:'),
                  Switch(
                    value: _deliveryStatus,
                    onChanged: (value) {
                      setState(() {
                        _deliveryStatus = value;
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(height: 20),
              // Save Button
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // TODO: Implement Save functionality
                    // Add logic to save the pharmacy details to your data source
                    // You can access the form values using the controllers
                    // e.g., _pharmacyNameController.text
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