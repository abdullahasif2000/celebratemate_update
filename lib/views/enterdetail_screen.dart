import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'reviewinginfo_screen.dart';

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
  TextEditingController _locationController = TextEditingController(); // Controller for location

  List<String> _pictures = [];
  double _stars = 0;
  bool _valetParkingAvailable = false;

  void _addPicture() {
    setState(() {
      _pictures.add("https://via.placeholder.com/150");
    });
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
        centerTitle: true,
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
            TextField( // Text field for entering location
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
              height: 200, // Adjust the height as needed
              color: Colors.grey[200], // Placeholder color for the map
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
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ReviewingInfoScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
              ),
              child: Text(
                'Save',
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
