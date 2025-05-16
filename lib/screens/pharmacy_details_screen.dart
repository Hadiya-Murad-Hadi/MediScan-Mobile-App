import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart'; // Import google_maps_flutter
import 'package:url_launcher/url_launcher.dart'; // Import url_launcher

class PharmacyDetailsScreen extends StatefulWidget {
  // Receive pharmacy data as parameter
  final Map<String, dynamic> pharmacy;

  const PharmacyDetailsScreen({Key? key, required this.pharmacy}) : super(key: key);

  @override
  State<PharmacyDetailsScreen> createState() => _PharmacyDetailsScreenState();
}

class _PharmacyDetailsScreenState extends State<PharmacyDetailsScreen> {
  // Get pharmacy latitude
  double get latitude => widget.pharmacy['latitude'];

  // Get pharmacy longitude
  double get longitude => widget.pharmacy['longitude'];

  // Get pharmacy name
  String get pharmacyName => widget.pharmacy['name'];

  // Get pharmacy address
  String get pharmacyAddress => widget.pharmacy['address'];

  // Get pharmacy phone number
  String get pharmacyPhoneNumber => widget.pharmacy['phoneNumber'];

  // Initial camera position for the map
  late CameraPosition _kPharmacyPosition;

  // Set of markers for the map
  Set<Marker> _markers = {};

  @override
  void initState() {
    super.initState();

    _kPharmacyPosition = CameraPosition(
      target: LatLng(latitude, longitude), // Pharmacy location
      zoom: 15,
    );

    // Initialize markers from pharmacy data
    _markers = {
      Marker(
        markerId: MarkerId(pharmacyName),
        position: LatLng(latitude, longitude),
        infoWindow: InfoWindow(title: pharmacyName, snippet: pharmacyAddress),
      ),
    };
  }

  // Function to launch Google Maps directions
  Future<void> _launchDirections() async {
    final String googleMapsUrl =
        'https://www.google.com/maps/dir/?api=1&destination=$latitude,$longitude&destination_place_id=${widget.pharmacy['placeId']}';
    final Uri _url = Uri.parse(googleMapsUrl);
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }

  // Function to make a phone call
  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    if (await canLaunchUrl(launchUri)) {
      await launchUrl(launchUri);
    } else {
      throw Exception('Could not launch $launchUri');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pharmacy Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: <Widget>[
            // Pharmacy Name
            Text(
              pharmacyName,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            // Full Address
            Text(
              pharmacyAddress,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 10),
            // Phone Number
            InkWell(
              child: Text(
                pharmacyPhoneNumber,
                style: const TextStyle(fontSize: 16, color: Colors.blue),
              ),
              onTap: () {
                _makePhoneCall(pharmacyPhoneNumber);
              },
            ),
            const SizedBox(height: 20),
            // Map View
            SizedBox(
              height: 200,
              child: GoogleMap(
                mapType: MapType.normal,
                initialCameraPosition: _kPharmacyPosition,
                markers: _markers,
                onMapCreated: (GoogleMapController controller) {
                  // TODO: Implement map controller logic
                },
              ),
            ),
            const SizedBox(height: 20),
            // Services Information
            const Text(
              'Services',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const Text(
              'TODO: Add services information here',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            // Medication Stock List (Optional)
            const Text(
              'Medication Stock List (Optional)',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const Text(
              'TODO: Add medication stock list here',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            // Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    // TODO: Implement Request Refill functionality
                    // Add logic to request refill here
                  },
                  child: const Text('Request Refill'),
                ),
                ElevatedButton(
                  onPressed: () {
                    _launchDirections();
                  },
                  child: const Text('Directions'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}