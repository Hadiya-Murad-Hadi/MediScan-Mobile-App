import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:mediscan/routes/app_routes.dart';
import 'package:mediscan/theme/app_theme.dart';
import 'package:mediscan/screens/home_screen.dart';
import 'package:mediscan/screens/medications_screen.dart';
import 'package:mediscan/screens/emergency_pill_identifier_screen.dart';
import 'package:mediscan/screens/profile_settings_screen.dart';
import 'package:mediscan/screens/smart_reminders_screen.dart';
import 'package:mediscan/screens/symptom_tracker_screen.dart';
import 'package:mediscan/screens/pharmacies_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MediScan',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/medications': (context) => const MedicationsScreen(),
        '/emergency': (context) => const EmergencyPillIdentifierScreen(),
        '/profile': (context) => const ProfileSettingsScreen(),
        '/smartReminders': (context) =>  SmartRemindersScreen(),
        '/symptomTracker': (context) => const SymptomTrackerScreen(),
        '/pharmacies': (context) => const PharmaciesScreen(),
      },
    );
  }
}


