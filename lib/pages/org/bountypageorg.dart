import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class BountyPageOrg extends StatefulWidget {
  @override
  _BountyPageOrgState createState() => _BountyPageOrgState();
}

class _BountyPageOrgState extends State<BountyPageOrg> {
  final _formKey = GlobalKey<FormState>();
  late String _title;
  late String _description;
  late String _rewards;
  late String _tags;
  late String _deadline;
  late String _walletAddress;
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _rewardsController = TextEditingController();
  final _tagsController = TextEditingController();
  final _deadlineController = TextEditingController();
  final _walletAddressController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _rewardsController.dispose();
    _tagsController.dispose();
    _deadlineController.dispose();
    _walletAddressController.dispose();
    super.dispose();
  }

  final url = 'https://daocom.onrender.com/bounties';

  void postData() async {
    try{
    final response = await post(Uri.parse(url), body: {
      "title": _titleController.text,
      "description": _descriptionController.text,
      "deadline": _deadlineController.text,
      "tags": _tagsController.text,
      "rewards": _rewardsController.text,
      "walletAddress": _walletAddressController.text
    });

    log(response.body);
    setState(() {
       if(response.statusCode==200){
      _titleController.clear();
        _descriptionController.clear();
        _rewardsController.clear();
        _tagsController.clear();
        _deadlineController.clear();
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
                    labelText: 'Rewards',
                  ),
                  controller: _rewardsController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter rewards';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _rewards = value!;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Tags',
                  ),
                  controller: _tagsController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter tags';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _tags = value!;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Deadline',
                  ),
                  controller: _deadlineController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter deadline';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _deadline = value!;
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
                  // () {
                  //   if (_formKey.currentState!.validate()) {
                  //     _formKey.currentState!.save();
                  //   }
                  // },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
