import 'package:flutter/material.dart';


class DateSelector extends StatefulWidget {
  const DateSelector({super.key});

  @override
  State<DateSelector> createState() => _DateSelectorState();
}

class _DateSelectorState extends State<DateSelector> {
  String? selectedDate;
   Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != DateTime.now()) {
      setState(() {
        selectedDate = "${picked.year}, ${picked.month}, ${picked.day}";
        print(selectedDate);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey[300],
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            const Text("Select Date"),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          const Color.fromARGB(255, 194, 194, 194),
                      minimumSize: const Size(250, 50),
                    ),
                    onPressed: () {
                      _selectDate(context);
                    },
                    child: Text(selectedDate != null
                        ? "$selectedDate"
                        : "Select date"),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text("See"),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
