// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:asifpractice/model/UserModel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Example3 extends StatefulWidget {
  const Example3({Key? key}) : super(key: key);

  @override
  State<Example3> createState() => _Example3State();
}

List<UserModel> usermodel = [];
Future<List<UserModel>> getUserData() async {
  final response =
      await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
  var data = jsonDecode(response.body.toString());
  if (response.statusCode == 200) {
    for (var i in data) {
      usermodel.add(UserModel.fromJson(i));
    }
    return usermodel;
  } else {
    return usermodel;
  }
}

class _Example3State extends State<Example3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('APIs3'),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: getUserData(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(
                    child: SizedBox(
                      height: 50,
                      width: 50,
                      child: const CircularProgressIndicator(),
                    ),
                  );
                } else {
                  return ListView.builder(
                    itemCount: usermodel.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Column(
                            children: [
                              ReuseableRow(
                                title: 'Name',
                                value: usermodel[index].name.toString(),
                              ),
                              ReuseableRow(
                                title: 'username',
                                value: usermodel[index].username.toString(),
                              ),
                              ReuseableRow(
                                  title: 'address',
                                  value: usermodel[index]
                                      .address!
                                      .geo!
                                      .lat
                                      .toString())
                            ],
                          ),
                        ),
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ReuseableRow extends StatelessWidget {
  ReuseableRow({required this.title, required this.value, Key? key})
      : super(key: key);
  String title, value;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title),
            Text(value),
          ],
        ));
  }
}
