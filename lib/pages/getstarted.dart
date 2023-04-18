import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:layer/Components/navbar.dart';
import 'package:layer/pages/Employee%20Pages/businessemployee.dart';
import 'package:layer/pages/Employee%20Pages/itemployee.dart';
import 'package:layer/pages/Employee%20Pages/marketingemployee.dart';
import 'package:layer/pages/Employee%20Pages/operationsemployee.dart';

class GetStartedPage extends StatefulWidget {
  const GetStartedPage({super.key});

  @override
  State<GetStartedPage> createState() => _GetStartedPageState();
}

class _GetStartedPageState extends State<GetStartedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: const Color(0xffE8E8Eb),
          elevation: 0,
        ),
        drawer: NavBar(),
        body: SingleChildScrollView(
          child: SafeArea(
              child: Column(
            children: [
              Container(
                  padding: const EdgeInsets.all(20),
                  alignment: Alignment.topLeft,
                  child: const Text(
                    'Organisation Details',
                    style: TextStyle(fontSize: 46),
                  )),
              const SizedBox(
                height: 10,
              ),
              Container(
                  width: 400,
                  height: 200,
                  alignment: Alignment.topLeft,
                  padding: const EdgeInsets.all(20),
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: Color(0xff9F66D4)),
                  child: Column(
                    children: const [
                      Text(
                        'Ricky IT',
                        style: TextStyle(
                          fontSize: 46,
                          fontFamily: 'Roboto',
                          color: Colors.white
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'rickyit@gmail.com',
                        style: TextStyle(fontSize: 20,color: Colors.white),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text('Computer Software', style: TextStyle(fontSize: 20,color: Colors.white))
                    ],
                  )),
              Container(
                  padding: const EdgeInsets.only(top: 20, left: 22),
                  alignment: Alignment.topLeft,
                  child: const Text(
                    'Departments',
                    style: TextStyle(fontSize: 34),
                  )),
              const SizedBox(
                height: 20,
              ),
              Container(
                  width: 400,
                  height: 260,
                  alignment: Alignment.topLeft,
                  padding: const EdgeInsets.all(20),
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: Color(0xff9F66D4)),
                  child: Column(
                    children: [
                      const Text(
                        'Technical',
                        style: TextStyle(
                          fontSize: 46,
                          fontFamily: 'Roboto',
                          color: Colors.white
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
                        'Transforming business through innovative technology solutions. Driving efficiency, agility, and growth for a connected world.',
                        style: TextStyle(fontSize: 20,color: Colors.white),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      ElevatedButton(onPressed: () {
                        Navigator.push(
                context,
              MaterialPageRoute(builder: ((context) { return ItEmployees();})));
                      },  style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
          ),child: const Text('Contributors', style: TextStyle(color: Colors.black),))
                    ],
                  )),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                  width: 400,
                  height: 280,
                  alignment: Alignment.topLeft,
                  padding: const EdgeInsets.all(20),
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: Color(0xff9F66D4)),
                  child: Column(
                    children: [
                      const Text(
                        'Marketing',
                        style: TextStyle(
                          fontSize: 46,
                          fontFamily: 'Roboto',
                          color: Colors.white
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
                        'Creating Connections, Building Brands. Innovative marketing solutions that engage, inspire, and drive growth. Your partner in strategic marketing success.',
                        style: TextStyle(fontSize: 20,color: Colors.white),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      ElevatedButton(onPressed: () {
                        Navigator.push(
                context,
              MaterialPageRoute(builder: ((context) { return MarketingEmployees();})));
                      },  style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
          ),child: const Text('Contributors', style: TextStyle(color: Colors.black),))
                    ],
                  )),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                  width: 400,
                  height: 290,
                  alignment: Alignment.topLeft,
                  padding: const EdgeInsets.all(20),
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: Color(0xff9F66D4)),
                  child: Column(
                    children: [
                      const Text(
                        'Operations',
                        style: TextStyle(
                          fontSize: 46,
                          fontFamily: 'Roboto',
                          color: Colors.white
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
                        'Streamlining Processes, Driving Performance. Efficient operations for sustainable growth. Your partner in optimizing performance, reducing costs, and enhancing customer experience.',
                        style: TextStyle(fontSize: 20,color: Colors.white),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      ElevatedButton(onPressed: () {
                        Navigator.push(
                context,
              MaterialPageRoute(builder: ((context) { return OperationsEmployees();})));
                      },  style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
          ),child: const Text('Contributors', style: TextStyle(color: Colors.black),))
                    ],
                  )),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                  width: 400,
                  height: 280,
                  alignment: Alignment.topLeft,
                  padding: const EdgeInsets.all(20),
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: Color(0xff9F66D4)),
                  child: Column(
                    children: [
                      const Text(
                        'Business',
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
                        'Innovating for Success, Driving Growth. Strategic solutions for sustainable business growth. Your partner in navigating change, seizing opportunities, and achieving success.',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      ElevatedButton(onPressed: () {
                        Navigator.push(
                context,
              MaterialPageRoute(builder: ((context) { return BusinessEmployees();})));
                      },  style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
          ),child: const Text('Contributors', style: TextStyle(color: Colors.black),))
                    ],
                  ))
            ],
          )),
        ));
  }
}

