import 'package:flutter/material.dart';
import 'verification_screen.dart'; // Import the verification screen
import 'forgetpassword_screen.dart'; // Import the forget password screen

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          'Login',
          style: TextStyle(
            color: Colors.white, // Set text color to white
            fontWeight: FontWeight.w600,
            fontSize: 27,
          ),
        ),
        centerTitle: true, // Center align the app bar title
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Welcome back, user',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 30),
              Text(
                'Your event is just a step ahead',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              SizedBox(height: 30),
              TextField(
                controller: _usernameController,
                decoration: InputDecoration(
                  labelText: 'Username',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0), // Rounded border
                  ),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0), // Rounded border
                  ),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Navigate to the verification screen
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => VerificationScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0), // Rounded border
                  ),
                ),
                child: Text('Login', style: TextStyle(color: Colors.white)), // Set text color to white
              ),
              SizedBox(height: 10),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    // Navigate to the forget password screen
                    context,
                    MaterialPageRoute(builder: (context) => ForgetPasswordScreen()),
                  );
                },
                child: Text('Forgot Password?', style: TextStyle(color: Colors.red)), // Set text color to red
              ),
            ],
          ),
        ),
      ),
    );
  }
}
