import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:layer/model/grant.dart';
import 'dart:convert';

class GrantsPage extends StatefulWidget {
  const GrantsPage({Key? key}) : super(key: key);

  @override
  _GrantsPageState createState() => _GrantsPageState();
}

class _GrantsPageState extends State<GrantsPage> {
  late Future<List<Grants>> _bountyList;

  Future<List<Grants>> _fetchGrantsList() async {
    final response =
        await http.get(Uri.parse('https://daocom.onrender.com/grants'));

    if (response.statusCode == 200) {
      List<dynamic> responseBody = json.decode(response.body);
      return responseBody.map((grants) => Grants.fromMap(grants)).toList();
    } else {
      throw Exception('Failed to Grants');
    }
  }

  @override
  void initState() {
    super.initState();
    _bountyList = _fetchGrantsList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors .blueGrey[50]
        ,
        title: const Text('Grants List', style: TextStyle(color: Colors.black),),
      ),
      body: FutureBuilder<List<Grants>>(
        future: _bountyList,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final bounty = snapshot.data![index];
                return Container(
                  margin:
                      const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                  padding: const EdgeInsets.only(top: 15, left: 20, bottom: 10),
                  alignment: Alignment.centerLeft,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: Color(0xff9F66D4)),
                  height: MediaQuery.of(context).size.height / 3,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Text('Grants', style: TextStyle(
                        fontSize: 30
                      ),),
                      Container(
                        height: 2,
                        width: 600,
                        margin: const EdgeInsets.only(left: 10, right: 30),
                        decoration: const BoxDecoration(color: Colors.black),
                      ),
                      Text(
                        snapshot.data![index].title,
                        style: const TextStyle(
                            fontSize: 20, ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        snapshot.data![index].description,
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        snapshot.data![index].deadline,
                        style: const TextStyle(fontSize: 18),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        snapshot.data![index].amount,
                        style: const TextStyle(fontSize: 18),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(snapshot.data![index].walletAddress),
                      const SizedBox(
                        height: 10,
                      ),
                      ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:  MaterialStateProperty.all<Color>(Colors.white),
                        ),
                          onPressed: () {}, child: const Text('Apply', style: TextStyle(
                            color: Colors.black
                          ),))
                    ],
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text("${snapshot.error}"),
            );
          }

          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
