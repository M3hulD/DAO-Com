import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class JobPageOrg extends StatefulWidget {
  @override
  _JobPageOrgState createState() => _JobPageOrgState();
}

class _JobPageOrgState extends State<JobPageOrg> {
  final _formKey = GlobalKey<FormState>();
  late String _title;
  late String _description;
  late String _department;
  late String _location;
  late String _type;
  late String _walletAddress;
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _departmentController = TextEditingController();
  final _locationController = TextEditingController();
  final _typeController = TextEditingController();
  final _walletAddressController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _departmentController.dispose();
    _locationController.dispose();
    _typeController.dispose();
    _walletAddressController.dispose();
    super.dispose();
  }

  final url = 'https://daocom.onrender.com/jobs';

  void postData() async {
    try{
    final response = await post(Uri.parse(url), body: {
      "title": _titleController.text,
      "description": _descriptionController.text,
      "department": _departmentController.text,
      "location": _locationController.text,
      "type": _typeController.text,
      "walletAddress": _walletAddressController.text
    });

    log(response.body);
    setState(() {
       if(response.statusCode==200){
      _titleController.clear();
        _descriptionController.clear();
        _departmentController.clear();
        _locationController.clear();
        _typeController.clear();
        _walletAddressController.clear();

    }
    });
   
  } catch (er) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Form'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Title',
                  ),
                  controller: _titleController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter title';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _title = value!;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Description',
                  ),
                  controller: _descriptionController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter description';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _description = value!;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Department',
                  ),
                  controller: _departmentController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter department';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _department = value!;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Location',
                  ),
                  controller: _locationController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter location';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _location = value!;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Type',
                  ),
                  controller: _typeController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter type';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _type = value!;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Wallet Address',
                  ),
                  controller: _walletAddressController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter wallet address';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _walletAddress = value!;
                  },
                ),
                SizedBox(height: 16.0),
                ElevatedButton(
                  child: Text('Submit'),
                  onPressed: postData
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
