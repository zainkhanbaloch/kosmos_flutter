import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
// import '../services/server.dart' as server;

class MainCard extends StatefulWidget {
  const MainCard({super.key});

  @override
  State<MainCard> createState() => _MainCardState();
}

class _MainCardState extends State<MainCard> {
  late Map<String, dynamic> data;

  @override
  void initState() {
    super.initState();
    // fetchAPOD("2023-10-10");
  }

  Future<void> fetchAPOD(String date) async {
    final response = await http.get(
      Uri.parse(
          'https://api.nasa.gov/planetary/apod?api_key=DEMO_KEY&date=$date'),
    );

    if (response.statusCode == 200) {
      setState(() {
        data = json.decode(response.body);
      });
    } else {
      throw Exception('Failed to load APOD');
    }
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: Card(
        color: Colors.grey[300],
        elevation: 0,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(children: [
            const SizedBox(
              height: 8.0,
            ),
            const Text(
              "Today's Image",
              style: TextStyle(
                fontWeight: FontWeight.w700,
                color: Color.fromARGB(255, 112, 112, 112),
                fontSize: 20,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  "assets/images/sampleimage.jpg",
                ),
              ),
            ),
            const Text(
              "Aurora Borealis",
              textAlign: TextAlign.start,
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 20,
              ),
            ),
            const SizedBox(
              height: 8.0,
            ),
            const Text(
              "The Northern Lights are a natural light display in the Earth's sky, predominantly seen in high-latitude regions (around the Arctic and Antarctic).",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text("Read More"),
            )
          ]),
        ),
      ),
    );
  }
}
