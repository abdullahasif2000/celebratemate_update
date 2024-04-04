import 'package:flutter/material.dart';

class CardVendorsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue, // Set background color to blue
        title: Text(
          'Card Vendors',
          style: TextStyle(color: Colors.white), // Set text color to white
        ),
        centerTitle: true, // Align title to the center
      ),
      body: Center(
        child: Text('This is the Card Vendors screen that lists card vendors.'),
      ),
    );
  }
}
