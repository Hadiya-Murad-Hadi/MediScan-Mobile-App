import 'package:flutter/material.dart';

class ProfileSettingsScreen extends StatefulWidget {
  const ProfileSettingsScreen({Key? key}) : super(key: key);

  @override
  State<ProfileSettingsScreen> createState() => _ProfileSettingsScreenState();
}

class _ProfileSettingsScreenState extends State<ProfileSettingsScreen> {
  // Sample data for user profile (replace with your actual data source)
  final Map<String, dynamic> _userProfile = {
    'name': 'Hadiya',
    'picture': 'https://example.com/profile_picture.jpg', // Replace with your image URL
    'guardianContact': 'Hadi Murad - (123) 456-7890',
    'allergies': ['Parhaye', 'Boooks'],
    'conditions': ['Asthma', 'Diabetes', 'Astagfirullah'],
    'reminderTone': 'Default',
    'appLanguage': 'English',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile & Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: <Widget>[
            // User's name/picture
            Row(
              children: <Widget>[
                CircleAvatar(
                  radius: 40,
                  backgroundImage: NetworkImage(_userProfile['picture']),
                ),
                const SizedBox(width: 20),
                Text(
                  _userProfile['name'],
                  style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 20),
            // Edit Profile Button
            ElevatedButton(
  onPressed: () {
    Navigator.pushNamed(context, '/editProfile');
  },
  child: const Text('Edit Profile'),
),
            const SizedBox(height: 20),
            // Guardian Contact info
            const Text(
              'Guardian Contact',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              _userProfile['guardianContact'],
              style: const TextStyle(fontSize: 16),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/addEditGuardian');
              },
              child: const Text('Add/Edit Guardian'),
            ),
            const SizedBox(height: 20),
            // Allergies/Conditions list
            const Text(
              'Allergies',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: _userProfile['allergies'].map<Widget>((allergy) {
                return Text(
                  '- $allergy',
                  style: const TextStyle(fontSize: 16),
                );
              }).toList(),
            ),
            const Text(
              'Conditions',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: _userProfile['conditions'].map<Widget>((condition) {
                return Text(
                  '- $condition',
                  style: const TextStyle(fontSize: 16),
                );
              }).toList(),
            ),
            

ElevatedButton(
  onPressed: () {
    Navigator.pushNamed(context, '/addEditAllergiesConditions');
  },
  child: const Text('Add/Edit Allergies/Conditions'),
),
            const SizedBox(height: 20),
            // Reminder tone selection
            const Text(
              'Reminder Tone',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              _userProfile['reminderTone'],
              style: const TextStyle(fontSize: 16),
            ),
            // TODO: Implement Reminder tone selection UI
            const SizedBox(height: 20),
            // App language selection
            const Text(
              'App Language',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              _userProfile['appLanguage'],
              style: const TextStyle(fontSize: 16),
            ),
            // TODO: Implement App language selection UI
            const SizedBox(height: 20),
            // Permissions management
            const Text(
              'Permissions',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            // TODO: Implement Permissions management UI
            const SizedBox(height: 20),
            // Logout Button
            ElevatedButton(
              onPressed: () {
                // TODO: Implement Logout functionality
                // Add logic to log the user out of the app
              },
              child: const Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}