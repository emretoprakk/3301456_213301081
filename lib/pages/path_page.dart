import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';


class PathPage extends StatefulWidget {
  const PathPage({Key? key}) : super(key: key);

  @override
  State<PathPage> createState() => _PathPageState();
}

class _PathPageState extends State<PathPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Path Sayfasi"),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton.icon(
                onPressed: () async {
                  Directory tempDir = await getTemporaryDirectory();
                  String path = tempDir.path;
                  print("Temp Path : "+ path);
                },
                icon: Icon(Icons.account_tree_outlined,
                  size: 18,
                ),
                label: Text("Temp Path"),
              ),
              TextButton.icon(
                onPressed: () async {
                  Directory permDir = await getApplicationDocumentsDirectory();
                  String path = permDir.path;
                  print("Permenent Path : " + path);
                },
                icon: Icon(Icons.account_tree_rounded,
                  size: 18,
                ),
                label: Text("Permement Path"),
              ),
            ],
          ),

        ),
      ),
    );
  }
}
