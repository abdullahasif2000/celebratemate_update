import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:celebratemate/views/login_screen.dart'; // Import the LoginScreen
import 'booking_screen2.dart'; // Import the booking screen

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue, // Set background color to blue
        title: Text(
          'Home',
          style: TextStyle(
            color: Colors.white, // Set text color to white
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              _signOut(context); // Call the signOut method when the button is pressed
            },
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Your Current Location',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Korangi Creek, Karachi',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue, // Set text color to blue
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () {
                    // Add notification bell logic here
                  },
                  icon: Icon(
                    Icons.notifications,
                    color: Colors.blue, // Set icon color to blue
                  ),
                ),
              ],
            ),
            SizedBox(height: 20), // Add SizedBox to move down the "Search Venue" text
            Column(
              children: [
                Container(
                  height: 30, // Adjust the height as needed
                  child: Text(
                    'Search Venue',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 20), // Add SizedBox for spacing
              ],
            ),
            SizedBox(height: 10), // Add SizedBox for spacing
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.grey),
              ),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      // Add search logic here
                    },
                    icon: Icon(Icons.search),
                  ),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search...',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10), // Add SizedBox for spacing
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Nearby your Location:',
                  style: TextStyle(
                    color: Colors.blue.shade900,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    // Add onPressed logic for See All button
                  },
                  child: Text(
                    'See All',
                    style: TextStyle(
                      color: Colors.blue.shade900,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 8), // Add SizedBox for spacing
            Text(
              'Add banquets or hotels data', // Your text here
              style: TextStyle(
                fontSize: 14,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 20), // Add SizedBox for spacing
            // Next button to navigate to booking_screen2.dart
            Align(
              alignment: Alignment.centerRight,
              child: IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => BookingScreen2()),
                  );
                },
                icon: Icon(Icons.arrow_forward),
                iconSize: 40,
                color: Colors.blue,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blue, // Set background color to blue
        selectedItemColor: Colors.white, // Set selected item color to black
        unselectedItemColor: Colors.white, // Set unselected item color to black
        type: BottomNavigationBarType.fixed, // Ensure equal spacing
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Calendar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.save),
            label: 'Saved',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  // Sign out method
  void _signOut(BuildContext context) async {
    try {
      // Sign out the current user
      await FirebaseAuth.instance.signOut();
      // Navigate back to the login screen
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => LoginScreen()),
      );
    } catch (e) {
      // Handle sign-out errors
      print('Error signing out: $e');
    }
  }
}
