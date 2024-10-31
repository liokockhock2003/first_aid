import 'symptomchecker.dart';
import 'package:flutter/material.dart';
import 'main.dart';

class NearestHospitalsPage extends StatefulWidget {
  const NearestHospitalsPage({super.key});

  @override
  _NearestHospitalsPageState createState() => _NearestHospitalsPageState();
}

class _NearestHospitalsPageState extends State<NearestHospitalsPage> {
  final List<Map<String, String>> _hospitalList = [
    {
      'name': 'Hospital Kajang',
      'distance': '2 km',
      'phone': '+60192667383',
      'location': '3.1253, 101.6890',
    },
    {
      'name': 'Klinik Shamsara',
      'distance': '1.6 km',
      'phone': '+60112305560',
      'location': '3.1200, 101.6800',
    },
  ];

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if (index == 3) { // If "Symptom" is tapped
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const SymptomCheckerPage()),
        );
      } else if (index == 0) { // If "Home" is tapped
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const MyHomePage(title: 'login page',)),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60.0),
        child: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.deepPurple, Colors.blue],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          title: const Text('Map', style: TextStyle(fontSize: 24, color: Colors.white)),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
      ),
      body: Stack(
        children: [
          // Load your static image here
          Image.asset(
            'assets/images/img.png', // Ensure this path is correct
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 200,
              color: Colors.white,
              child: ListView.builder(
                itemCount: _hospitalList.length,
                itemBuilder: (context, index) {
                  var hospital = _hospitalList[index];
                  return ListTile(
                    leading: const Icon(Icons.local_hospital, color: Colors.red),
                    title: Text(hospital['name']!),
                    subtitle: Text('Distance: ${hospital['distance']}'),
                    trailing: ElevatedButton(
                      onPressed: () {
                        // Implement functionality to navigate or provide more info
                      },
                      child: Text('${hospital['distance']}'),
                    ),
                    onTap: () {
                      // Implement call feature
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home, size: 26),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map, size: 26),
            label: 'Map',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.play_circle, size: 26),
            label: 'Play',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.sick, size: 26),
            label: 'Symptom',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.error, size: 26),
            label: 'Alert',
          ),
        ],
        selectedItemColor: Colors.deepPurple,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }
}
