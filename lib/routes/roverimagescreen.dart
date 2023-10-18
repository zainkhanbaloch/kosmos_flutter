import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class RoverImagesScreen extends StatefulWidget {
  final String roverName;

  RoverImagesScreen({required this.roverName});

  @override
  _RoverImagesScreenState createState() => _RoverImagesScreenState();
}

class _RoverImagesScreenState extends State<RoverImagesScreen> {
  List<Map<String, dynamic>> images = [];

  @override
  void initState() {
    super.initState();
    fetchRoverImages();
  }

  Future<void> fetchRoverImages() async {
    String roverName = widget.roverName.toLowerCase(); // Convert to lowercase for API endpoint

    final response = await http.get(
      Uri.parse('https://api.nasa.gov/mars-photos/api/v1/rovers/$roverName/latest_photos?api_key=DEMO_KEY'),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      setState(() {
        images = data['latest_photos'].cast<Map<String, dynamic>>();
      });
    } else {
      print('Failed to fetch rover images: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Images from ${widget.roverName} Rover')),
      body: ListView.builder(
        itemCount: images.length,
        itemBuilder: (context, index) {
          final image = images[index];
          return Card(
            elevation: 4,
            margin: EdgeInsets.all(8),
            child: Column(
              children: [
                // Display the image using Image.network
                Image.network(
                  image['img_src'],
                  width: double.infinity,
                  height: 200,
                  fit: BoxFit.cover,
                ),
                ListTile(
                  title: Text('Image ID: ${image['id']}'),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Date: ${image['earth_date']}'),
                      Text('Camera Name: ${image['camera']['full_name']}'),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
