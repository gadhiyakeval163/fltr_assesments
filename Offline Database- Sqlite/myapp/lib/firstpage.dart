import 'package:flutter/material.dart';
import 'package:myapp/secondscreen.dart';
import 'package:myapp/thirdscreen.dart';

class MyHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 154, 14, 4),
        leading: IconButton(
          icon: Icon(
            Icons.cancel,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Add to word',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        actions: [
          TextButton(
            onPressed: () {
              _showSaveOptions(context);
            },
            child: Text(
              'Save',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search',
                  ),
                ),
              ),
              IconButton(
                icon: Icon(Icons.search),
                onPressed: () {},
              ),
            ],
          ),
          Expanded(
            child: DefaultTabController(
              length: 4,
              child: Column(
                children: [
                  TabBar(
                    tabs: [
                      Tab(text: 'first page'),
                      Tab(text: 'second page'),
                      Tab(text: 'third screen'),
                      Tab(text: 'four screen'),
                    ],
                  ),
                  Expanded(
                    child: TabBarView(
                      children: [
                        MySecondPage(),
                        mythirdscreen(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showSaveOptions(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          //title: Text('Choose a Save Option'),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                GestureDetector(
                  child: Text('Google'),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                SizedBox(height: 8),
                GestureDetector(
                  child: Text('Yahoo'),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                SizedBox(height: 8),
                GestureDetector(
                  child: Text('Bing'),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                SizedBox(height: 8),
                GestureDetector(
                  child: Text('Dictionary'),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
