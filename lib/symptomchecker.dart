import 'package:flutter/material.dart';

class SymptomCheckerPage extends StatelessWidget {
  const SymptomCheckerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Symptom Checker'),
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
