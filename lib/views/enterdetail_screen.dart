import 'dart:io'; // For native platforms
import 'dart:typed_data'; // For web
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'VenueDetailsScreen.dart';

class EnterDetailScreen extends StatefulWidget {
  @override
  _EnterDetailScreenState createState() => _EnterDetailScreenState();
}

class _EnterDetailScreenState extends State<EnterDetailScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _representativeController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _servicesController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  double _stars = 3.0;
  bool _valetParkingAvailable = false;
  List<String> _pictures = [];

  Future<void> _logout() async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushReplacementNamed('/login');
  }

  Future<void> _addPicture() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      String fileName = DateTime.now().millisecondsSinceEpoch.toString();
      Reference storageRef = FirebaseStorage.instance.ref().child('venue_images/$fileName');

      if (kIsWeb) {
        // Web upload
        Uint8List imageBytes = await pickedFile.readAsBytes();
        UploadTask uploadTask = storageRef.putData(imageBytes);
        TaskSnapshot snapshot = await uploadTask;
        String downloadUrl = await snapshot.ref.getDownloadURL();
        setState(() {
          _pictures.add(downloadUrl);
        });
      } else {
        // Native upload
        File imageFile = File(pickedFile.path);
        UploadTask uploadTask = storageRef.putFile(imageFile);
        TaskSnapshot snapshot = await uploadTask;
        String downloadUrl = await snapshot.ref.getDownloadURL();
        setState(() {
          _pictures.add(downloadUrl);
        });
      }
    }
  }

  Widget _buildPictureWidget(String imageUrl) {
    return Stack(
      children: [
        Image.network(imageUrl, width: 100, height: 100, fit: BoxFit.cover),
      ],
    );
  }

  Future<void> _saveVenue() async {
    await FirebaseFirestore.instance.collection('venues').add({
      'name': _nameController.text,
      'description': _descriptionController.text,
      'representative': _representativeController.text,
      'phone_number': _phoneNumberController.text,
      'services': _servicesController.text,
      'location': _locationController.text,
      'stars': _stars,
      'valet_parking': _valetParkingAvailable,
      'pictures': _pictures,
    });

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Venue saved successfully!')));

    // Clear form fields after saving
    _nameController.clear();
    _descriptionController.clear();
    _representativeController.clear();
    _phoneNumberController.clear();
    _servicesController.clear();
    _locationController.clear();
    setState(() {
      _stars = 3.0;
      _valetParkingAvailable = false;
      _pictures.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text(
          'Enter Venue Details',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: _logout,
          ),
          IconButton(
            icon: Icon(Icons.list),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => VenueDetailsScreen()),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Venue Name',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _descriptionController,
              decoration: InputDecoration(
                labelText: 'Description',
                border: OutlineInputBorder(),
              ),
              maxLines: 3,
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _representativeController,
              decoration: InputDecoration(
                labelText: 'Representative Name',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _phoneNumberController,
              decoration: InputDecoration(
                labelText: 'Phone Number',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _servicesController,
              decoration: InputDecoration(
                labelText: 'Services Offered',
                border: OutlineInputBorder(),
              ),
              maxLines: 3,
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _locationController,
              decoration: InputDecoration(
                labelText: 'Location',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Rating:',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            RatingBar.builder(
              initialRating: _stars,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemBuilder: (context, _) => Icon(
                Icons.star,
                color: Colors.amber,
              ),
              onRatingUpdate: (rating) {
                setState(() {
                  _stars = rating;
                });
              },
            ),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Valet Parking Available',
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
                Switch(
                  value: _valetParkingAvailable,
                  onChanged: (value) {
                    setState(() {
                      _valetParkingAvailable = value;
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: 16.0),
            Text(
              'Pictures:',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: _pictures.map((url) => _buildPictureWidget(url)).toList(),
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton.icon(
              onPressed: _addPicture,
              icon: Icon(Icons.add_a_photo),
              label: Text('Add Picture'),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white, backgroundColor: Colors.blueGrey,
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _saveVenue,
              child: Text('Save Venue'),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white, backgroundColor: Colors.blueGrey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
