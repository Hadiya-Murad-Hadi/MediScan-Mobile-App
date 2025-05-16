//CRUD operations for medications
// lib/data/repositories/medication_repository.dart

//Instruction: This repository handles medication-related data operations with Firestore.

import 'package:cloud_firestore/cloud_firestore.dart';
import '../../core/services/firebase_service.dart';
import '../models/medication.dart';

class MedicationRepository {
  final FirebaseService _firebaseService;

  MedicationRepository(this._firebaseService);

  Stream<List<Medication>> getUserMedications(String userId) {
    return _firebaseService.firestore
        .collection('medications')
        .where('userId', isEqualTo: userId)
        .snapshots()
        .map((snapshot) => snapshot.docs.map((doc) => Medication.fromFirestore(doc.data(), doc.id)).toList());
  }

  Future<void> addMedication(Medication medication) async {
    await _firebaseService.firestore.collection('medications').add(medication.toFirestore());
  }

  Future<void> updateMedication(Medication medication) async {
    await _firebaseService.firestore.collection('medications').doc(medication.id).update(medication.toFirestore());
  }

  Future<void> deleteMedication(String medicationId) async {
    await _firebaseService.firestore.collection('medications').doc(medicationId).delete();
  }

  // Implement logic for marking doses as taken and fetching reminders
}