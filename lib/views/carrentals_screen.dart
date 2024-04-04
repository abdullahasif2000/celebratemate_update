import 'package:flutter/material.dart';

class CarRentalsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue, // Set background color to blue
        title: Text(
          'Car Rentals',
          style: TextStyle(color: Colors.white), // Set text color to white
        ),
        centerTitle: true, // Align title to the center
      ),
      body: Center(
        child: Text('This is the Car Rentals screen that lists car rental services.'),
      ),
    );
  }
}
