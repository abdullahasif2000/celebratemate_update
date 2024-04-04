import 'package:flutter/material.dart';
import 'details_screen.dart'; // Importing the DetailsScreen

class BookingScreen3 extends StatelessWidget {
  const BookingScreen3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue, // Set background color to blue
        title: Text(
          'booking_screen3',
          style: TextStyle(
            color: Colors.white, // Set text color to white
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                child: Text(
                                  'Your Current Location',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                              Icon(
                                Icons.notifications,
                                color: Colors.blue, // Set icon color to blue
                                size: 24,
                              ),
                            ],
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Korangi Creek, Karachi',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20), // Add SizedBox for spacing
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.grey),
                  ),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          // Add search logic here
                        },
                        icon: Icon(Icons.search),
                      ),
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Search...',
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10), // Add SizedBox for spacing
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Nearby your Location:',
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
              ],
            ),
          ),
          Positioned.fill(
            child: GestureDetector(
              onTap: () {
                // Add logic to handle filter screen pop-up
              },
              child: Container(
                color: Colors.black.withOpacity(0.5), // Add fade effect
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height / 2, // Set height for white background container
                      color: Colors.white, // Set white background color
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            height: 40, // Adjust the height of this container to your desired value
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  height: 40, // Set height for Cancel button container
                                  child: TextButton(
                                    onPressed: () {
                                      // Add logic for cancel button
                                    },
                                    child: Text(
                                      'Cancel',
                                      style: TextStyle(
                                        color: Colors.blue.shade900,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 40, // Set height for Filter text container
                                  child: Text(
                                    'Filter',
                                    style: TextStyle(
                                      color: Colors.blue.shade900,
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 40, // Set height for Reset button container
                                  child: TextButton(
                                    onPressed: () {
                                      // Add logic for reset button
                                    },
                                    child: Text(
                                      'Reset',
                                      style: TextStyle(
                                        color: Colors.blue.shade900,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20), // Add spacing
                    // Replace FloatingActionButton with a circular container containing the arrow icon
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.blue, // Set background color to blue
                        shape: BoxShape.circle, // Shape the container as a circle
                      ),
                      padding: EdgeInsets.all(12), // Add padding for the icon
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => DetailsScreen()),
                          );
                        },
                        child: Icon(
                          Icons.arrow_forward, // Next icon
                          color: Colors.white, // Set icon color to white
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Sort by:',
                        style: TextStyle(
                          color: Colors.blue.shade900,
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                      ),
                      SizedBox(width: 10), // Add spacing between "Sort by:" and filter text
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Filter from',
                            style: TextStyle(
                              color: Colors.blue.shade900,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          Text(
                            'lower to higher prices',
                            style: TextStyle(
                              color: Colors.blue.shade900,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  SizedBox(height: 300),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
