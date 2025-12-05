import 'package:flutter/material.dart';
import 'package:learn_romania/constant/colors.dart';
import 'package:learn_romania/constant/utils.dart';
import 'package:url_launcher/url_launcher.dart';

class DrawerPage extends StatelessWidget {
  const DrawerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: ScreenUtils.getWidth(context) / 1.3,
      child: Container(
        decoration:
            const BoxDecoration(color: Color.fromARGB(231, 108, 150, 221)),
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: const BoxDecoration(
                color: konAppbar, // Background color of the DrawerHeader
              ),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 30, // Radius of the avatar
                    backgroundImage: AssetImage(
                        'assets/logo.png'), // Replace with your image asset
                  ),
                  const SizedBox(width: 10), // Space between avatar and text
                  Text(
                    'EK AppZone',
                    style: TextStyle(
                      color: const Color.fromARGB(255, 0, 0, 0),
                      fontSize: ScreenUtils.getSize(context, 0.8),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              title: Text(
                "EK App Zone is a forward-thinking digital solution company  in Sri Lanka, dedicated to delivering innovative app solutions. Our expertise lies in creating cutting-edge applications that cater to the evolving needs of businesses and individuals. We combine technology with creativity to offer products that enhance efficiency, connectivity, and user experience.",
                style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: ScreenUtils.getSize(context, 0.6)),
              ),
              onTap: () {
                // Handle item 1 tap
                Navigator.pop(context); // Close the drawer
              },
            ),
            ListTile(
              leading: const Icon(Icons.email),
              title: const Text('Ekappzone@gmail.com'),
              onTap: () {
                // Handle item 2 tap
                Navigator.pop(context); // Close the drawer
              },
            ),

            ListTile(
              leading: const Icon(Icons.web_stories_sharp),
              title: const Text('EKAPPzone.com'),
              onTap: () async {
                const url = 'https://ekappzone.github.io/ekappzone/';
                if (await canLaunch(url)) {
                  await launch(url);
                } else {
                  throw 'Could not launch $url';
                }
              },
            ),

            // Add more ListTile items as needed
          ],
        ),
      ),
    );
  }
}
