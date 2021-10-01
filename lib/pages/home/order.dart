
import 'package:flutter/material.dart';

class orderpage extends StatefulWidget {
  const orderpage({Key? key}) : super(key: key);

  @override
  _orderpageState createState() => _orderpageState();
}

class _orderpageState extends State<orderpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
            child : Text("order")
        ),
      ),
    );
  }
}
