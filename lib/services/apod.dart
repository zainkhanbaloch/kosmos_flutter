import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class ApodData {
  final String title;
  final String description;
  final String imageUrl;

  ApodData({
    required this.title,
    required this.description,
    required this.imageUrl,
  });
}

Future<ApodData> fetchAPOD(String date) async {
  final response = await http.get(Uri.parse(
      'https://api.nasa.gov/planetary/apod?api_key=DEMO_KEY&date=$date'));
  // print(json.decode(response.body));

  if (response.statusCode == 200) {
    Map<String, dynamic> data = json.decode(response.body);
    return ApodData(
        title: data['title'],
        description: data['explanation'],
        imageUrl: data['url']);
        
  } else {
    throw Exception('Failed to load APOD');
  }
}
