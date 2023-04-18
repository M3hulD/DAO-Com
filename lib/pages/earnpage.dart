import 'package:flutter/material.dart';
import 'package:layer/pages/dev/developerpage.dart';
import 'org/orgpage.dart';

class EarnPage extends StatelessWidget {
  const EarnPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Column(
        children: [
          const SizedBox(height: 180,),
          Center(
      child: Container(
                  width: 400,
                  height: 250,
                  alignment: Alignment.topLeft,
                  padding: const EdgeInsets.all(20),
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: Color(0xff9F66D4)),
                  child: Column(
                    children: [
                      const Text(
                        'Looking for Talent?',
                        style: TextStyle(
                          fontSize: 46,
                          fontFamily: 'Roboto',
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        color: Colors.black,
                        height: 2,width: 400,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        'List a bounty, job, or grant for your project and find your next contributor or employee.',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      ElevatedButton(onPressed: () {
                        Navigator.push(
                context,
              MaterialPageRoute(builder: ((context) { return OrgPage();})));
                      },  style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
          ),child: const Text('List Your Opportunity', style: TextStyle(color: Colors.black),))
                    ],
                  ))
    ),
    const SizedBox(height: 10,),
    Container(
                  width: 400,
                  height: 250,
                  alignment: Alignment.topLeft,
                  padding: const EdgeInsets.all(20),
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: Color(0xff9F66D4)),
                  child: Column(
                    children: [
                      const Text(
                        'Looking to Earn?',
                        style: TextStyle(
                          fontSize: 46,
                          fontFamily: 'Roboto',
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        color: Colors.black,
                        height: 2,width: 400,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        'Create a profile to get notified when new earning opportunities get posted and build your on-chain resume.',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      ElevatedButton(onPressed: () {Navigator.push(
                context,
              MaterialPageRoute(builder: ((context) { return DeveloperPage();})));},  style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
          ),child: const Text('Get to Work', style: TextStyle(color: Colors.black),))
                    ],
                  ))
        ],
      )),
    );
  }
}