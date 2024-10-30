import 'package:flutter/material.dart';

class FirstAidVideoGuidePage extends StatelessWidget {
  final List<Map<String, dynamic>> guides = [
    {
      'title': 'Make CPR',
      'steps': ['Step 1: Check responsiveness', 'Step 2: Start chest compressions', 'Step 3: Give rescue breaths'],
      'duration': '10 min',
    },
    {
      'title': 'Stop Bleeding',
      'steps': ['Step 1: Apply pressure', 'Step 2: Elevate the limb'],
      'duration': '5 min',
    },
    // Add more guides as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Aid Video Guide'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search for a guide...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(onPressed: () {}, child: Text('CPR')),
                ElevatedButton(onPressed: () {}, child: Text('Bleeding')),
                ElevatedButton(onPressed: () {}, child: Text('Choking')),
                ElevatedButton(onPressed: () {}, child: Text('Burns')),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: guides.length,
              itemBuilder: (context, index) {
                final guide = guides[index];
                return Card(
                  margin: const EdgeInsets.all(8.0),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${index + 1}. ${guide['title']}',
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 8),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: (guide['steps'] as List<String>)
                              .map((step) => Text(step, style: TextStyle(fontSize: 16)))
                              .toList(),
                        ),
                        SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Text('Duration: ${guide['duration']}'),
                                SizedBox(width: 10),
                                ElevatedButton(
                                  onPressed: () {
                                    // Toggle between text and video views
                                  },
                                  child: Row(
                                    children: [
                                      Icon(Icons.text_snippet),
                                      Text('Text'),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            IconButton(
                              icon: Icon(Icons.play_circle_fill, size: 40),
                              onPressed: () {
                                // Navigate to video player page
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
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
