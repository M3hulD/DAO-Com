import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class GrantsPageOrg extends StatefulWidget {
  @override
  _GrantsPageOrgState createState() => _GrantsPageOrgState();
}

class _GrantsPageOrgState extends State<GrantsPageOrg> {
  final _formKey = GlobalKey<FormState>();
  late String _title;
  late String _description;
  late String _amount;
  late String _deadline;
  late String _walletAddress;
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _amountController = TextEditingController();
  final _deadlineController = TextEditingController();
  final _walletAddressController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _amountController.dispose();
    _deadlineController.dispose();
    _walletAddressController.dispose();
    super.dispose();
  }

  final url = 'https://daocom.onrender.com/grants';

  void clearForm () {
   _titleController.clear();
        _descriptionController.clear();
        _amountController.clear();
        _deadlineController.clear();
        _walletAddressController.clear();
        setState() {};
 }

  void postData() async {
    try{
    final response = await post(Uri.parse(url), body: {
      "title": _titleController.text,
      "description": _descriptionController.text,
      "deadline": _deadlineController.text,
      "amount": _amountController.text,
      "walletAddress": _walletAddressController.text,
      "__v": "0"
    });

    log(response.body);
    
       if(response.statusCode==200){
        clearForm();
    }
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
                    labelText: 'Amount',
                  ),
                  controller: _amountController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter amount';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _amount = value!;
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
    
  }
}

