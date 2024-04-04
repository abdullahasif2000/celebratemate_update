import 'package:flutter/material.dart';
import 'enterdetail_screen.dart'; // Import the EnterDetailScreen

class InfoSavedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey, // Set app bar background color to blue
        title: Text(
          'Information Saved',
          style: TextStyle(
            color: Colors.white, // Set text color to white
            fontWeight: FontWeight.bold, // Set font weight to bold
          ),
        ),
        centerTitle: true, // Center align the title
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Congratulations!',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 24.0),
            Image.asset(
              'assets/Background_screen_infosaved.jpg', // Replace with your actual image path
              width: 200, // Adjust width as needed
              height: 200, // Adjust height as needed
              fit: BoxFit.cover, // Make sure the image covers the container
            ),
            SizedBox(height: 16.0),
            Text(
              'Your information has been saved and your venue has been updated.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
            SizedBox(height: 24.0),
            TextButton(
              onPressed: () {
                // Navigate to EnterDetailScreen when "Add Another Venue" is clicked
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => EnterDetailScreen()),
                );
              },
              child: Text(
                'If you want to add another venue, click here.',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 16.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
