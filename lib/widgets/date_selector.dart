import 'package:flutter/material.dart';

class DateSelector extends StatefulWidget {
  final Function(String) onDateSelected;

  const DateSelector({Key? key, required this.onDateSelected})
      : super(key: key);

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
      final selectedDate = "${picked.year}-${picked.month}-${picked.day}";
      widget.onDateSelected(
          selectedDate); // Pass the selected date to the parent widget
      setState(() {
        this.selectedDate = selectedDate;
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 194, 194, 194),
                      minimumSize: const Size(250, 50),
                    ),
                    onPressed: () {
                      _selectDate(context);
                    },
                    child: Text(
                        selectedDate != null ? "$selectedDate" : "Select date"),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
