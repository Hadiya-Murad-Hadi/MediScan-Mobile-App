import 'package:flutter/material.dart';

class PharmacyPortalDashboardScreen extends StatelessWidget {
  const PharmacyPortalDashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pharmacy Portal Dashboard'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              'Overview',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            const Text(
              'Refill Requests',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            // TODO: Implement Refill Requests Overview UI
            const Text(
              'TODO: Add Refill Requests Overview here',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            const Text(
              'Inventory Options',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            // TODO: Implement Inventory Options UI
            const Text(
              'TODO: Add Inventory Options here',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            // Navigation Buttons
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/addEditMedicationInventory');
              },
              child: const Text('Add/Edit Medication Inventory'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/refillRequests');
              },
              child: const Text('View Refill Requests'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/pharmacyProfileSettings');
              },
              child: const Text('Pharmacy Profile & Settings'),
            ),
          ],
        ),
      ),
    );
  }
}