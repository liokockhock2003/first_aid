import 'package:flutter/material.dart';
import 'symptomchecker.dart';
import 'criticalemergency.dart';
import 'edit_profile.dart';
import 'home.dart';
import 'condition_detail.dart'; // Import the new ConditionDetailPage

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Symptom Checker App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
<<<<<<< Updated upstream
      home: const MyHomePage(title: 'Login Page'),
=======
      // home: FirstAidDiagnosticPage(),
>>>>>>> Stashed changes
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscurePassword = true;
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if (index == 3) { // Navigate to Profile Page
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ProfilePage()),
        );
      } else if (index == 4) { // Navigate to Condition Detail Page
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ConditionDetailPage()),
        );
      }
    });
  }

  void _login() {
    String username = _usernameController.text;
    String password = _passwordController.text;

    print('Username: $username, Password: $password');

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SymptomCheckerPage()),
    );
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
          title: const Text('Login', style: TextStyle(fontSize: 24, color: Colors.white)),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Welcome to the Symptom Checker App',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
              _buildRoundedInputField(
                controller: _usernameController,
                labelText: 'Username',
              ),
              const SizedBox(height: 20),
              _buildRoundedInputField(
                controller: _passwordController,
                labelText: 'Password',
                obscureText: _obscurePassword,
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscurePassword ? Icons.visibility : Icons.visibility_off,
                    color: Colors.grey,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscurePassword = !_obscurePassword;
                    });
                  },
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _login,
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text('Login'),
              ),
            ],
          ),
        ),
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
            icon: Icon(Icons.account_circle, size: 26),
            label: 'Profile',
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

  Widget _buildRoundedInputField({
    required TextEditingController controller,
    required String labelText,
    bool obscureText = false,
    Widget? suffixIcon,
  }) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: labelText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(color: Colors.deepPurple),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(color: Colors.deepPurple),
        ),
        suffixIcon: suffixIcon,
      ),
    );
  }
}
