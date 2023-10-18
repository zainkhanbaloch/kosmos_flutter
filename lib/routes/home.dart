import 'package:flutter/material.dart';
import 'package:kosmos/routes/about.dart';
import 'package:kosmos/routes/blog.dart';
import 'package:kosmos/routes/front.dart';
import 'package:kosmos/routes/mars.dart';
import 'package:kosmos/routes/news.dart';

import 'package:kosmos/services/apod.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Future<Map<String, dynamic>> fetchData(String date) async {
    final nasaApi = NasaApi(""); // Replace with your actual API key
    final data = await nasaApi.fetchAPOD(date);
    return data;
  }

  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    const Front(),
    Mars(),
    News(),
    Blog(),
    About()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          "assets/images/appicon.png",
          fit: BoxFit.contain,
          height: 42,
        ),
        toolbarHeight: 68,
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        leading: const Icon(Icons.menu),
        
        actions: const [
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Icon((Icons.info_outline)),
          ),
        ],
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Color.fromARGB(255, 0, 132, 255),
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.business,
              color: Color.fromARGB(255, 0, 132, 255),
            ),
            label: 'Mars',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.school,
              color: Color.fromARGB(255, 0, 132, 255),
            ),
            label: 'News',
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.alarm,
                color: Color.fromARGB(255, 0, 132, 255),
              ),
              label: "Blog"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.developer_board,
                color: Color.fromARGB(255, 0, 132, 255),
              ),
              label: "About"),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.blue, // Color for selected item
        unselectedItemColor: Colors.grey, // Color for unselected items
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
