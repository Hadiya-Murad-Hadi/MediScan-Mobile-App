// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart'; // Import image_picker
// import 'dart:io'; // Import dart:io

// class EmergencyPillIdentifierScreen extends StatefulWidget {
//   const EmergencyPillIdentifierScreen({Key? key}) : super(key: key);

//   @override
//   State<EmergencyPillIdentifierScreen> createState() => _EmergencyPillIdentifierScreenState();
// }

// class _EmergencyPillIdentifierScreenState extends State<EmergencyPillIdentifierScreen> {
//   // Image Picker instance
//   final ImagePicker _picker = ImagePicker();

//   // Store the selected image
//   File? _image;

//   // Identification History list (replace with your actual data source)
//   final List<Map<String, String>> _identificationHistory = [
//     {'date': '2024-01-01', 'pillName': 'Aspirin'},
//     {'date': '2024-01-05', 'pillName': 'Vitamin C'},
//   ];

//   // Function to take a photo
//   Future<void> _takePhoto() async {
//     final XFile? image = await _picker.pickImage(source: ImageSource.camera);

//     setState(() {
//       if (image != null) {
//         _image = File(image.path);
//       } else {
//         print('No image selected.');
//       }
//     });
//   }

//   // Function to upload an image
//   Future<void> _uploadImage() async {
//     final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

//     setState(() {
//       if (image != null) {
//         _image = File(image.path);
//       } else {
//         print('No image selected.');
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Emergency & Pill Identifier'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: ListView(
//           children: <Widget>[
//             // Prominent SOS Button
//             Center(
//               child: ElevatedButton(
//                 onPressed: () {
//                   // TODO: Implement SOS functionality
//                   // Add logic to call emergency services or send a message
//                 },
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.red,
//                   padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
//                   textStyle: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//                 ),
//                 child: const Text('SOS', style: TextStyle(color: Colors.white)),
//               ),
//             ),
//             const SizedBox(height: 20),
//             // Pill Identifier Instructions
//             const Text(
//               'Pill Identifier Instructions',
//               style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//             ),
//             const Text(
//               '1. Take a clear photo of the pill.\n2. Ensure good lighting.\n3. Upload the image or take a photo using the camera.',
//               style: TextStyle(fontSize: 16),
//             ),
//             const SizedBox(height: 20),
//             // Camera view/Upload Image area
//             _image == null
//                 ? const Text('No image selected.')
//                 : Image.file(
//                     _image!,
//                     height: 200,
//                   ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: <Widget>[
//                 ElevatedButton(
//                   onPressed: () {
//                     _takePhoto();
//                   },
//                   child: const Text('Take Photo'),
//                 ),
//                 ElevatedButton(
//                   onPressed: () {
//                     _uploadImage();
//                   },
//                   child: const Text('Upload Image'),
//                 ),
//                 ElevatedButton(
//   onPressed: () async {
//     await _uploadImage();
//     // After processing the image and getting the result
//     Navigator.pushNamed(context, '/pillIdentificationResult');
//   },
//   child: const Text('Upload Image'),
// ),
//               ],
//             ),
//             const SizedBox(height: 20),
//             // Identification History list
//             const Text(
//               'Identification History',
//               style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(
//               height: 200,
//               child: ListView.builder(
//                 itemCount: _identificationHistory.length,
//                 itemBuilder: (context, index) {
//                   final item = _identificationHistory[index];
//                   return Card(
//                     margin: const EdgeInsets.symmetric(vertical: 5),
//                     child: ListTile(
//                       title: Text(item['pillName']!),
//                       subtitle: Text('Date: ${item['date']}'),
//                       onTap: () {
//                         // TODO: Implement view details functionality
//                         // Add logic to view details of the selected identification history item
//                       },
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class EmergencyPillIdentifierScreen extends StatefulWidget {
  const EmergencyPillIdentifierScreen({Key? key}) : super(key: key);

  @override
  State<EmergencyPillIdentifierScreen> createState() => _EmergencyPillIdentifierScreenState();
}

class _EmergencyPillIdentifierScreenState extends State<EmergencyPillIdentifierScreen> {
  final ImagePicker _picker = ImagePicker();
  File? _image;

  Future<void> _getImage(ImageSource source) async {
    final XFile? pickedFile = await _picker.pickImage(source: source);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
        // Navigate to the result screen after image is picked
        Navigator.pushNamed(context, '/pillIdentificationResult');
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Emergency & Pill Identifier'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: <Widget>[
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // TODO: Implement SOS functionality
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                  textStyle: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                child: const Text('SOS', style: TextStyle(color: Colors.white)),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Pill Identifier Instructions',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const Text(
              '1. Take a clear photo of the pill.\n2. Ensure good lighting.\n3. Tap the "Upload Image" button to select an image from gallery or take a photo.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            _image == null
                ? const Text('No image selected.')
                : Image.file(
                    _image!,
                    height: 200,
                  ),
            ElevatedButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return SafeArea(
                      child: Wrap(
                        children: <Widget>[
                          ListTile(
                            leading: const Icon(Icons.photo_library),
                            title: const Text('Choose from Gallery'),
                            onTap: () {
                              _getImage(ImageSource.gallery);
                              Navigator.pop(context);
                            },
                          ),
                          ListTile(
                            leading: const Icon(Icons.camera_alt),
                            title: const Text('Take a Photo'),
                            onTap: () {
                              _getImage(ImageSource.camera);
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
              child: const Text('Upload Image'),
            ),
            const SizedBox(height: 20),
            const Text(
              'Identification History',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text('No history available', style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}