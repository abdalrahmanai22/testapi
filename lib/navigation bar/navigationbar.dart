import 'package:flutter/material.dart';
import 'package:testapi/navigation%20bar/addRequest.dart';
import 'package:testapi/navigation%20bar/assets.dart';
import 'package:testapi/navigation%20bar/homeScreen.dart';
import 'package:testapi/navigation%20bar/more.dart';
import 'package:testapi/navigation%20bar/request.dart';


class NavigatorBar extends StatefulWidget {
  const NavigatorBar({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<NavigatorBar> {
  int _currentIndex = 0;
  final List<Widget> _screens = const [
    Homescreen(),
    Request(),
    AddRequest(),
    Assets(),
    More(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.receipt),
            label: 'Requests',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle,
                color: Colors.blue, size: 40), // Add icon
            label: 'Add Request',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.grid_view),
            label: 'Assets',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: 'More',
          ),
        ],
      ),
    );
  }
}
