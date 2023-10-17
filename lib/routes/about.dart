import 'package:flutter/material.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4, // Add elevation for a shadow effect
      margin: EdgeInsets.all(16), // Add some margin
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Developers:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text('1. Muhammad Zain Abbas'),
            Text('2. Muhammad Talha Mughal'),
            SizedBox(height: 16),
            Text(
              'Technologies Used:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text('Language: Dart'),
            Text('Framework: Flutter'),
            Text('APIs Used: NASA APOD, Mars Rover APIs, Spaceflight News API'),
            SizedBox(height: 16),
            Text(
              'App Name:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text('Kosmos'),
          ],
        ),
      ),
    );
  }
}
