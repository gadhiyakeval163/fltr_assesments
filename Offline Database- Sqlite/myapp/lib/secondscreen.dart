import 'package:flutter/material.dart';

class MySecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Search',
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(
                    Icons.remove_circle,
                    color: Colors.orange,
                  ),
                  onPressed: () {},
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Search ',
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(
                    Icons.remove_circle,
                    color: Colors.orange,
                  ),
                  onPressed: () {},
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Search ',
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(
                    Icons.remove_circle,
                    color: Colors.orange,
                  ),
                  onPressed: () {},
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Search ',
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(
                    Icons.remove_circle,
                    color: Colors.orange,
                  ),
                  onPressed: () {},
                ),
              ],
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Image.network(
                      'https://images.pexels.com/photos/209807/pexels-photo-209807.jpeg?cs=srgb&dl=pexels-pixabay-209807.jpg&fm=jpg'),
                  SizedBox(width: 10),
                  Image.network(
                      'https://images.pexels.com/photos/209807/pexels-photo-209807.jpeg?cs=srgb&dl=pexels-pixabay-209807.jpg&fm=jpg'),
                  SizedBox(width: 10),
                  Image.network(
                      'https://images.pexels.com/photos/209807/pexels-photo-209807.jpeg?cs=srgb&dl=pexels-pixabay-209807.jpg&fm=jpg'),
                  SizedBox(width: 10),
                  Image.network(
                      'https://images.pexels.com/photos/209807/pexels-photo-209807.jpeg?cs=srgb&dl=pexels-pixabay-209807.jpg&fm=jpg'),
                  SizedBox(width: 10),
                  Image.network(
                      'https://images.pexels.com/photos/209807/pexels-photo-209807.jpeg?cs=srgb&dl=pexels-pixabay-209807.jpg&fm=jpg'),
                ],
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Add Meaning'),
                ),
                IconButton(
                  icon: Icon(Icons.photo),
                  onPressed: () {},
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Add Example'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
