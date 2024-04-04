import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'additional_services.dart'; // Import the additional_services.dart file

class ScheduleScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Calculate half of the screen height
    double halfScreenHeight = MediaQuery.of(context).size.height / 2;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.blue, // Set app bar background color to blue
            title: Text(
              'Schedule', // Title text
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            centerTitle: true, // Center align the title text on the app bar
            leading: IconButton(
              icon: Icon(Icons.arrow_back), // Back icon
              onPressed: () {
                Navigator.pop(context); // Navigate back when back icon is pressed
              },
            ),
            floating: true, // App bar will be floating
            pinned: true, // App bar will be pinned
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: halfScreenHeight, // Set height to half of the screen
              // child: Padding(
              // padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top + 0),
              child: SfCalendar(
                view: CalendarView.month,
                firstDayOfWeek: 1,
                headerStyle: CalendarHeaderStyle(
                  textStyle: TextStyle(
                    color: Colors.black,  // set the color of the month name
                    fontSize: 20,  // set the font size of the month name
                    fontWeight: FontWeight.bold, // set the font weight of the month name
                  ),
                  textAlign: TextAlign.center, // center align the month name
                ),
                // ,initialDisplayDate: ,
                //   initialSelectedDate:
              ),
            ),
          ),
          //),
          SliverToBoxAdapter(
            child: SizedBox(height: 10), // Add SizedBox for spacing
          ),
          SliverToBoxAdapter(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'My Schedule:',
                  style: TextStyle(
                    color: Colors.blue.shade900,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    // Add onPressed logic for See All button
                  },
                  child: Text(
                    'See All',
                    style: TextStyle(
                      color: Colors.blue.shade900,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SliverFillRemaining(
            child: Container(
              color: Colors.white, // Example background color
              // Add additional widgets for more information here
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blue, // Set background color to blue
        selectedItemColor: Colors.white, // Set selected item color to white
        unselectedItemColor: Colors.white.withOpacity(0.6), // Set unselected item color with reduced opacity
        type: BottomNavigationBarType.fixed, // Ensure equal spacing
        currentIndex: 1, // Index of the calendar screen
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.calendar_today,
              color: Colors.white, // Color of the calendar icon
            ),
            label: 'Calendar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.save),
            label: 'Saved',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton( // Add FloatingActionButton for the Next button
        onPressed: () {
          Navigator.push( // Navigate to the AdditionalServicesScreen when pressed
            context,
            MaterialPageRoute(builder: (context) => AdditionalServicesScreen()),
          );
        },
        child: Icon(Icons.navigate_next), // Icon for the Next button
      ),
    );
  }
}
