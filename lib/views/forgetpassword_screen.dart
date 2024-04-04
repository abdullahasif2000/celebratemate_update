import 'package:flutter/material.dart';

class ForgetPasswordScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue, // Set app bar background color to blue
        centerTitle: true, // Center align the title text
        title: Text(
          'Forget Password',
          style: TextStyle(
            color: Colors.white, // Set app bar text color to white
            fontWeight: FontWeight.bold, // Set app bar text font weight to bold
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Forgot Your Password?',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center, // Center align the text horizontally
            ),
            SizedBox(height: 20.0),
            Text(
              'Enter your email address below to receive instructions on how to reset your password.',
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
            SizedBox(height: 20.0),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                // Add functionality to send password reset instructions
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white, backgroundColor: Colors.blue, // Set button text color to white
              ),
              child: Text('Send Instructions'),
            ),
          ],
        ),
      ),
    );
  }
}
