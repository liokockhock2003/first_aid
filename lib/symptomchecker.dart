import 'package:flutter/material.dart';
import 'criticalemergency.dart';

class SymptomCheckerPage extends StatefulWidget {
  const SymptomCheckerPage({super.key});

  @override
  _SymptomCheckerPageState createState() => _SymptomCheckerPageState();
}

class _SymptomCheckerPageState extends State<SymptomCheckerPage> {
  int _selectedIndex = 3; // Default to 'Symptom' tab being selected

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // Update the selected index
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60.0), // Adjust the height of the app bar
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
          title: const Image(
            image: AssetImage('assets/images/rash.png'),
            height: 40,
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
          backgroundColor: Colors.transparent, // Make the AppBar transparent to see the gradient
          elevation: 0, // Remove the AppBar shadow to get a clean gradient look
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildSymptomCard(
              context,
              'Headache',
              'A common symptom that can be caused by many factors such as stress, dehydration, or other illnesses.',
              'Common',
              0.7, // A visual representation of rarity (0.0 - 1.0 scale)
              'assets/images/symptom_image.png', // Add the actual image path
            ),
            const SizedBox(height: 16),
            _buildSymptomCard(
              context,
              'Fever',
              'A rise in body temperature, usually a sign of infection or illness.',
              'Rare',
              0.4, // Example rarity representation
              'assets/images/fever_image.png', // Add the actual image path
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex, // Set the current selected index
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
        selectedItemColor: Colors.deepPurple, // Color for the selected item
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped, // Handle icon tap action
      ),
    );
  }

  Widget _buildSymptomCard(BuildContext context, String name, String description, String rarity, double rarityValue, String imagePath) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Symptom: $name',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    description,
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      const Text(
                        'Rarity: ',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Expanded(
                        child: LinearProgressIndicator(
                          value: rarityValue, // Progress bar to represent rarity
                          color: Colors.green,
                          backgroundColor: Colors.grey[300],
                          minHeight: 8,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        rarity,
                        style: const TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(width: 16),
            Image(
              image: AssetImage(imagePath),
              height: 80,
              width: 80,
              fit: BoxFit.cover,
            ),
          ],
        ),
      ),
    );
  }
}
