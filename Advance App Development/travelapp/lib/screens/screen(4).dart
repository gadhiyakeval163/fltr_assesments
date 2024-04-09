import 'package:flutter/material.dart';

class MYpradyumanparkPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 129, 38, 3),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'pradyuman park',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image
            Image.asset(
              'assets/images/park.jpeg',
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 10),
            Text(
              'Info:',
              style: TextStyle(
                fontSize: 30,
                color: Color.fromARGB(255, 129, 38, 3),
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'At a distance of 5 km from Rajkot Junction, Pradyuman Zoological Park is a famous zoo park located on the banks of Lal Pari Lake in Rajkot, Gujarat. Popularly called Rajkot Zoo, it is one of the finest zoological parks in Gujarat and among the must-visit places for wildlife enthusiasts as part of Rajkot holiday packages.',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'Timings:',
              style: TextStyle(
                  fontSize: 20,
                  color: Color.fromARGB(255, 129, 38, 3),
                  fontWeight: FontWeight.bold),
            ),
            Text(
              ' 9 AM - 7 PM, Closed on Fridays',
            ),
          ],
        ),
      ),
    );
  }
}
