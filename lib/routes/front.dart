import 'package:flutter/material.dart';
import 'package:kosmos/widgets/date_selector.dart';
import 'package:kosmos/widgets/main_card.dart';
import 'package:kosmos/widgets/nav_card.dart';
import 'package:kosmos/widgets/detailed_content.dart';
import 'package:kosmos/services/apod.dart';

class Front extends StatefulWidget {
  const Front({super.key});

  @override
  State<Front> createState() => _FrontState();
}

class _FrontState extends State<Front> {

  Future<Map<String, dynamic>> fetchData(String date) async {
    final nasaApi = NasaApi("YOUR_API_KEY"); // Replace with your actual API key
    final data = await nasaApi.fetchAPOD(date);
    return data;
  }
  @override
  Widget build(BuildContext context) {
    return Scrollable(
      axisDirection: AxisDirection.down,
      viewportBuilder: (context, position) {
        return ListView(
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: MainCard(),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: NavCard(),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: DateSelector(
                onDateSelected: (selectedDate) async {
                  // final data = await fetchData(selectedDate);
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => DetailedContent(
                        selectedDate: selectedDate,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
