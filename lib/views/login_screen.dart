import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'verification_screen.dart'; // Import the verification screen
import 'forgetpassword_screen.dart'; // Import the forget password screen
import 'onboarding_screen.dart';// Import the onboarding screen
import 'package:firebase_auth/firebase_auth.dart';
import 'adminlogin_screen.dart';
import 'enterdetail_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  // funtion to handle user login
  Future<void> login(BuildContext context) async{
    try{
      UserCredential userCredential=await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,

      );
      // retrieve user role from firestore
      DocumentSnapshot userDoc = await FirebaseFirestore.instance.collection('users').doc(userCredential.user!.uid).get();
      String role = userDoc['role'];
      if (role =='admin'){
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => EnterDetailScreen()),
        );
      }
      else{
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => VerificationScreen()),
        );
      }
      }
      on FirebaseAuthException catch(e) {
      // Navigate to the varification screen or nay other screen upon successful login
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context)=>VerificationScreen()),
      );
    }
    on FirebaseAuthException catch(e){
      if (e.code =='user-not-found'){
        print('No user found for that email');
      }
      else if (e.code == 'wrong-password'){
        print('Wrong password provided with that user');
      }
    }
    catch(e){
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          'Login',
          style: TextStyle(
            color: Colors.white, // Set text color to white
            fontWeight: FontWeight.w600,
            fontSize: 27,
          ),
        ),
        centerTitle: true, // Center align the app bar title
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Unlock Your Celebrations with CelebrateMate',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 30),
              Text(
                'Your event is just a step ahead',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              SizedBox(height: 30),
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0), // Rounded border
                  ),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0), // Rounded border
                  ),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: ()=> login(context),//call the login function
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0), // Rounded border
                  ),
                ),
                child: Text('Login', style: TextStyle(color: Colors.white)), // Set text color to white
              ),
              SizedBox(height: 10),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    // Navigate to the forget password screen
                    context,
                    MaterialPageRoute(builder: (context) => ForgetPasswordScreen()),
                  );
                },
                child: Text('Forgot Password?', style: TextStyle(color: Colors.red)), // Set text color to red
              ),
              SizedBox(height: 20), // Add space
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
              ElevatedButton(
                onPressed: () {
                  // Navigate to OnboardingScreen
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => OnBoardingScreen()),
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
              SizedBox(height: 10),
              Text(
                'Admin?',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AdminLoginScreen()),
                  );
                },
                child: Text('Admin Login', style: TextStyle(color: Colors.blue)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
