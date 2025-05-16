import 'package:flutter/material.dart';

class RefillRequestsScreen extends StatelessWidget {
  // Sample data for refill requests (replace with your actual data source)
  final List<Map<String, dynamic>> _refillRequests = [
    {
      'patientName': 'Hadiya',
      'medicationName': 'Aspirin',
      'dosage': '325 mg',
      'quantity': '30 tablets',
    },
    {
      'patientName': 'Murad',
      'medicationName': 'Vitamin C',
      'dosage': '500 mg',
      'quantity': '60 tablets',
    },
  ];

  RefillRequestsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Refill Requests'),
      ),
      body: ListView.builder(
        itemCount: _refillRequests.length,
        itemBuilder: (context, index) {
          final request = _refillRequests[index];
          return Card(
            margin: const EdgeInsets.all(8.0),
            child: ListTile(
              title: Text(request['patientName']),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Medication: ${request['medicationName']}'),
                  Text('Dosage: ${request['dosage']}'),
                  Text('Quantity: ${request['quantity']}'),
                ],
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () {
                      // TODO: Implement Accept functionality
                      // Add logic to accept the refill request
                    },
                    child: const Text('Accept'),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () {
                      // TODO: Implement Decline functionality
                      // Add logic to decline the refill request
                    },
                    child: const Text('Decline'),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}