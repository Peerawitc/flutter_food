
import 'package:flutter/material.dart';

class menupage extends StatefulWidget {
  const menupage({Key? key}) : super(key: key);

  @override
  _menupageState createState() => _menupageState();
}

class _menupageState extends State<menupage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child : Text("MENU")
        ),
      ),
    );
  }
}
