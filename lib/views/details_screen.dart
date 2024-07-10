import 'package:flutter/material.dart';
import 'schedule.dart'; // Import the ScheduleScreen

class DetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Details',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {
              // Add onPressed logic for three dots icon
            },
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Image section
          Container(
            height: 200, // Adjust height as needed
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/venue_image.jpg'), // Replace with actual image path
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Venue description section
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Venue Description',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'Add your venue description here...',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ),
          // Contact info section
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Contact Information',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Address: Add your venue address here...',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 8),
                Text(
                  'Phone: Add your venue phone number here...',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 8),
                Text(
                  'Email: Add your venue email address here...',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: () {
            // Navigate to the ScheduleScreen
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ScheduleScreen(venueId: '',)),
            );
          },
          child: Text(
            'Book Now',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue, // Set background color of the button
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0), // Rounded corners
            ),
            padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15), // Button padding
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
