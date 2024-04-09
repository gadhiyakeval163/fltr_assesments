import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travelapp/screens/screen(2).dart';

class Myhistoricalplacepage extends StatefulWidget {
  const Myhistoricalplacepage({Key? key});

  @override
  State<Myhistoricalplacepage> createState() => _MyhistoricalplacepageState();
}

class _MyhistoricalplacepageState extends State<Myhistoricalplacepage> {
  List<String> historicalPlaces = [
    'ALFRED HIGH SCHOOL',
    'KABA GANDHI NO DELO',
    'RAIYA NAKA & BEDI NAKA',
    'RAJKUMAR COLLAGE',
    'RASTRIYA SHALA',
    'WASTON MESEUM'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Historical Places',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView.builder(
        itemCount: historicalPlaces.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Row(
              children: [
                Icon(Icons.location_on, color:Colors.blue,size: 30.0),
                SizedBox(width: 10.0),
                Text(
                  historicalPlaces[index],
                  style: TextStyle(fontSize: 18.0, color: Colors.blue),
                ),
                Spacer(),
                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MyAlfredHighSchoolPage()),
                    );
                  },
                  icon: Icon(Icons.arrow_forward),
                  color: Colors.black,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
