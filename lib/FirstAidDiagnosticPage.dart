import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:http/http.dart' as http;

class FirstAidDiagnosticPage extends StatefulWidget {
  @override
  _FirstAidDiagnosticPageState createState() => _FirstAidDiagnosticPageState();
}

class _FirstAidDiagnosticPageState extends State<FirstAidDiagnosticPage> {
  File? _image;
  final ImagePicker _picker = ImagePicker();

  Future<void> _takePicture() async {
    final XFile? photo = await _picker.pickImage(source: ImageSource.camera);
    if (photo != null) {
      setState(() {
        _image = File(photo.path);
      });
      _analyzeImage(File(photo.path));
    }
  }

  Future<void> _analyzeImage(File image) async {
    final url = 'https://api.gemini.com/v1/analyze'; // Placeholder URL
    final request = http.MultipartRequest('POST', Uri.parse(url));
    request.files.add(await http.MultipartFile.fromPath('file', image.path));

    try {
      final response = await request.send();
      if (response.statusCode == 200) {
        final responseData = await response.stream.bytesToString();
        // Process responseData for injury detection and solutions
      } else {
        print('Analysis failed with status: ${response.statusCode}');
      }
    } catch (e) {
      print('Error uploading image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Aid Diagnostic'),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
              // Notification functionality
            },
          ),
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () {
              // User profile functionality
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: _takePicture,
                child: Text('Take Picture'),
              ),
              SizedBox(width: 10),
              ElevatedButton(
                onPressed: () {
                  // Optionally implement alphabetical sorting functionality
                },
                child: Text('Alphabetically'),
              ),
            ],
          ),
          SizedBox(height: 20),
          Center(
            child: _image == null
                ? Text('No image selected.')
                : Image.file(_image!),
          ),
          SizedBox(height: 20),
          Text(
            'Detected Injury: ',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          // Display the detected injury information and first aid suggestions
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.map), label: 'Map'),
          BottomNavigationBarItem(icon: Icon(Icons.play_circle), label: 'Play'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          BottomNavigationBarItem(icon: Icon(Icons.warning), label: 'Alert'),
        ],
      ),
    );
  }
}
