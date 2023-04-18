import 'package:flutter/material.dart';
import 'package:layer/pages/dev/bountypagedev.dart';
import 'package:layer/pages/dev/grantspagedev.dart';
import 'package:layer/pages/dev/jobpagedev.dart';

class DeveloperPage extends StatelessWidget {
  const DeveloperPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Center(
        child: Column(
          children: [
            const SizedBox(height: 350,),
            Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(150))
            ),
            height: 80,
            width: 250,
            child: ElevatedButton(
  onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: ((context) {
                    return BountyPage();
                  })));
                },
  style: ElevatedButton.styleFrom(
    backgroundColor: const Color.fromRGBO(167, 139, 250, 1), // Sets the background color
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20), // Sets the border radius
    ),
  ),
  child: Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: const [
      Icon(Icons.person_add, size: 40), // Adds the icon to the button
      SizedBox(width: 5), // Adds a small space between the icon and the text
      Text(
        "Bounties", // Sets the text of the button
        style: TextStyle(
          fontSize: 34, // Sets the font size of the text
        ),
      ),
    ],
  ),
)
          ),
            const SizedBox(height: 10),
            Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(150))
            ),
            height: 80,
            width: 250,
            child: ElevatedButton(
  onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: ((context) {
                    return GrantsPage();
                  })));
                },
  style: ElevatedButton.styleFrom(
    backgroundColor: const Color.fromRGBO(167, 139, 250, 1), // Sets the background color
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20), // Sets the border radius
    ),
  ),
  child: Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: const [
      Icon(Icons.person_add, size: 40), // Adds the icon to the button
      SizedBox(width: 5), // Adds a small space between the icon and the text
      Text(
        "Grants", // Sets the text of the button
        style: TextStyle(
          fontSize: 34, // Sets the font size of the text
        ),
      ),
    ],
  ),
)
          ),
            const SizedBox(height: 10),
            Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(150))
            ),
            height: 80,
            width: 250,
            child: ElevatedButton(
  onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: ((context) {
                    return JobPage();
                  })));
                },
  style: ElevatedButton.styleFrom(
    backgroundColor: const Color.fromRGBO(167, 139, 250, 1), // Sets the background color
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20), // Sets the border radius
    ),
  ),
  child: Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: const [
      Icon(Icons.person_add, size: 40), // Adds the icon to the button
      SizedBox(width: 5), // Adds a small space between the icon and the text
      Text(
        "Jobs", // Sets the text of the button
        style: TextStyle(
          fontSize: 34, // Sets the font size of the text
        ),
      ),
    ],
  ),
)
          ),
          ],
        )
      )),
    );
  }
}