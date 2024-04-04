import 'package:flutter/material.dart';
import 'decorators_screen.dart';
import 'music_screen.dart';
import 'cardvendors_screen.dart'; // Import CardVendorsScreen
import 'caterers_screen.dart'; // Import CaterersScreen
import 'photographers_screen.dart'; // Import PhotographersScreen
import 'carrentals_screen.dart'; // Import CarRentalsScreen
import 'bookingsummary_screen.dart'; // Import BookingSummaryScreen

class AdditionalServicesScreen extends StatefulWidget {
  @override
  _AdditionalServicesScreenState createState() => _AdditionalServicesScreenState();
}

class _AdditionalServicesScreenState extends State<AdditionalServicesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          'Additional Services',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 20),
          _buildSearchBox(),
          SizedBox(height: 20),
          _buildCheckBoxesRows([
            [
              _buildCheckBox('assets/1.png', 'Decorators', DecoratorsScreen()),
              _buildCheckBox('assets/2.png', 'Music', MusicScreen()),
              _buildCheckBox('assets/3.png', 'Card vendors', CardVendorsScreen()),
            ],
            [
              _buildCheckBox('assets/4.png', 'Caterers', CaterersScreen()),
              _buildCheckBox('assets/5.png', 'Photographers', PhotographersScreen()),
              _buildCheckBox('assets/6.png', 'Car rentals', CarRentalsScreen()),
            ],
            // Add more lists of checkboxes as needed
          ]),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => BookingSummaryScreen()),
          );
        },
        child: Icon(Icons.arrow_forward),
      ),
    );
  }

  Widget _buildSearchBox() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 3,
            offset: Offset(0, 2), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        children: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search),
          ),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search', // Hint text
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCheckBoxesRows(List<List<Widget>> checkboxesRows) {
    return Column(
      children: checkboxesRows.map((checkboxesRow) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: checkboxesRow,
        );
      }).toList(),
    );
  }

  Widget _buildCheckBox(String imagePath, String name, Widget screen) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => screen), // Navigate to the specified screen
        );
      },
      child: Column(
        children: [
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.blue,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 8),
          Text(
            name,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
