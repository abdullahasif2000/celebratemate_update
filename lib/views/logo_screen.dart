import 'package:flutter/material.dart';
import 'package:celebratemate/views/login_screen.dart'; // Import the LoginScreen

class LogoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to the LoginScreen when tapped
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (BuildContext context) => LoginScreen()),
        );
      },
      child: Scaffold(
        backgroundColor: Colors.black, // Set background color to black
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/background5.jpg'), // Replace 'background_image.jpg' with your actual image asset path
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/logo.png', // Replace 'your_logo.png' with your actual logo asset path
                  width: 200, // Adjust width as needed
                  height: 200, // Adjust height as needed
                ),
                SizedBox(height: 20),
                Text(
                  'CelebrateMate', // Add your app name or any text as needed
                  style: TextStyle(
                      fontSize: 29,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueAccent // Set text color to white
                  ),
                ),
                SizedBox(height: 10), // Add space for subtext
                Text(
                  'Bringing your visons to life', // Add your subtext here
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.blueAccent, // Set text color to white
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
