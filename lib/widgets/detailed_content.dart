// import 'package:flutter/material.dart';

// class DetailedContent extends StatelessWidget {
//   String title;
//   String description;
//   String imageUrl;
//   String selectedDate; // Add the selectedDate parameter

 
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Detailed Content'),
//       ),
//        body: SingleChildScrollView( // Wrap the content in a SingleChildScrollView
//         child: Column(
//           children: [
//             Image.network(imageUrl), // Display the image
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Text(
//                 title,
//                 style: TextStyle(
//                   fontWeight: FontWeight.w700,
//                   fontSize: 20,
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Text(
//                 description,
//                 style: TextStyle(fontSize: 18),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }




import 'package:flutter/material.dart';
import 'package:kosmos/services/apod.dart'; // Import the NasaApi class from the separate file

class DetailedContent extends StatefulWidget {
  final String selectedDate;

  DetailedContent({
    required this.selectedDate,
  });

  @override
  _DetailedContentState createState() => _DetailedContentState();
}

class _DetailedContentState extends State<DetailedContent> {
  String title = "Loading...";
  String description = "";
  String imageUrl = "";
  late NasaApi nasaApi; // Mark nasaApi as 'late'

  @override
  void initState() {
    super.initState();
    nasaApi = NasaApi('DEMO_KEY'); // Replace with your actual API key
    _fetchAPODData();
  }

  Future<void> _fetchAPODData() async {
    try {
      final data = await nasaApi.fetchAPOD(widget.selectedDate);
      setState(() {
        title = data['title'];
        description = data['explanation'];
        imageUrl = data['url'];
      });
    } catch (error) {
      setState(() {
        title = "Failed to load APOD";
      });
      print('Error: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detailed Content'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(imageUrl), // Display the image
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                description,
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
