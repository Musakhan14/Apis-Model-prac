import 'dart:convert';

import 'package:asifpractice/model/postmodel2.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Example2 extends StatefulWidget {
  const Example2({Key? key}) : super(key: key);

  @override
  State<Example2> createState() => _Example2State();
}

List<Photos> photlist = [];
Future<List<Photos>> getPhotos() async {
  final response =
      await http.get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));
  var data = jsonDecode(response.body.toString());
  if (response.statusCode == 200) {
    for (Map i in data) {
      Photos photos = Photos(title: i['title'], url: i['url'], id: i['id']);
      photlist.add(photos);
    }
    return photlist;
  } else {
    return photlist;
  }
}

class _Example2State extends State<Example2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('APIs'),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: getPhotos(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Text('Loading....');
                } else {
                  return ListView.builder(
                      itemCount: photlist.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage(
                              (photlist[index].url.toString()),
                            ),
                          ),
                          subtitle: Text(photlist[index].title.toString()),
                          title: Text('Note Id ${photlist[index].id}'),
                        );
                      });
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

// builder: (context,AsyncSnapshot<List<Photos>> snapshot) {
// return ListView.builder(
// itemCount: photlist.length,
// itemBuilder: (context, index) {
// return ListTile(
// title: Text(snapshot.data![index].title.toString()),
// );
// });              //this method also applied
