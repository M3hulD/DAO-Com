import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:layer/model/result.dart';

class ItEmployees extends StatefulWidget {
  const ItEmployees({super.key});

  @override
  State<ItEmployees> createState() => _ItEmployeesState();
}

class _ItEmployeesState extends State<ItEmployees> {
  String name = '';
  var department;
  var email;
  var walletAddress;
  var orgId;

  Future<List<Result>> getEmployees() async {
    http.Response response =
        await http.get(Uri.parse("https://daocom.onrender.com/employees/filter/Technical"));
    var results = jsonDecode(response.body);
    List<Result> list1 = [];
    for (var result in results) {
      Result r = Result.fromMap(result);
      list1.add(r);
    }
    return list1;
  }

  @override
  void initState() {
    super.initState();
    getEmployees();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: SafeArea(
        child: Column(
          children: [
            Container(
              child: Column(
                children: [
                  FutureBuilder<List<Result>>(
                      future: getEmployees(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: snapshot.data!.length,
                              itemBuilder: (context, index) {
                                return Container(
                                  margin: const EdgeInsets.only(
                                      left: 10, right: 10, bottom: 10),
                                  padding: const EdgeInsets.only(top: 15, left: 20, bottom: 10),
                                  alignment: Alignment.centerLeft,
                                  decoration: const BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(20)),
                                      color: Color(0xff9F66D4)),
                                  height:
                                      MediaQuery.of(context).size.height / 3,
                                  width: MediaQuery.of(context).size.width,
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        'assets/avatar.png',
                                        width: 200,
                                      ),
                                      Column(
                                        children: [
                                          SizedBox(height: 20,),
                                          Text(snapshot.data![index].name, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            snapshot.data![index].department,
                                            style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold   
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Container(
                                            height: 2,
                                            width: 160,
                                            margin: const EdgeInsets.only(left: 17),
                                            decoration: const BoxDecoration(
                                                color: Colors.black),
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            snapshot.data![index].email, 
                                            style: TextStyle(
                                              fontSize: 18
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                           wrap(snapshot.data![index].walletAddress, 20),
                                          ),
                                          SizedBox(height: 10,),
                                          Text(" Amount:1", style: TextStyle(fontSize: 18),),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          ElevatedButton(onPressed: (){},
                                          style: ButtonStyle(
                                            backgroundColor: MaterialStateProperty.all<Color>(Colors.white)
                                          ),
                                           child: Text('Pay Salary', style: TextStyle(color: Colors.black),), )
                                        ],
                                      )
                                    ],
                                  ),
                                );
                              });
                        }
                        return Container();
                      }),
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}

String wrap(String text, int maxLength) {
  return text.splitMapJoin(
    RegExp('.{1,$maxLength}'), // Maximum line width of maxLength characters
    onMatch: (Match match) => '${match.group(0)}\n',
    onNonMatch: (String nonMatch) => nonMatch,
  );
}
