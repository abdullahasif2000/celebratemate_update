import 'package:flutter/material.dart';
import 'package:sign_in_button/sign_in_button.dart';
import 'package:celebratemate/views/login_screen.dart';
import 'adminlogin_screen.dart'; // Import your admin login screen
import 'package:firebase_auth/firebase_auth.dart';
class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);
  // function for handling user signup
  Future<void> signup(String email,String password,BuildContext context)async{
    try{
      await FirebaseAuth.instance.createUserWithEmailAndPassword
        (email: email,
          password: password
      );
      // navigate to login screen after successful signup
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context)=> LoginScreen()),
      );
    }
    catch(e){
      // handling signup errors
      print('Failed to sign up:$e');
    }
  }

  @override
  Widget build(BuildContext context) {
    String email ='';
    String password ='';
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/background7.jpg'),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(Colors.blue.withOpacity(0.9), BlendMode.colorBurn), // Customize color and blend mode
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 20),
                Text(
                  "Welcome to Celebratemate",
                  style: TextStyle(
                    color: Colors.red.shade700,
                    fontSize: 27,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  "Bringing your Visions to Life!",
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 20),
                Image.asset(
                  'assets/logo.png',
                  width: 100,
                  height: 100,
                ),
                Text(
                  "Create an Account",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.blueAccent,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  onChanged: (value)=>email=value,
                  decoration: InputDecoration(
                    hintText: "Email",
                    hintStyle: TextStyle(color: Colors.white), // Hint text color
                  ),
                  style: TextStyle(
                    color: Colors.white, // Text color
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  onChanged: (value)=> password = value,
                  decoration: InputDecoration(
                    hintText: "Password",
                    hintStyle: TextStyle(color: Colors.white), // Hint text color
                  ),
                  obscureText: true,
                  style: TextStyle(
                    color: Colors.white, // Text color
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => signup(email, password, context), // Call the signUp function
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                    child: Text(
                      "Continue",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "Or Signup With",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SignInButton(
                          Buttons.google,
                          onPressed: () {
                            // Add functionality for Google sign-in
                            // Redirect to Google sign-in page
                            // Example: Navigator.push(context, MaterialPageRoute(builder: (context) => GoogleSignInPage()));
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SignInButton(
                          Buttons.apple,
                          onPressed: () {
                            // Add functionality for Apple sign-in
                            // Redirect to Apple sign-in page
                            // Example: Navigator.push(context, MaterialPageRoute(builder: (context) => AppleSignInPage()));
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {
                        // Redirect to login screen
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LoginScreen()),
                        );
                      },
                      child: Text('Next'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Navigate to admin login screen
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AdminLoginScreen()),
            );
          },
          child: Icon(Icons.person),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: OnBoardingScreen(),
  ));
}
