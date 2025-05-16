import 'package:flutter/material.dart';
import 'package:mediscan/screens/pharmacy_details_screen.dart';

class PharmaciesScreen extends StatefulWidget {
  const PharmaciesScreen({Key? key}) : super(key: key);

  @override
  State<PharmaciesScreen> createState() => _PharmaciesScreenState();
}

class _PharmaciesScreenState extends State<PharmaciesScreen> {
  // Sample data for pharmacies (replace with your actual data source)
  final List<Map<String, dynamic>> pharmacies = [
    {
      'name': 'Healthways Pharmacy',
      'address': 'J4MM+P2V HealthWays Pharmacy, Raja Altaf Rd, Burma Town, Islamabad, Pakistan',
      'distance': '0.5 miles',
      'availability': 'Open Now',
      'imageUrl': 'assets/images/pexels-julie-viken-148496-593451.jpg',
      'deliveryAvailable': false,
    },
    {
      'name': 'HealthPlus Pharmacy',
      'address': '456 Elm St',
      'distance': '1.2 miles',
      'availability': 'Closed',
      'imageUrl': 'assets/images/phar.jpeg',
      'deliveryAvailable': true,
    },
  ];

  // Filter state
  bool _openNowSelected = false;
  bool _deliveryAvailableSelected = false;
  bool _allSelected = true; // Added "All" filter state

  // Filtered pharmacy list
  List<Map<String, dynamic>> get _filteredPharmacies {
    if (_openNowSelected) {
      return pharmacies.where((pharmacy) => pharmacy['availability'] == 'Open Now').toList();
    } else if (_deliveryAvailableSelected) {
      return pharmacies.where((pharmacy) => pharmacy['deliveryAvailable'] == true).toList();
    } else {
      return pharmacies; // Show all pharmacies if no filter is selected
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pharmacies'),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search for pharmacies',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              // TODO: Implement search functionality
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              FilterChip(
                label: const Text('All'),
                selected: _allSelected,
                onSelected: (bool selected) {
                  setState(() {
                    _allSelected = selected;
                    _openNowSelected = false;
                    _deliveryAvailableSelected = false;
                  });
                },
              ),
              FilterChip(
                label: const Text('Open Now'),
                selected: _openNowSelected,
                onSelected: (bool selected) {
                  setState(() {
                    _allSelected = false;
                    _openNowSelected = selected;
                    _deliveryAvailableSelected = false;
                  });
                },
              ),
              FilterChip(
                label: const Text('Delivery Available'),
                selected: _deliveryAvailableSelected,
                onSelected: (bool selected) {
                  setState(() {
                    _allSelected = false;
                    _deliveryAvailableSelected = selected;
                    _openNowSelected = false;
                  });
                },
              ),
              // TODO: Add filter for Specific Medication
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _filteredPharmacies.length,
              itemBuilder: (context, index) {
                final pharmacy = _filteredPharmacies[index];
                return Card(
                  margin: const EdgeInsets.all(8.0),
                  child: Row(
                    children: <Widget>[
                      // Pharmacy Image
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          pharmacy['imageUrl'],
                          width: 100,
                          height: 100,
                          // fit: BoxFit.cover,
                        ),
                      ),
                      // Pharmacy Details
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                pharmacy['name'],
                                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              Text(pharmacy['address']),
                              Text('Distance: ${pharmacy['distance']}'),
                              Text('Availability: ${pharmacy['availability']}'),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  ElevatedButton(
                                    onPressed: () {
                                      // TODO: Implement Call functionality
                                      // Add logic to make a phone call here
                                    },
                                    child: const Text('Call'),
                                  ),
                                  const SizedBox(width: 8),
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => PharmacyDetailsScreen(pharmacy: pharmacy),
                                        ),
                                      );
                                    },
                                    child: const Text('View Details'),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}