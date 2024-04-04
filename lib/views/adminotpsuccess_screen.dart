import 'package:flutter/material.dart';
import 'enterdetail_screen.dart'; // Import the EnterDetailScreen widget

class AdminOTPSuccessScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Verification Success',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.blueGrey, // Set app bar background color
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/CelebrateMate_Exclusive.jpg', // Specify the path to your image
              width: 150, // Set width of the image
              height: 150, // Set height of the image
            ),
            SizedBox(height: 20),
            Center(
              child: Text(
                'Your account has been verified successfully!',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center, // Align text to center
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigate to the EnterDetailScreen when the button is pressed
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => EnterDetailScreen()), // Replace EnterDetailScreen with your desired screen
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black, // Set button background color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              child: Text(
                'Next',
                style: TextStyle(
                  color: Colors.white, // Set text color to white
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: AdminOTPSuccessScreen(),
  ));
}
