import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'additional_services.dart'; // Import AdditionalServicesScreen

class ScheduleScreen extends StatefulWidget {
  final String venueId;

  const ScheduleScreen({Key? key, required this.venueId}) : super(key: key);

  @override
  _ScheduleScreenState createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  late DateTime _selectedDate;

  @override
  void initState() {
    super.initState();
    _selectedDate = DateTime.now(); // Initialize selected date with current date
  }

  @override
  Widget build(BuildContext context) {
    double halfScreenHeight = MediaQuery.of(context).size.height / 2;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.blue,
            title: Text(
              'Schedule',
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
            floating: true,
            pinned: true,
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: halfScreenHeight,
              child: SfCalendar(
                view: CalendarView.month,
                firstDayOfWeek: 1,
                headerStyle: CalendarHeaderStyle(
                  textStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                viewHeaderStyle: ViewHeaderStyle(
                  dayTextStyle: TextStyle(
                    color: Colors.grey,
                  ),
                ),
                onTap: (CalendarTapDetails details) {
                  if (details.targetElement == CalendarElement.calendarCell) {
                    setState(() {
                      _selectedDate = details.date!;
                      _bookVenue();
                    });
                  }
                },
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(height: 10),
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
                    // Add logic for See All button
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
              color: Colors.white,
              // Additional widgets can be added here as needed
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blue,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white.withOpacity(0.6),
        type: BottomNavigationBarType.fixed,
        currentIndex: 1,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.calendar_today,
              color: Colors.white,
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AdditionalServicesScreen()),
          );
        },
        child: Icon(Icons.navigate_next),
      ),
    );
  }

  void _bookVenue() {
    // Assuming you have a 'bookings' collection in Firestore
    CollectionReference bookings =
    FirebaseFirestore.instance.collection('bookings');

    // Example booking data structure
    Map<String, dynamic> bookingData = {
      'venueId': widget.venueId,
      'bookingDate': _selectedDate,
      // Additional data can be added as needed
    };

    // Add booking data to Firestore
    bookings.add(bookingData).then((value) {
      // Successfully added booking
      print('Booking added to Firestore: ${value.id}');
    }).catchError((error) {
      // Error adding booking
      print('Failed to add booking to Firestore: $error');
    });
  }
}
