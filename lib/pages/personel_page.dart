import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PersonelPage extends StatefulWidget {
  const PersonelPage({Key? key}) : super(key: key);

  @override
  State<PersonelPage> createState() => _PersonelPageState();
}

class _PersonelPageState extends State<PersonelPage> {
  List<dynamic> users = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Personel Listesi"),
      ),
      body: ListView.builder(
        itemCount: users.length,
          itemBuilder: (context, index) {
          final user = users[index];
          final name = user["name"]["first"];
          final email = user["email"];
          final imageUrl = user["picture"]["thumbnail"];

          return ListTile(
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: CircleAvatar(
              child: Image.network(imageUrl)
            ),
          ),
          title: Text(name),
          subtitle: Text(email),
        );
      }
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        child: Icon(
            Icons.add,
        ),
        onPressed: fetchUsers,
      ),
    );
  }
  void fetchUsers() async {
    print("fetchUsers called");
    const url = "https://randomuser.me/api/?results=10";
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);
    setState(() {
      users = json["results"];
    });
    print("fetchUsers completed");
  }
}
