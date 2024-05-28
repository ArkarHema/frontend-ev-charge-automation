import 'package:evproject/PortDetails.dart';
import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:url_launcher/url_launcher.dart';
class Port {
  String name;
  String address;
  double distance;
  String timing;
  bool isOpen;
  int availablePorts;
  String chargerType;
  String connectorType;
  double price;

  Port({
    required this.name,
    required this.address,
    required this.distance,
    required this.timing,
    required this.isOpen,
    required this.availablePorts,
    required this.chargerType,
    required this.connectorType,
    required this.price,
  });
}
List<Port> availablePorts = [
  Port(
    name: 'Port A',
    address: '123 Main St',
    distance: 5.2,
    timing: '9:00 AM - 6:00 PM',
    isOpen: true,
    availablePorts: 10,
    chargerType: 'Fast Charger',
    connectorType: 'Type 2',
    price: 5.0,
  ),
  Port(
    name: 'Port B',
    address: '456 Elm St',
    distance: 8.7,
    timing: '10:00 AM - 8:00 PM',
    isOpen: false,
    availablePorts: 5,
    chargerType: 'Standard Charger',
    connectorType: 'Type 1',
    price: 3.0,
  ),
  Port(
    name: 'Port C',
    address: '789 Oak St',
    distance: 12.4,
    timing: '8:00 AM - 5:00 PM',
    isOpen: true,
    availablePorts: 20,
    chargerType: 'Rapid Charger',
    connectorType: 'Type 3',
    price: 7.0,
  ),
];

class AvailablePorts extends StatelessWidget {
  final String? selectedConnector;
  final String? selectedCharger;

  const AvailablePorts({Key? key, this.selectedConnector, this.selectedCharger})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: ListView.builder(
        itemCount: availablePorts.length,
        itemBuilder: (context, index) {
          var port = availablePorts[index];
          return FadeInLeft( // Adding FadeInLeft animation
            duration: Duration(milliseconds: 500),
            child: ListTile(
              title: Row(
                children: [
                  Text(port.name),
                  SizedBox(width: 40,),
                  Icon(Icons.location_on, color: Colors.red),
                  Text('Address: ${port.address}'),
                  SizedBox(width: 40,),
                  FadeInUp(
                      duration: Duration(milliseconds: 1500),
                      child: TextButton(
                        onPressed: () {
                          _launchMaps(port.address);
                        },
                        child: Text("Navigate",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.orange[900],
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                      )),
                ],
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PortDetailsScreen(port: port),
                  ),
                );
              },
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 10,),
                  Row(
                    children: <Widget>[
                      Icon(Icons.directions_car, color: Colors.red),
                      Text('Distance: ${port.distance} km'),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Row(
                    children: <Widget>[
                      Icon(Icons.access_time, color: Colors.red),
                      Text('Timing: ${port.timing}'),
                      SizedBox(width: 40,),
                      Icon(port.isOpen ? Icons.check_circle : Icons.cancel,
                          color: Colors.red),
                      Text('Status: ${port.isOpen ? 'Open' : 'Closed'}'),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Row(
                    children: <Widget>[
                      Icon(Icons.electric_car, color: Colors.red),
                      Text('Available Ports:0/ ${port.availablePorts}'),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.grey.shade100),
                    child: Column(
                      children: <Widget>[
                        Text('Charger ${port.chargerType}'),
                        Text('${port.connectorType}'),
                        FadeInUp(
                          duration: Duration(milliseconds: 1500),
                          child: TextButton(
                            onPressed: () {
                              // Functionality to view tariff
                            },
                            child: Text("View Tariff",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold
                                )
                            ),
                            style: TextButton.styleFrom(
                              backgroundColor: Colors.orange[900],
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 10,),
                ],
              ),
            ),
          );
        },
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


