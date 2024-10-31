// import 'package:first_aid/symptomchecker.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'dart:io';
// import 'package:http/http.dart' as http;
//
// import 'main.dart';
//
// class FirstAidDiagnosticPage extends StatefulWidget {
//   @override
//   _FirstAidDiagnosticPageState createState() => _FirstAidDiagnosticPageState();
// }
//
// class _FirstAidDiagnosticPageState extends State<FirstAidDiagnosticPage> {
//   File? _image;
//   final ImagePicker _picker = ImagePicker();
//
//   Future<void> _takePicture() async {
//     final XFile? photo = await _picker.pickImage(source: ImageSource.camera);
//     if (photo != null) {
//       setState(() {
//         _image = File(photo.path);
//       });
//       _analyzeImage(File(photo.path));
//     }
//   }
//
//   int _selectedIndex = 0;
//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//       if (index == 3) { // If "Symptom" is tapped
//         Navigator.push(
//           context,
//           MaterialPageRoute(builder: (context) => const SymptomCheckerPage()),
//         );
//       } else if (index == 0) { // If "Symptom" is tapped
//         Navigator.push(
//           context,
//           MaterialPageRoute(builder: (context) => const MyHomePage(title: 'login page',)),);
//       }
//     });
//   }
//
//   Future<void> _analyzeImage(File image) async {
//     final url = 'https://api.gemini.com/v1/analyze'; // Placeholder URL
//     final request = http.MultipartRequest('POST', Uri.parse(url));
//     request.files.add(await http.MultipartFile.fromPath('file', image.path));
//
//     try {
//       final response = await request.send();
//       if (response.statusCode == 200) {
//         final responseData = await response.stream.bytesToString();
//         // Process responseData for injury detection and solutions
//       } else {
//         print('Analysis failed with status: ${response.statusCode}');
//       }
//     } catch (e) {
//       print('Error uploading image: $e');
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: PreferredSize(
//         preferredSize: const Size.fromHeight(60.0),
//         child: AppBar(
//           flexibleSpace: Container(
//             decoration: const BoxDecoration(
//               gradient: LinearGradient(
//                 colors: [Colors.deepPurple, Colors.blue],
//                 begin: Alignment.topLeft,
//                 end: Alignment.bottomRight,
//               ),
//             ),
//           ),
//           title: const Text('First Aid Diagnostic', style: TextStyle(fontSize: 24, color: Colors.white)), // Set text color to white
//           centerTitle: true,
//           backgroundColor: Colors.transparent,
//           elevation: 0,
//         ),
//       ),
//       body: Column(
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               ElevatedButton(
//                 onPressed: _takePicture,
//                 child: Text('Take Picture'),
//               ),
//               SizedBox(width: 10),
//               ElevatedButton(
//                 onPressed: () {
//                   // Optionally implement alphabetical sorting functionality
//                 },
//                 child: Text('Alphabetically'),
//               ),
//             ],
//           ),
//           SizedBox(height: 20),
//           Center(
//             child: _image == null
//                 ? Text('No image selected.')
//                 : Image.file(_image!),
//           ),
//           SizedBox(height: 20),
//           Text(
//             'Detected Injury: ',
//             style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//           ),
//           // Display the detected injury information and first aid suggestions
//         ],
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         type: BottomNavigationBarType.fixed,
//         currentIndex: _selectedIndex,
//         items: const <BottomNavigationBarItem>[
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home, size: 26),
//             label: 'Home',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.map, size: 26),
//             label: 'Map',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.play_circle, size: 26),
//             label: 'Play',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.sick, size: 26),
//             label: 'Symptom',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.error, size: 26),
//             label: 'Alert',
//           ),
//         ],
//         selectedItemColor: Colors.deepPurple,
//         unselectedItemColor: Colors.grey,
//         onTap: _onItemTapped,
//       ),
//     );
//   }
// }
