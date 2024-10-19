import 'dart:math';

import 'package:flutter/material.dart';
import 'package:http_project_one/servers/server.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/user.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<User> users = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("API Project"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder( itemCount: users.length,itemBuilder: (context,index){
        final user = users[index];
        return ListTile(
          title: Text(user.titile.toString()),
          subtitle: Text(user.completed.toString()),
        );
      }),
      floatingActionButton: FloatingActionButton(onPressed: fetchData, child: Icon(Icons.add),),
    );
  }
  Future<void> fetchData() async {
  final String url = "https://thejustinandrew.pythonanywhere.com/task-list/";
  final uri = await http.get(Uri.parse(url));
  final data = jsonDecode(uri.body) as List<dynamic>;
   final result = data as List<dynamic>;
    final transformed = result.map((e) => User.fromJson(e)).toList();
    setState(() {
      users = transformed;
    });
}
}