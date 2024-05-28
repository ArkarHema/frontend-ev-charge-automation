import 'package:evproject/available.dart';
import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:evproject/available.dart';
import 'package:url_launcher/url_launcher.dart';

class PortDetailsScreen extends StatefulWidget {
  final Port port;

  PortDetailsScreen({required this.port});

  @override
  _PortDetailsScreenState createState() => _PortDetailsScreenState();
}

class _PortDetailsScreenState extends State<PortDetailsScreen> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.port.name),
      ),
      body: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            TabBar(
              tabs: [
                Tab(text: 'Overview'),
                Tab(text: 'Connectors'),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                icon: Icon(Icons.navigation),
                                onPressed: () {
                                  _launchMaps(widget.port.address);
                                },
                              ),
                              SizedBox(width: 30,),
                              IconButton(
                                icon: Icon(isFavorite ? Icons.favorite : Icons.favorite_border),
                                onPressed: () {
                                  setState(() {
                                    isFavorite = !isFavorite;
                                  });
                                  // Implement add to favorites functionality
                                },
                              ),
                            ],
                          ),
                          SizedBox(height: 3),
                          Column(
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.directions_car, color: Colors.red),
                                  Text('Distance: ${widget.port.distance} km'),
                                ],
                              ),
                              SizedBox(height: 30,),
                              Row(
                                children: [
                                  Icon(Icons.access_time, color: Colors.red),
                                  Text('Timing: ${widget.port.timing}'),
                                ],
                              ),
                              SizedBox(height: 30,),
                              Row(
                                children: [
                                  Icon(widget.port.isOpen ? Icons.check_circle : Icons.cancel,
                                      color: Colors.red),
                                  Text('Status: ${widget.port.isOpen ? 'Open' : 'Closed'}'),
                                ],
                              ),

                              SizedBox(height: 30,),
                            ],
                          ),

                          Row(
                            children: [
                              SizedBox(height: 30,),
                              Icon(Icons.location_on, color: Colors.red),
                              Text('Address: ${widget.port.address}'),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text('Charger Type: ${widget.port.chargerType}'),
                            ],
                          ),
                          SizedBox(height: 30,),
                          Row(
                            children: [
                              Text('Connector Type: ${widget.port.connectorType}'),
                            ],
                          ),
                          SizedBox(height: 30,),
                          Row(
                            children: [
                              Text('Price: \$${widget.port.price}'),
                            ],
                          ),
                          SizedBox(height: 30,),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  void _launchMaps(String address) async {
    String googleMapsUrl = 'https://www.google.com/maps/search/?api=1&query=$address';
    if (await canLaunch(googleMapsUrl)) {
      await launch(googleMapsUrl);
    } else {
      throw 'Could not launch $googleMapsUrl';
    }
  }
}

