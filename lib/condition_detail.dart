import 'package:flutter/material.dart';

class ConditionDetailPage extends StatelessWidget {
  const ConditionDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Condition Details'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.deepPurple,
          ),
          child: const Text('Back to Home'),
        ),
      ),
    );
  }
}
