import 'package:flutter/material.dart';
import 'enterdetail_screen.dart'; // Import your enter detail screen
import 'adminsignup_screen.dart'; // Import your admin signup screen

class AdminLoginScreen extends StatefulWidget {
  @override
  _AdminLoginScreenState createState() => _AdminLoginScreenState();
}

class _AdminLoginScreenState extends State<AdminLoginScreen> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey, // Set app bar color to blue
        title: Text(
          'Admin Login',
          style: TextStyle(
            color: Colors.white, // Set text color to white
            fontWeight: FontWeight.bold, // Set text weight to bold
          ),
        ),
        centerTitle: true, // Center align the title
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset( // Image centered above the text
              'assets/CelebrateMate_Exclusive.jpg', // Provide the path to your image
              width: 150,
              height: 150,
            ),
            SizedBox(height: 10),
            Text(
              'This page is only dedicated for the admins, users kindly go back to the previous page and continue if you are a user', // Added text box above the username input field
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.normal,
              ),
              textAlign: TextAlign.center, // Center align the text
            ),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(color: Colors.blue),
              ),
              child: TextField(
                controller: _usernameController,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Username',
                ),
              ),
            ),
            SizedBox(height: 20.0),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(color: Colors.blue),
              ),
              child: TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Password',
                ),
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                // Redirect to EnterDetailScreen
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => EnterDetailScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueGrey, // Set button color to blue
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0), // Rounded button corners
                ),
              ),
              child: Text(
                'Login',
                style: TextStyle(color: Colors.white), // Set button text color to white
              ),
            ),
            SizedBox(height: 10), // Add spacing below the login button
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Divider( // Add a horizontal line
                    color: Colors.black, // Set line color to black
                    thickness: 2, // Set line thickness
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    'If not a user already',
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ),
                Expanded(
                  child: Divider( // Add a horizontal line
                    color: Colors.black, // Set line color to black
                    thickness: 2, // Set line thickness
                  ),
                ),
              ],
            ),
            SizedBox(height: 10), // Add spacing between text and button
            SizedBox(
              width: double.infinity, // Set width to span across the screen
              child: ElevatedButton(
                onPressed: () {
                  // Navigate to AdminSignUpScreen
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AdminSignUpScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black, // Set button color to blue
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0), // Rounded button corners
                  ),
                ),
                child: Text(
                  'Sign up here',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white, // Set button text color to white
                  ),
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
    home: AdminLoginScreen(),
  ));
}
