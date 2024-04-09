import 'package:flutter/material.dart';

class MyAlfredHighSchoolPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Alfred High School',
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
              'assets/images/schoolimage.jpeg', 
              width: double.infinity, 
              fit: BoxFit.cover, 
            ),
          

            SizedBox(height: 10),
            Text(
              'Info:',
              style: TextStyle(
                fontSize: 30,
                color: Colors.blue,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'This school was constructed during British rule in India by political agent Kernel Singh, and was the first English school in the saurashtra (region). Originally called Rajkot English School, it was founded on 17 October 1853, and later became a full-fledged high school. By 1868 it came to be known as Rajkot High School, and was named Alfred High School in 1907.',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
