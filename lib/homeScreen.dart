import 'dart:html';
import 'package:evproject/available.dart';
import 'package:evproject/selection.dart';
import 'package:flutter/material.dart';
import 'package:evproject/chargingHistory.dart';
import 'package:evproject/myVehicle.dart';
import 'package:evproject/profile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  final List<Widget> _screens = [
    const selectionPort(),
    const profile(),
    const ChargingHistory(),
    const Myvehicle(),
    const AvailablePorts(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard',style: TextStyle(color: Colors.white, fontSize: 40),),
        backgroundColor: Colors.orange.shade900,
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          }
        ),
      ),
      body: _screens[_currentIndex],
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      colors: [
                        Colors.orange.shade900,
                        Colors.orange.shade800,
                        Colors.orange.shade400
                      ]),
              ),
              child: Row(
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(50)),
                  ),
                  Text(
                    'Profile',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('My Account'),
              onTap: () {
                setState(() {
                  _currentIndex = 1;
                  Navigator.pop(context);
                });
              },
            ),
            ListTile(
              leading: const Icon(Icons.charging_station),
              title: const Text('Charging History'),
              onTap: () {
                setState(() {
                  _currentIndex = 2;
                  Navigator.pop(context);
                });
              },
            ),
            ListTile(
              leading: const Icon(Icons.directions_bike_outlined),
              title: const Text('My Vehicle'),
              onTap: () {
                setState(() {
                  _currentIndex = 3;
                  Navigator.pop(context);
                });
              },
            ),
            // ListTile(
            //   leading: const Icon(Icons.directions_bike_outlined),
            //   title: const Text('Sample'),
            //   onTap: () {
            //     setState(() {
            //       _currentIndex = 4;
            //       Navigator.pop(context);
            //     });
            //   },
            // ),
          ],
        ),
      ),
    );
  }
}
