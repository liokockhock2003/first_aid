import 'package:first_aid/symptomchecker.dart';
import 'package:flutter/material.dart';

import 'main.dart';

class FirstAidVideoGuidePage extends StatefulWidget {
  @override
  _FirstAidVideoGuidePageState createState() => _FirstAidVideoGuidePageState();
}

class _FirstAidVideoGuidePageState extends State<FirstAidVideoGuidePage> {
  // Example state variables that might be used in this page
  bool isVideoPlaying = false; // This can be used to track video play state
  int selectedVideoIndex = -1; // Track the currently selected video

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
          title: const Text('First Aid Diagnostic', style: TextStyle(fontSize: 24, color: Colors.white)), // Set text color to white
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: videoGuides.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title: Text(videoGuides[index]['title']!),
                    subtitle: Text("Duration: ${videoGuides[index]['duration']}"),
                    trailing: IconButton(
                      icon: Icon(isVideoPlaying && selectedVideoIndex == index ? Icons.pause : Icons.play_arrow),
                      onPressed: () {
                        setState(() {
                          if (selectedVideoIndex == index) {
                            // Toggle play/pause for the same video
                            isVideoPlaying = !isVideoPlaying;
                          } else {
                            // Play new video and set selected index
                            isVideoPlaying = true;
                            selectedVideoIndex = index;
                          }
                        });
                      },
                    ),
                  ),
                );
              },
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

  // Example list of video guides for display purposes
  final List<Map<String, String>> videoGuides = [
    {'title': 'Make CPR', 'duration': '10 min'},
    {'title': 'Stop Bleeding', 'duration': '5 min'},
  ];
}
