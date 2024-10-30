import 'package:firstaid/symptomchecker.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

import 'main.dart';

class NearestHospitalsPage extends StatefulWidget {
  const NearestHospitalsPage({super.key});

  @override
  _NearestHospitalsPageState createState() => _NearestHospitalsPageState();
}

class _NearestHospitalsPageState extends State<NearestHospitalsPage> {
  late GoogleMapController _mapController;
  LatLng _initialPosition = const LatLng(3.1390, 101.6869); // Default to Kuala Lumpur
  final List<Marker> _hospitalMarkers = [];
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
      } else if (index == 0) { // If "Symptom" is tapped
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const MyHomePage(title: 'login page',)),);
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _setHospitalMarkers();
    _getCurrentLocation();
  }

  void _getCurrentLocation() async {
    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    setState(() {
      _initialPosition = LatLng(position.latitude, position.longitude);
    });
  }

  void _setHospitalMarkers() {
    for (var hospital in _hospitalList) {
      var coords = hospital['location']!.split(',');
      double lat = double.parse(coords[0]);
      double lng = double.parse(coords[1]);

      _hospitalMarkers.add(
        Marker(
          markerId: MarkerId(hospital['name']!),
          position: LatLng(lat, lng),
          infoWindow: InfoWindow(
            title: hospital['name'],
            snippet: '${hospital['distance']} away',
          ),
        ),
      );
    }
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
          title: const Text('Map', style: TextStyle(fontSize: 24, color: Colors.white)), // Set text color to white
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
      ),
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: CameraPosition(
              target: _initialPosition,
              zoom: 14.0,
            ),
            markers: Set.from(_hospitalMarkers),
            onMapCreated: (GoogleMapController controller) {
              _mapController = controller;
            },
            myLocationEnabled: true,
            myLocationButtonEnabled: true,
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
                        _mapController.animateCamera(CameraUpdate.newLatLng(
                          LatLng(
                            double.parse(hospital['location']!.split(',')[0]),
                            double.parse(hospital['location']!.split(',')[1]),
                          ),
                        ));
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
