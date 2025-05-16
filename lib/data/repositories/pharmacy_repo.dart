//Pharmacy data operations
// lib/data/repositories/pharmacy_repository.dart

//nstruction: Add the geolocator package to your pubspec.yaml. Implementing getNearbyPharmacies efficiently with Firestore requires careful consideration of geo-querying strategies.

import 'package:cloud_firestore/cloud_firestore.dart';
import '../../core/services/firebase_service.dart';
import '../models/pharmacy.dart';
import 'package:geolocator/geolocator.dart';

class PharmacyRepository {
  final FirebaseService _firebaseService;

  PharmacyRepository(this._firebaseService);

  Stream<List<Pharmacy>> getAllPharmacies() {
    return _firebaseService.firestore.collection('pharmacies').snapshots().map(
        (snapshot) => snapshot.docs.map((doc) => Pharmacy.fromFirestore(doc.data(), doc.id)).toList());
  }

  // Implement logic to fetch nearby pharmacies based on user location
  Stream<List<Pharmacy>> getNearbyPharmacies(Position position, double radius) {
    // This requires more complex geo-querying which might involve Firebase Extensions or other strategies.
    // Placeholder for now:
    return getAllPharmacies();
  }

  Future<Pharmacy?> getPharmacyById(String pharmacyId) async {
    final doc = await _firebaseService.firestore.collection('pharmacies').doc(pharmacyId).get();
    if (doc.exists) {
      return Pharmacy.fromFirestore(doc.data()!, doc.id);
    }
    return null;
  }

  // Implement functions for pharmacy registration and updating inventory
}