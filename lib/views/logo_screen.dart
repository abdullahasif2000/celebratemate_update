import 'package:flutter/material.dart';
import 'package:celebratemate/views/login_screen.dart'; // Import the LoginScreen
import 'package:firebase_auth/firebase_auth.dart';
import 'package:celebratemate/views/home_screen.dart'; // Import the HomeScreen or any other screen for logged-in users
class LogoScreen extends StatefulWidget {
  @override
  _LogoScreenState createState() => _LogoScreenState();
}
class _LogoScreenState extends State<LogoScreen>{
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero,() {
      //call the checkuserloggedin function when the screen initializes
      checkUserLoggedIn();
    });

  }
  void checkUserLoggedIn() async{
    // Get the current user from FirebaseAuth instance
    User? user=FirebaseAuth.instance.currentUser;
    if(user != null){
      // If user is logged in, navigate to the HomeScreen
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (BuildContext context) => HomeScreen()),
      );
    }
    else{
      // If user is not logged in, navigate to the LoginScreen
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (BuildContext context) => LoginScreen()),
      );

    }
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to the LoginScreen when tapped
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (BuildContext context) => LoginScreen()),
        );
      },
      child: Scaffold(
        backgroundColor: Colors.black, // Set background color to black
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/background5.jpg'), // Replace 'background_image.jpg' with your actual image asset path
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/logo.png', // Replace 'your_logo.png' with your actual logo asset path
                  width: 200, // Adjust width as needed
                  height: 200, // Adjust height as needed
                ),
                SizedBox(height: 20),
                Text(
                  'CelebrateMate', // Add your app name or any text as needed
                  style: TextStyle(
                      fontSize: 29,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueAccent // Set text color to white
                  ),
                ),
                SizedBox(height: 10), // Add space for subtext
                Text(
                  'Bringing your visons to life', // Add your subtext here
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.blueAccent, // Set text color to white
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
