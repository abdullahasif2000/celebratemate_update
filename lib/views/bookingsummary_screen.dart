import 'package:flutter/material.dart';
import 'home_screen.dart'; // Import HomeScreen
import 'payment_screen.dart'; // Import PaymentScreen

class BookingSummaryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Booking Summary',
          style: TextStyle(
            color: Colors.white, // Set text color to white
            fontWeight: FontWeight.bold, // Set text to bold
          ),
        ),
        backgroundColor: Colors.blue, // Set background color to blue
        centerTitle: true, // Align title to center
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Booking Details',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Date: February 20, 2024',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              'Time: 10:00 AM',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              'Venue: XYZ Hall',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              'Summary Items',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              '- Decorators: Package A',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              '- Music: Live Band',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              '- Caterers: Buffet Menu',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              'Total Cost: \$1000',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Payment Information',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Payment Method: Credit Card',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              'Transaction ID: 123456789',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              'Contact Information',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Email: example@example.com',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              'Phone: +1234567890',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Redirect user to HomeScreen when Edit Booking button is clicked
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white, backgroundColor: Colors.blue, // Set button text color to white
              ),
              child: Text('Edit Booking'),
            ),
            SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PaymentScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white, backgroundColor: Colors.blue, // Set button text color to white
              ),
              child: Text('Next'),
            ),
          ],
        ),
      ),
    );
  }
}
