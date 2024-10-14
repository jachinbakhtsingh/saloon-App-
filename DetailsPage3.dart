import 'package:flutter/material.dart';

class DetailsPage3 extends StatefulWidget {
  @override
  _DetailsPage3State createState() => _DetailsPage3State();
}

class _DetailsPage3State extends State<DetailsPage3> {
  List<Map<String, String>> selectedServices = [];
  DateTime? selectedDate;
  TimeOfDay? selectedTime;

  void updateSelection(String service, String duration, String rate) {
    setState(() {
      if (selectedServices.any((element) => element['service'] == service)) {
        selectedServices.removeWhere((element) => element['service'] == service);
      } else {
        selectedServices.add({'service': service, 'duration': duration, 'rate': rate});
      }
    });
  }

  String getTotalDuration() {
    int totalMinutes = 0;

    for (var service in selectedServices) {
      String duration = service['duration']!;
      int minutes = int.parse(duration.split(' ')[0]);
      totalMinutes += minutes;
    }

    return 'Duration: ${totalMinutes} min';
  }

  String getTotalRate() {
    int totalRate = 0;

    for (var service in selectedServices) {
      String rate = service['rate']!;
      totalRate += int.parse(rate);
    }

    return 'Rate: \$${totalRate.toString()}';
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (picked != null) {
      final now = DateTime.now();
      final selectedDateTime = DateTime(
        now.year,
        now.month,
        now.day,
        picked.hour,
        picked.minute,
      );

      if (selectedDateTime.isAfter(DateTime(now.year, now.month, now.day, 8, 59)) &&
          selectedDateTime.isBefore(DateTime(now.year, now.month, now.day, 22, 1))) {
        setState(() {
          selectedTime = picked;
        });
      } else {
        // Show a message to the user that the selected time is out of range
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Please select a time between 9:00 AM and 10:00 PM.'),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    '../assets/cut2.jpg', // Replace with your image asset path
                    width: 100, // Adjust the width as needed
                    height: 150, // Adjust the height as needed
                  ),
                  SizedBox(width: 20), // Space between image and text
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Name: John Doe',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'Age: 30',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'Phone Number: 123-456-7890',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'Experience: 10 years',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'Rate: \$50/hour',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            ClipPath(
              child: Container(
                color: Colors.orange,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'General Category',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 20),
                      Wrap(
                        spacing: 10,
                        runSpacing: 10,
                        children: [
                          buildServiceButton('Basic Haircut', '30 min', '120'),
                          buildServiceButton('Coloring', '20 min', '80'),
                          buildServiceButton('Treatment', '60 min', '500'),
                          buildServiceButton('Massage', '45 min', '800'),
                          buildServiceButton('Kids Haircut', '30 min', '80'),
                        ],
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Date and Time',
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          ElevatedButton(
                            onPressed: () => _selectDate(context),
                            child: Text('Select Date'),
                          ),
                          ElevatedButton(
                            onPressed: () => _selectTime(context),
                            child: Text('Select Time'),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Date: ${selectedDate != null ? selectedDate.toString() : 'Not selected'}',
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Time: ${selectedTime != null ? selectedTime!.format(context) : 'Not selected'}',
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(height: 10),
                      Text(
                        getTotalDuration(),
                        style: TextStyle(fontSize: 16, color: Colors.black54),
                      ),
                      SizedBox(height: 10),
                      Text(
                        getTotalRate(),
                        style: TextStyle(fontSize: 16, color: Colors.black54),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildServiceButton(String service, String duration, String rate) {
    bool isSelected = selectedServices.any((element) => element['service'] == service);
    return TextButton(
      onPressed: () {
        updateSelection(service, duration, rate);
      },
      style: TextButton.styleFrom(
        backgroundColor: isSelected ? Colors.grey : Colors.white,
        primary: Colors.black,
      ),
      child: Text(service),
    );
  }
}

void main() {
  runApp(MaterialApp(home: DetailsPage3()));
}
