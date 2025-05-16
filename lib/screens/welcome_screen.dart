import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE6E6FA), // Lavender background
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            spacing: 10,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
                
              Container(
                width: 200,
                height: 200,
                decoration: const BoxDecoration(
                  // Replace with your actual image asset
                  image: DecorationImage(
                    image: AssetImage('assets/images/pill_bottle.png.jpg'),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              // MedsControl Text
              const Text(
                'MedsControl',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF4B0082), 
                ),
              ),
              const SizedBox(height: 10),
             
              const Text(
                'Be in control of your meds',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              // Get Started Button
              ElevatedButton(
                onPressed: () {
                  // Navigate to the home screen
                  Navigator.pushNamed(context, '/home');
                  Navigator.pushNamed(context, '/auth');
                // Add any additional logic here if needed
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF6750A4), // Deep purple
                  padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  textStyle: const TextStyle(fontSize: 18),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text(
                  'Get started',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: (){
                  Navigator.pushNamed(context, '/guardianAuth');
                },
                child: const Text('Go to Guardian Login/Sign Up'),
                ),
              
              const SizedBox(height: 20),
              // Already have an account? Sign in
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    'Already have an account?',
                    style: TextStyle(fontSize: 14),
                  ),
                  TextButton(
                    onPressed: () {
                      // Navigate to the sign-in screen
                    },
                    child: const Text(
                      'Sign in',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF6750A4), // Deep purple
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}