import 'package:evproject/available.dart';
import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';

class selectionPort extends StatefulWidget {
  const selectionPort({Key? key}) : super(key: key);

  @override
  State<selectionPort> createState() => _selectionPortState();
}

class _selectionPortState extends State<selectionPort> {
  int selectedChargerIndex = -1; // Variable to track the selected charger type index
  int selectedConnectorIndex = -1; // Variable to track the selected connector type index

  List<String> chargerTypes = ["ALL", "AC", "DC"];
  List<String> connectorTypes = [
    "AC type-1",
    "CCS 1",
    "AC type-2",
    "CCS 2",
    "Tesla Charger",
    "Bharat AC001",
    "Bharat DC001 GB/T",
    "AC plug point",
    "GB/T",
    "CHAdeMO"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            colors: [
              Colors.orange.shade900,
              Colors.orange.shade800,
              Colors.orange.shade400
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 20),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(60),
                    topRight: Radius.circular(60),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.all(30),
                  child: Column(
                    children: <Widget>[
                      FadeInUp(
                        duration: Duration(milliseconds: 1400),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Color.fromRGBO(225, 95, 27, .3),
                                blurRadius: 20,
                                offset: Offset(0, 10),
                              ),
                            ],
                          ),
                          child: Column(
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.all(10),
                                child: Text(
                                  "Chargers",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                              Center(
                                child: Container(
                                  width: 350,
                                  height: 110,
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: chargerTypes.length,
                                    itemBuilder: (context, index) {
                                      return GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            selectedChargerIndex = index;
                                          });
                                        },
                                        child: Container(
                                          height: 100,
                                          width: 100,
                                          margin: EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                            color: selectedChargerIndex == index
                                                ? Colors.blue // Change color on selection change
                                                : Colors.grey.shade50,
                                            borderRadius: BorderRadius.circular(10),
                                          ),
                                          child: Center(
                                            child: Text(
                                              chargerTypes[index],
                                              style: TextStyle(
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      FadeInUp(
                        duration: Duration(milliseconds: 1400),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Color.fromRGBO(225, 95, 27, .3),
                                blurRadius: 20,
                                offset: Offset(0, 10),
                              ),
                            ],
                          ),
                          child: Column(
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.all(10),
                                child: Column(
                                  children: [
                                    Text(
                                      "Connectors",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                      ),
                                    ),
                                    SizedBox(height: 8,),
                                    Text(
                                      "My Connectors",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                      ),
                                    ),
                                    SizedBox(height: 8,),
                                    Text(
                                      "None added",
                                      style: TextStyle(
                                        color: Colors.grey.shade700,
                                        fontSize: 14,
                                      ),
                                    ),
                                    SizedBox(height: 8,),
                                    Text(
                                      "Other Connectors",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Wrap(
                                spacing: 10,
                                runSpacing: 10,
                                children: connectorTypes
                                    .asMap()
                                    .entries
                                    .map(
                                      (entry) => GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        selectedConnectorIndex = entry.key;
                                      });
                                    },
                                    child: Container(
                                      height: 60,
                                      width: MediaQuery.of(context).size.width /
                                          4 -
                                          45,
                                      decoration: BoxDecoration(
                                        color: selectedConnectorIndex == entry.key
                                            ? Colors.blue // Change color on selection change
                                            : Colors.grey.shade50,
                                        borderRadius:
                                        BorderRadius.circular(10),
                                      ),
                                      child: Center(
                                        child: Text(
                                          entry.value,
                                          style: TextStyle(
                                            color: Colors.black,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                                    .toList(),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 20,),
                      FadeInUp(
                        duration: Duration(milliseconds: 1500),
                        child: TextButton(
                          onPressed: () {
                            // Navigate to AvailablePorts screen and pass the selected connector and charger
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AvailablePorts(
                                  selectedConnector: selectedConnectorIndex != -1
                                      ? connectorTypes[selectedConnectorIndex]
                                      : null,
                                  selectedCharger: selectedChargerIndex != -1
                                      ? chargerTypes[selectedChargerIndex]
                                      : null,
                                ),
                              ),
                            );
                          },
                          child: Text("Select Port",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.orange[900],
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
