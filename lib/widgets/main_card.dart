// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:async';
// import 'dart:convert';
// // import '../services/server.dart' as server;

// class MainCard extends StatefulWidget {
//   const MainCard({super.key});

//   @override
//   State<MainCard> createState() => _MainCardState();
// }

// class _MainCardState extends State<MainCard> {
//   late Map<String, dynamic> data;

//   @override
//   void initState() {
//     super.initState();
//     // fetchAPOD("2023-10-10");
//   }

//   Future<void> fetchAPOD(String date) async {
//     final response = await http.get(
//       Uri.parse(
//           'https://api.nasa.gov/planetary/apod?api_key=DEMO_KEY&date=$date'),
//     );

//     if (response.statusCode == 200) {
//       setState(() {
//         data = json.decode(response.body);
//       });
//     } else {
//       throw Exception('Failed to load APOD');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return ClipRRect(
//       borderRadius: BorderRadius.circular(30),
//       child: Card(
//         color: Colors.grey[300],
//         elevation: 0,
//         child: Padding(
//           padding: const EdgeInsets.all(15.0),
//           child: Column(children: [
//             const SizedBox(
//               height: 8.0,
//             ),
//             const Text(
//               "Today's Image",
//               style: TextStyle(
//                 fontWeight: FontWeight.w700,
//                 color: Color.fromARGB(255, 112, 112, 112),
//                 fontSize: 20,
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
//               child: ClipRRect(
//                 borderRadius: BorderRadius.circular(20),
//                 child: Image.asset(
//                   "assets/images/sampleimage.jpg",
//                 ),
//               ),
//             ),
//             const Text(
//               "Aurora Borealis",
//               textAlign: TextAlign.start,
//               style: TextStyle(
//                 fontWeight: FontWeight.w700,
//                 fontSize: 20,
//               ),
//             ),
//             const SizedBox(
//               height: 8.0,
//             ),
//             const Text(
//               "The Northern Lights are a natural light display in the Earth's sky, predominantly seen in high-latitude regions (around the Arctic and Antarctic).",
//               style: TextStyle(
//                 fontSize: 20,
//               ),
//             ),
//             const SizedBox(
//               height: 10.0,
//             ),
//             ElevatedButton(
//               onPressed: () {},
//               child: const Text("Read More"),
//             )
//           ]),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import "package:kosmos/services/apod.dart";
// import 'package:kosmos/widgets/detailed_content.dart';
import 'package:kosmos/widgets/details.dart';

class MainCard extends StatefulWidget {
  const MainCard({super.key});

  @override
  State<MainCard> createState() => _MainCardState();
}

class _MainCardState extends State<MainCard> {
  late Map<String, dynamic> data;
  final NasaApi nasaApi =
      NasaApi("DEMO_KEY"); // Replace with your actual API key

  @override
  void initState() {
    super.initState();
    // Fetch APOD data for the initial date
    fetchAPOD("2023-10-10");
  }

  Future<void> fetchAPOD(String date) async {
    nasaApi.fetchAPOD(date).then((result) {
      setState(() {
        data = result;
      });
    }).catchError((error) {
      print(error);
      // Handle the error as needed.
    });
  }

   void navigateToDetailedContent() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => Details(
          title: data['title'] ?? '',
          description: data['explanation'] ?? '',
          imageUrl: data['url'] ?? '',
        ),
      ),
    );
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
          child: Column(
            children: [
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
                  child: Image.network(
                    data['url'] ??
                        '', // Use Image.network to display the image from the URL
                    // height: 200, // Adjust the image height as needed
                    // width: 200, // Adjust the image width as needed
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Text(
                data['title'] ?? '',
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                ),
              ),
              const SizedBox(
                height: 8.0,
              ),
              Text(
                data['explanation'] ?? '',
                maxLines: 4, // Display a maximum of 4 lines
                overflow: TextOverflow
                    .ellipsis, // Add ellipsis (...) for overflowed text
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              ElevatedButton(
        onPressed: navigateToDetailedContent, // Navigate to the detailed content
        child: const Text("Read More"),
      ),
            ],
          ),
        ),
      ),
    );
  }
}
