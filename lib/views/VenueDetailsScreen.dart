import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class VenueDetailsScreen extends StatefulWidget {
  @override
  _VenueDetailsScreenState createState() => _VenueDetailsScreenState();
}

class _VenueDetailsScreenState extends State<VenueDetailsScreen> {
  final CollectionReference venuesCollection =
  FirebaseFirestore.instance.collection('venues');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text(
          'Venue Details',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: venuesCollection.snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Something went wrong'));
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          final List<DocumentSnapshot> documents =
              snapshot.data?.docs ?? [];

          if (documents.isEmpty) {
            return Center(child: Text('No venues found'));
          }

          return ListView.builder(
            itemCount: documents.length,
            itemBuilder: (context, index) {
              final data =
              documents[index].data() as Map<String, dynamic>;
              return Card(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                elevation: 3,
                child: ListTile(
                  title: Text(
                    data['name'] ?? 'No Name',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 5),
                      Text(data['description'] ?? 'No Description'),
                      SizedBox(height: 5),
                      Text('Representative: ${data['representative'] ?? 'N/A'}'),
                      SizedBox(height: 5),
                      Text('Phone Number: ${data['phoneNumber'] ?? 'N/A'}'),
                      SizedBox(height: 5),
                      Text('Location: ${data['location'] ?? 'N/A'}'),
                      SizedBox(height: 5),
                      Text('Services Offered: ${data['services'] ?? 'N/A'}'),
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
                        'Valet Parking: ${data['valetParking'] == true ? 'Available' : 'Not Available'}',
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
                              url ?? '',
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
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () => _deleteVenue(documents[index].id),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  void _deleteVenue(String documentId) {
    venuesCollection.doc(documentId).delete().then((value) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Venue deleted successfully')));
    }).catchError((error) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to delete venue: $error')));
    });
  }
}

