import 'package:flutter/material.dart';

class PillIdentificationResultScreen extends StatelessWidget {
  // Sample data for pill identification result (replace with your actual data source)
  final Map<String, dynamic> pillData = {
    'image': 'https://example.com/pill_image.jpg', // Replace with your image URL
    'medicationName': 'Aspirin',
    'dosage': '325 mg',
    'confidenceLevel': '95%',
  };

   PillIdentificationResultScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pill Identification Result'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Image of identified pill
            Image.network(
              pillData['image'],
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 20),
            // Predicted medication name
            Text(
              'Predicted Medication Name: ${pillData['medicationName']}',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            // Predicted dosage
            Text(
              'Predicted Dosage: ${pillData['dosage']}',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 10),
            // Confidence level
            Text(
              'Confidence Level: ${pillData['confidenceLevel']}',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            // Disclaimer
            const Text(
              'Disclaimer: This identification is based on AI and may not be accurate. Consult a healthcare professional for confirmation.',
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            const SizedBox(height: 20),
            // Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    // TODO: Implement Save to Medications functionality
                    // Add logic to save the identified pill to the medications list
                  },
                  child: const Text('Save to Medications'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // TODO: Implement Try Again functionality
                    // Add logic to go back to the camera/upload screen
                  },
                  child: const Text('Try Again'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}