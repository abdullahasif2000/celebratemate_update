import 'package:flutter/material.dart';
import 'adminotpsuccess_screen.dart'; // Import the AdminOTPSuccessScreen widget

class AdminVerificationScreen extends StatelessWidget {
  TextEditingController _otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Admin Verification',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.blueGrey, // Set app bar background color
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/CelebrateMate_Exclusive.jpg', // Add path of the image
              width: 150,
              height: 150,
            ),
            SizedBox(height: 20),
            Text(
              'Enter the OTP sent to you on your phone/email', // Text before OTP field
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10), // Add some space between the text and OTP field
            TextField(
              controller: _otpController,
              decoration: InputDecoration(
                labelText: 'Enter OTP',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigate to AdminOTPSuccessScreen upon successful verification
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AdminOTPSuccessScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              child: Text(
                'Verify',
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

// class AdminOTPSuccessScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           'Admin OTP Success',
//           style: TextStyle(
//             color: Colors.white,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         backgroundColor: Colors.blueGrey,
//         centerTitle: true,
//       ),
//       body: Center(
//         child: Text(
//           'OTP Verified Successfully!',
//           style: TextStyle(
//             fontSize: 20,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//       ),
//     );
//   }
// }

void main() {
  runApp(MaterialApp(
    home: AdminVerificationScreen(),
  ));
}
