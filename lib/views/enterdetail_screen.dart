import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'reviewinginfo_screen.dart';
import 'VenueDetailsScreen.dart'; // Import the VenueDetailsScreen
import 'login_screen.dart'; // Import the LoginScreen (or whatever your login screen is called)
import 'package:firebase_auth/firebase_auth.dart'; // Import Firebase Auth

class EnterDetailScreen extends StatefulWidget {
  @override
  _EnterDetailScreenState createState() => _EnterDetailScreenState();
}

class _EnterDetailScreenState extends State<EnterDetailScreen> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  TextEditingController _representativeController = TextEditingController();
  TextEditingController _phoneNumberController = TextEditingController();
  TextEditingController _servicesController = TextEditingController();
  TextEditingController _locationController = TextEditingController();

  List<String> _pictures = [];
  double _stars = 0;
  bool _valetParkingAvailable = false;
  String _documentId = '';

  final CollectionReference venuesCollection = FirebaseFirestore.instance.collection('venues');

  void _addPicture() {
    setState(() {
      _pictures.add("https://via.placeholder.com/150");
    });
  }

  void _saveVenue() {
    final venueData = {
      'name': _nameController.text,
      'description': _descriptionController.text,
      'representative': _representativeController.text,
      'phoneNumber': _phoneNumberController.text,
      'services': _servicesController.text,
      'stars': _stars,
      'valetParking': _valetParkingAvailable,
      'location': _locationController.text,
      'pictures': _pictures,
    };

    if (_documentId.isEmpty) {
      venuesCollection.add(venueData).then((_) {
        print('Venue saved successfully!');
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ReviewingInfoScreen()),
        );
      }).catchError((error) {
        print('Failed to save venue: $error');
      });
    } else {
      venuesCollection.doc(_documentId).update(venueData).then((_) {
        print('Venue updated successfully!');
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ReviewingInfoScreen()),
        );
      }).catchError((error) {
        print('Failed to update venue: $error');
      });
    }
  }

  void _deleteVenue() {
    if (_documentId.isNotEmpty) {
      venuesCollection.doc(_documentId).delete().then((_) {
        print('Venue deleted successfully!');
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ReviewingInfoScreen()),
        );
      }).catchError((error) {
        print('Failed to delete venue: $error');
      });
    }
  }

  void _logout() async {
    await FirebaseAuth.instance.signOut();
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
          (Route<dynamic> route) => false,
    );
  }

  Widget _buildPictureWidget(String imageUrl) {
    return Stack(
      children: [
        Image.network(
          imageUrl,
          width: 100,
          height: 100,
          fit: BoxFit.cover,
        ),
        Positioned(
          top: 0,
          right: 0,
          child: GestureDetector(
            onTap: _addPicture,
            child: Container(
              width: 30,
              height: 30,
              color: Colors.transparent,
              child: Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }

  void _loadVenueData(String documentId) {
    venuesCollection.doc(documentId).get().then((DocumentSnapshot doc) {
      if (doc.exists) {
        var data = doc.data() as Map<String, dynamic>;
        setState(() {
          _documentId = documentId;
          _nameController.text = data['name'] ?? '';
          _descriptionController.text = data['description'] ?? '';
          _representativeController.text = data['representative'] ?? '';
          _phoneNumberController.text = data['phoneNumber'] ?? '';
          _servicesController.text = data['services'] ?? '';
          _stars = data['stars'] ?? 0;
          _valetParkingAvailable = data['valetParking'] ?? false;
          _locationController.text = data['location'] ?? '';
          _pictures = List<String>.from(data['pictures'] ?? []);
        });
      }
    }).catchError((error) {
      print('Failed to load venue data: $error');
    });
  }

  @override
  Widget build(BuildContext context) {
    // Uncomment this line to load venue data for a specific document
    // _loadVenueData('your-document-id');

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
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.logout),
          onPressed: _logout,
        ),
        actions: [
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
          children: <Widget>[
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Venue Name',
                labelStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _descriptionController,
              decoration: InputDecoration(
                labelText: 'Description',
                labelStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              maxLines: 3,
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _representativeController,
              decoration: InputDecoration(
                labelText: 'Name of Representative',
                labelStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _phoneNumberController,
              decoration: InputDecoration(
                labelText: 'Phone Number of Representative',
                labelStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              keyboardType: TextInputType.phone,
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _servicesController,
              decoration: InputDecoration(
                labelText: 'Services Offered',
                labelStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              maxLines: 3,
            ),
            SizedBox(height: 16.0),
            Text(
              'Number of Stars',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            RatingBar.builder(
              initialRating: _stars,
              minRating: 0,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemSize: 40.0,
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
            SizedBox(height: 8.0),
            Text(
              _stars == 0 ? '' : '$_stars star venue',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Valet Parking: ${_valetParkingAvailable ? "Available" : "Unavailable"}',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _valetParkingAvailable = true;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _valetParkingAvailable ? Colors.green : Colors.grey,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                  child: Text('Available'),
                ),
                SizedBox(width: 8.0),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _valetParkingAvailable = false;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _valetParkingAvailable ? Colors.grey : Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                  child: Text('Unavailable'),
                ),
              ],
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _addPicture,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
              ),
              child: Text(
                'Add Picture',
                style: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(height: 16.0),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ..._pictures.map((url) => Padding(
                    padding: EdgeInsets.only(right: 8.0),
                    child: _buildPictureWidget(url),
                  )),
                ],
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Location',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            TextField(
              controller: _locationController,
              decoration: InputDecoration(
                labelText: 'Enter your address',
                labelStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 14.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 8.0),
            Container(
              height: 200,
              color: Colors.grey[200],
              child: Center(
                child: Text(
                  'Map',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _saveVenue,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
              ),
              child: Text(
                'Save',
                style: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _deleteVenue,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
              ),
              child: Text(
                'Delete',
                style: TextStyle(color: Colors.white),
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
    home: EnterDetailScreen(),
  ));
}
