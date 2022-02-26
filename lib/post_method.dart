import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PostMethod extends StatefulWidget {
  const PostMethod({Key? key}) : super(key: key);

  @override
  _PostMethodState createState() => _PostMethodState();
}

class _PostMethodState extends State<PostMethod> {
  String url = 'https://jsonplaceholder.typicode.com/users';

  void postData() async {
    try {
      final response = await http.post(Uri.parse(url), body: {
        "id": "1",
        "name": "Rashid Khan",
        "city": "Peshawar",
        "zipcode": "03469202092"
      });
      // ignore: avoid_print
      print(response.body);
    } catch (e) {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        // ignore: avoid_returning_null_for_void
        child: ElevatedButton(
          onPressed: () => postData(),
          child: const Text("Send Post"),
        ),
      ),
    );
  }
}
