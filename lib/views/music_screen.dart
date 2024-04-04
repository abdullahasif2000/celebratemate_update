import 'package:flutter/material.dart';

class MusicScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue, // Set background color to blue
        title: Text(
          'Music',
          style: TextStyle(color: Colors.white), // Set text color to white
        ),
        centerTitle: true, // Align title to the center
      ),
      body: Center(
        child: Text('This is the Music screen that lists the all the music provider.'),
      ),
    );
  }
}
