import 'package:http/http.dart' as http;
import 'dart:convert';

class NasaApi {
  final String apiKey;

  NasaApi(this.apiKey);

  Future<Map<String, dynamic>> fetchAPOD(String date) async {
    final response = await http.get(
      Uri.parse('https://api.nasa.gov/planetary/apod?api_key=$apiKey&date=$date'),
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load APOD');
    }
  }
}
