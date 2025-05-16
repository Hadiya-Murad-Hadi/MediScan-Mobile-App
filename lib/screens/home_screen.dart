import 'package:flutter/material.dart';
import 'package:mediscan/screens/medications_screen.dart';
import 'package:mediscan/screens/emergency_pill_identifier_screen.dart';
import 'package:mediscan/screens/profile_settings_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  // void _onItemTapped(int index) {
  //   setState(() {
  //     _selectedIndex = index;
  //   });
    Widget _getBody() {
    switch (_selectedIndex) {
      case 0:
        return Container(); // Empty container for home
      case 1:
        return const MedicationsScreen();
      case 2:
        return const EmergencyPillIdentifierScreen();
      case 3:
        return const ProfileSettingsScreen();
      default:
        return Container();
    }
  }

    void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // void _navigateToScreen(String routeName) {
  //   Navigator.pushNamed(context, routeName);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Padding(
          padding: EdgeInsets.only(left: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Hello, Hadiya!',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              Text(
                "Let's check your plan for today",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: CircleAvatar(
              backgroundImage: const AssetImage('assets/images/phar.jpeg'),
              radius: 20,
              backgroundColor: Colors.grey[300],
              //child: const Icon(Icons.person, color: Colors.blue),
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xFF6750A4),
              ),
              child: Text(
                'MediScan Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.lightbulb),
              title: const Text('Smart Reminders'),
              onTap: () {
                Navigator.pushNamed(context, '/smartReminders');
                //Navigator.pop(context); // Close the drawer
              },
            ),
            ListTile(
              leading: const Icon(Icons.sick),
              title: const Text('Symptom Tracker'),
              onTap: () {
                Navigator.pushNamed(context, '/symptomTracker');
                //Navigator.pop(context); // Close the drawer
              },
            ),
            ListTile(
              leading: const Icon(Icons.local_pharmacy),
              title: const Text('Pharmacy Locator'),
              onTap: () {
                Navigator.pushNamed(context, '/pharmacies');
                //Navigator.pop(context); // Close the drawer
              },
            ),
          ],
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/mediscan.jpg'), // Replace with your image
            fit: BoxFit.cover, // Adjust the fit as needed
          ),
        ),
        child: _getBody(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.medication, color: Color.fromARGB(255, 54, 222, 244)),
            label: 'Medications',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.emergency, color: Colors.red),
            label: 'SOS',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, color: Color.fromARGB(255, 54, 222, 244)),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: const Color(0xFF6750A4),
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}