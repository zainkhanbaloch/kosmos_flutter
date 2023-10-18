import 'package:flutter/material.dart';
import 'package:kosmos/routes/roverimagescreen.dart';

class Mars extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                // Navigate to the images screen for Curiosity rover.
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RoverImagesScreen(roverName: 'Curiosity'),
                  ),
                );
              },
              child: Text('NASA Curiosity Rover'),
            ),
            ElevatedButton(
              onPressed: () {
                // Navigate to the images screen for Perseverance rover.
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RoverImagesScreen(roverName: 'Perseverance'),
                  ),
                );
              },
              child: Text('NASA Perseverance Rover'),
            ),
          ],
        ),
      ),
    );
  }
}
