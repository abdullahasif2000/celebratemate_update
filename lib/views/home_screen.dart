import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:celebratemate/views/login_screen.dart';
import 'booking_screen2.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController _searchController = TextEditingController();
  late Stream<QuerySnapshot> _venuesStream;
  bool _isSearching = false;

  @override
  void initState() {
    super.initState();
    _venuesStream = FirebaseFirestore.instance.collection('venues').snapshots();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: _isSearching
            ? TextField(
          controller: _searchController,
          decoration: InputDecoration(
            hintText: 'Search venue...',
            hintStyle: TextStyle(color: Colors.white),
            border: InputBorder.none,
          ),
          style: TextStyle(color: Colors.white),
          onChanged: (value) {
            setState(() {
              // Trigger rebuild to apply filter
            });
          },
        )
            : Text(
          'Home',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                _isSearching = !_isSearching;
                if (!_isSearching) {
                  _searchController.clear();
                }
              });
            },
            icon: Icon(_isSearching ? Icons.close : Icons.search),
          ),
          IconButton(
            onPressed: () {
              _signOut(context);
            },
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: StreamBuilder<QuerySnapshot>(
          stream: _venuesStream,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(child: Text('Something went wrong: ${snapshot.error}'));
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }

            final List<DocumentSnapshot> documents = snapshot.data?.docs ?? [];

            if (documents.isEmpty) {
              return Center(child: Text('No venues found'));
            }

            // Filtered venues based on search query
            final filteredVenues = documents.where((venue) {
              final name = venue['name'] as String? ?? '';
              final query = _searchController.text.toLowerCase();
              return name.toLowerCase().contains(query);
            }).toList();

            return ListView.builder(
              itemCount: filteredVenues.length,
              itemBuilder: (context, index) {
                final data = filteredVenues[index].data() as Map<String, dynamic>;
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  elevation: 3,
                  child: ListTile(
                    title: Text(
                      data['name'] as String? ?? 'No Name',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 5),
                        Text(data['description'] as String? ?? 'No Description'),
                        SizedBox(height: 5),
                        Text('Representative: ${data['representative'] as String? ?? 'N/A'}'),
                        SizedBox(height: 5),
                        Text('Phone Number: ${data['phoneNumber'] as String? ?? 'N/A'}'),
                        SizedBox(height: 5),
                        Text('Location: ${data['location'] as String? ?? 'N/A'}'),
                        SizedBox(height: 5),
                        Text('Services Offered: ${data['services'] as String? ?? 'N/A'}'),
                        SizedBox(height: 5),
                        Row(
                          children: [
                            Text(
                              'Stars: ',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Icon(Icons.star, color: Colors.amber, size: 18),
                            Text('${data['stars']?.toStringAsFixed(1) ?? 'N/A'}'),
                          ],
                        ),
                        SizedBox(height: 5),
                        Text(
                          'Valet Parking: ${data['valetParking'] ?? false ? 'Available' : 'Not Available'}',
                        ),
                        SizedBox(height: 5),
                        Text(
                          'Pictures:',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 5),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: (data['pictures'] as List<dynamic>?)
                                ?.map((url) => Padding(
                              padding: EdgeInsets.only(right: 5),
                              child: Image.network(
                                url as String,
                                width: 100,
                                height: 100,
                                fit: BoxFit.cover,
                              ),
                            ))
                                .toList() ??
                                [],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blue,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
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
    );
  }

  void _signOut(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signOut();
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => LoginScreen()),
      );
    } catch (e) {
      print('Error signing out: $e');
    }
  }
}
