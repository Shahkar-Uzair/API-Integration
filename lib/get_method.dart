import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class GetMethod extends StatefulWidget {
  const GetMethod({Key? key}) : super(key: key);

  @override
  _GetMethodState createState() => _GetMethodState();
}

class _GetMethodState extends State<GetMethod> {
  String url = 'https://jsonplaceholder.typicode.com/users';

  var _jasonPosts = [];

  void fetchPost() async {
    try {
      final response = await http.get(Uri.parse(url));

      final jasonDataRecieved = jsonDecode(response.body) as List;

      setState(() {
        _jasonPosts = jasonDataRecieved;
      });
    } catch (err) {
      CircularProgressIndicator;
    }
  }

//  Here initstate is defined to implement FetchPost method. And initState is
//only defined in stateful widget not stateless.
  @override
  void initState() {
    super.initState();
    fetchPost();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ListView.builder(
          itemCount: _jasonPosts.length,
          itemBuilder: (context, i) {
            final getPost =
                _jasonPosts[i]; // we assigned _jasonPosts to getPost variable
            return Text(
                "\n Employee Name: ${getPost["name"]} \n Email Address: ${getPost["email"]} \n ");
          },
        ),
      ),
    );
  }
}
