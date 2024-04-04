import 'package:flutter/material.dart';

class PhotographersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue, // Set background color to blue
        title: Text(
          'Photographers',
          style: TextStyle(color: Colors.white), // Set text color to white
        ),
        centerTitle: true, // Align title to the center
      ),
      body: Center(
        child: Text('This is the Photographers screen that lists photographers.'),
      ),
    );
  }
}
