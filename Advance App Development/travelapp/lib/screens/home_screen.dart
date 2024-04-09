import 'package:flutter/material.dart';
import 'package:travelapp/screens/screen(1).dart';
import 'package:travelapp/screens/screen(3).dart';

class MyLocalScreen extends StatefulWidget {
  const MyLocalScreen({super.key, Key});

  @override
  State<MyLocalScreen> createState() => _MyLocalscreenState();
}

class _MyLocalscreenState extends State<MyLocalScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {},
                child: const IconButtonContainer(
                    icon: Icons.home,
                    color: Colors.orange,
                    text: 'About Rajkot'),
              ),
              const InkWell(
                child: IconButtonContainer(
                  icon: Icons.bus_alert_sharp,
                  color: Colors.grey,
                  text: 'How to Reach',
                ),
              ),
              const InkWell(
                child: IconButtonContainer(
                    icon: Icons.home,
                    color: Colors.green,
                    text: 'Rajkot in Map'),
              ),
            ],
          ),
          SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Myhistoricalplacepage()),
                  );
                },
                child: const IconButtonContainer(
                    icon: Icons.place_sharp,
                    color: Colors.blueGrey,
                    text: 'Historical Places'),
              ),
              const IconButtonContainer(
                  icon: Icons.home_outlined,
                  color: Colors.green,
                  text: 'Devotinal Places'),
              const IconButtonContainer(
                  icon: Icons.park,
                  color: Colors.cyan,
                  text: 'Amusement Parks'),
            ],
          ),
          SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const IconButtonContainer(
                  icon: Icons.home,
                  color: Colors.lightBlueAccent,
                  text: 'Dams / Lakes'),
              const IconButtonContainer(
                  icon: Icons.home_filled,
                  color: Colors.lightBlue,
                  text: 'Other Places'),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Myplacestoseepage()));
                },
                child: const IconButtonContainer(
                    icon: Icons.play_for_work_outlined,
                    color: Colors.blueAccent,
                    text: 'Places to See Around'),
              ),
            ],
          ),
          SizedBox(height: 5),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButtonContainer(
                  icon: Icons.money, color: Colors.red, text: 'Cinemas'),
              IconButtonContainer(
                  icon: Icons.home_filled,
                  color: Colors.lightBlue,
                  text: 'Hotels'),
              IconButtonContainer(
                  icon: Icons.business_sharp,
                  color: Colors.blueAccent,
                  text: 'malls'),
            ],
          ),
          SizedBox(height: 5),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButtonContainer(
                  icon: Icons.person_pin_rounded,
                  color: Colors.red,
                  text: 'Travel Guide'),
              IconButtonContainer(
                  icon: Icons.social_distance,
                  color: Colors.lightBlue,
                  text: 'Distances'),
              IconButtonContainer(
                  icon: Icons.developer_board,
                  color: Colors.blueAccent,
                  text: 'Developers'),
            ],
          ),
        ],
      ),
    );
  }
}

class IconButtonContainer extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String text;

  const IconButtonContainer({
    super.key,
    required this.icon,
    required this.color,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.32,
      height: 145,
      color: color,
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: Icon(
                  icon,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Text(
            text,
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          SizedBox(height: 10)
        ],
      ),
    );
  }
}
