// //navigation configuration

import 'package:flutter/material.dart';
import 'package:mediscan/screens/welcome_screen.dart';
import 'package:mediscan/screens/home_screen.dart';
import 'package:mediscan/screens/medications_screen.dart';
import 'package:mediscan/screens/add_medication_screen.dart';
import 'package:mediscan/screens/edit_medication_screen.dart';
import 'package:mediscan/screens/smart_reminders_screen.dart';
import 'package:mediscan/screens/symptom_tracker_screen.dart';
import 'package:mediscan/screens/pharmacies_screen.dart';
import 'package:mediscan/screens/pharmacy_details_screen.dart'; 
import 'package:mediscan/screens/emergency_pill_identifier_screen.dart';
import 'package:mediscan/screens/pill_identification_result_screen.dart';
import 'package:mediscan/screens/profile_settings_screen.dart';
import 'package:mediscan/screens/edit_profile_screen.dart';
import 'package:mediscan/screens/add_edit_allergies_screen.dart';
import 'package:mediscan/screens/add_edit_guardian_screen.dart';
import 'package:mediscan/screens/guardian_auth_screen.dart'; 
import 'package:mediscan/screens/guardian_dashboard_screen.dart'; 
import 'package:mediscan/screens/patient_details_screen.dart';
import 'package:mediscan/screens/pharmacy_auth_screen.dart'; 
import 'package:mediscan/screens/pharmacy_portal_dashboard_screen.dart'; 
import 'package:mediscan/screens/add_edit_medication_inventory_screen.dart'; 
import 'package:mediscan/screens/refill_requests_screen.dart'; 
import 'package:mediscan/screens/pharmacy_profile_settings_screen.dart';
import 'package:mediscan/screens/auth_screen.dart';

class AppRoutes {
  static const String welcome = '/';
  static const String home = '/home';
  static const String medications = '/medications';
  static const String addMedication = '/addMedication';
  static const String editMedication = '/editMedication';
  static const String smartReminders = '/smartReminders';
  static const String symptomTracker = '/symptomTracker';
  static const String pharmacies = '/pharmacies';
  static const String pharmacyDetails = '/pharmacyDetails';
  static const String emergencyPillIdentifier = '/emergencyPillIdentifier';
  static const String pillIdentificationResult = '/pillIdentificationResult';
  static const String profileSettings = '/profileSettings';
  static const String editProfile = '/editProfile';
  static const String addEditAllergies = '/addEditAllergies';
  static const String addEditGuardian = '/addEditGuardian';
  static const String guardianAuth = '/guardianAuth';
  static const String guardianDashboard = '/guardianDashboard';
  static const String patientDetails = '/patientDetails';
  static const String pharmacyAuth = '/pharmacyAuth'; 
  static const String pharmacyPortalDashboard = '/pharmacyPortalDashboard';
  static const String addEditMedicationInventory = '/addEditMedicationInventory';
  static const String refillRequests = '/refillRequests'; 
  static const String pharmacyProfileSettings = '/pharmacyProfileSettings'; 
  static const String auth = '/auth';

  


  static Map<String, WidgetBuilder> routes = {
    welcome: (context) => const WelcomeScreen(),
    home: (context) => const HomeScreen(),
    medications: (context) => const MedicationsScreen(),
    addMedication: (context) => const AddMedicationScreen(), 
    editMedication: (context) => EditMedicationScreen(medication: {}),
    smartReminders: (context) =>  SmartRemindersScreen(),
    symptomTracker: (context) => const SymptomTrackerScreen(),
    pharmacies: (context) => const PharmaciesScreen(),
    pharmacyDetails: (context) => PharmacyDetailsScreen(pharmacy: {}),
    emergencyPillIdentifier: (context) => const EmergencyPillIdentifierScreen(),
    pillIdentificationResult: (context) =>  PillIdentificationResultScreen(),
    profileSettings: (context) => const ProfileSettingsScreen(),
    editProfile: (context) => const EditProfileScreen(),
    addEditAllergies: (context) => const AddEditAllergiesConditionsScreen(),
    addEditGuardian: (context) => const AddEditGuardianScreen(),
    guardianAuth: (context) => const GuardianAuthScreen(),
    guardianDashboard: (context) => GuardianDashboardScreen(),
    patientDetails: (context) => const PatientDetailsScreen(patient: {},),
    pharmacyAuth: (context) => const PharmacyAuthScreen(), 
    pharmacyPortalDashboard: (context) => const PharmacyPortalDashboardScreen(), 
    addEditMedicationInventory: (context) => const AddEditMedicationInventoryScreen(),
    refillRequests: (context) =>  RefillRequestsScreen(), 
    pharmacyProfileSettings: (context) => const PharmacyProfileSettingsScreen(),
    auth: (context) => const AuthScreen(),
  };

  static String initial = welcome;
}