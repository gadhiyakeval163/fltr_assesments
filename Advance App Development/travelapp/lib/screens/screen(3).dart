
import 'package:flutter/material.dart';
import 'package:travelapp/screens/screen(4).dart';

class Myplacestoseepage extends StatefulWidget {
  const Myplacestoseepage({super.key, Key});

  @override
  State<Myplacestoseepage> createState() => _MyplacetoseepageState();
}

class _MyplacetoseepageState extends State<Myplacestoseepage> {
  List<String> historicalPlaces = [
    'PRADYUMAN PARK',
    'CHAMUNDA TEMPLE',
    'HINGOLGADH PALACE',
    'KHODALDHAM TEMPLE',
    'MORBI PALACE',
    'VIRPUR JALARAM MANDIR',
    'GONDAL CITY',
    'WANKANER PALACE'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
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
          'Places to see around',
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
                Icon(Icons.location_on, color: Colors.red, size: 30.0),
                SizedBox(width: 10.0),
                Text(
                  historicalPlaces[index],
                  style: TextStyle(fontSize: 18.0, color: Colors.red),
                ),
                Spacer(),
                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MYpradyumanparkPage()),
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
