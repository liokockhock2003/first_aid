import 'package:flutter/material.dart';
import 'criticalemergency.dart'; // Add this import at the top

class CriticalEmergencyPage extends StatefulWidget {
  const CriticalEmergencyPage({super.key});

  @override
  _CriticalEmergencyPageState createState() => _CriticalEmergencyPageState();
}

class _CriticalEmergencyPageState extends State<CriticalEmergencyPage> {
  bool _isExpanded = false;

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
          leading: IconButton(
            icon: const Icon(Icons.notifications, size: 28, color: Colors.white),
            onPressed: () {
              // Handle notification action
            },
          ),
          title: const Text(
            'Critical Emergency',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          actions: [
            IconButton(
              icon: const Icon(Icons.account_circle, size: 28, color: Colors.white),
              onPressed: () {
                // Handle profile action
              },
            ),
          ],
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
      ),
      body: Center(
        child: GestureDetector(
          onTap: () {
            setState(() {
              _isExpanded = !_isExpanded;
            });
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            width: _isExpanded ? 200 : 120,
            height: _isExpanded ? 200 : 120,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.red,
            ),
            child: Center(
              child: Text(
                _isExpanded ? '' : 'SOS',
                style: const TextStyle(fontSize: 24, color: Colors.white),
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
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
        onTap: (int index) {
          if (index == 0) {
            // Navigate to Home (replace with your home page)
          } else if (index == 1) {
            // Navigate to Map (replace with your map page)
          } else if (index == 2) {
            // Navigate to Play (replace with your play page)
          } else if (index == 3) {
            // Navigate back to SymptomCheckerPage
            Navigator.pop(context);
          } else if (index == 4) {
            // Optionally, navigate to a different alert page or do nothing
          }
        },
      ),
    );
  }
}

class EmergencyCircle extends StatelessWidget {
  final IconData icon;

  const EmergencyCircle({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.grey,
      ),
      child: Icon(icon, color: Colors.black),
    );
  }
}
