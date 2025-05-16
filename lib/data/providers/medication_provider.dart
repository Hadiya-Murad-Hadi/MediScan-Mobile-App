// Instruction: This provider manages the list of user medications using the MedicationRepository

import 'package:flutter/material.dart';
import '../../data/repositories/medication_repository.dart';
import '../models/medication.dart';

class MedicationProvider extends ChangeNotifier {
  final MedicationRepository _medicationRepository;
  List<Medication> _medications = [];

  MedicationProvider(this._medicationRepository);

  List<Medication> get medications => _medications;

  Future<void> fetchUserMedications(String userId) async {
    _medicationRepository.getUserMedications(userId).listen((meds) {
      _medications = meds;
      notifyListeners();
    });
  }

  Future<void> addMedication(Medication medication) async {
    await _medicationRepository.addMedication(medication);
  }

  Future<void> updateMedication(Medication medication) async {
    await _medicationRepository.updateMedication(medication);
  }

  Future<void> deleteMedication(String medicationId) async {
    await _medicationRepository.deleteMedication(medicationId);
  }

  // Implement logic for marking doses as taken and handling reminders
}