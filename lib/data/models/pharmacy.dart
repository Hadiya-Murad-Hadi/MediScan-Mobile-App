// lib/data/models/pharmacy.dart

//Instruction: Add the geolocator package to your pubspec.yaml.
// This model represents pharmacy data stored in Firestore.

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geolocator/geolocator.dart';

class Pharmacy {
  final String id;
  final String name;
  final Position location;
  final String contactNumber;
  final bool hasDelivery;
  final List<String> medicationsAvailable; // List of medication names

  Pharmacy({
    required this.id,
    required this.name,
    required this.location,
    required this.contactNumber,
    this.hasDelivery = false,
    this.medicationsAvailable = const [],
  });

  factory Pharmacy.fromFirestore(Map<String, dynamic> data, String id) {
    final GeoPoint geoPoint = data['location'];
    return Pharmacy(
      id: id,
      name: data['name'] ?? '',
      location: Position(
        latitude: geoPoint.latitude,
        longitude: geoPoint.longitude,
        altitude: 0.0, // Provide default or handle null
        accuracy: 0.0,
        heading: 0.0,
        speed: 0.0,
        speedAccuracy: 0.0,
        timestamp: DateTime.now(), // Provide default or handle null
      ),
      contactNumber: data['contactNumber'] ?? '',
      hasDelivery: data['hasDelivery'] ?? false,
      medicationsAvailable: List<String>.from(data['medicationsAvailable'] ?? []),
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'name': name,
      'location': GeoPoint(location.latitude, location.longitude),
      'contactNumber': contactNumber,
      'hasDelivery': hasDelivery,
      'medicationsAvailable': medicationsAvailable,
    };
  }
}

  // Method to calculate distance to another pharmacy
  double distanceTo(Pharmacy other) {
    return Geolocator.distanceBetween(
      location.latitude,
      location.longitude,
      other.location.latitude,
      other.location.longitude,
    );
  }
}