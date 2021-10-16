


import 'package:flutter/material.dart';
import 'package:flutter_food/pages/home/menu.dart';
import 'package:flutter_food/pages/home/order.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'fooditem.dart';

class foodpage extends StatefulWidget {
  const foodpage({Key? key}) : super(key: key);

  @override
  _foodpageState createState() => _foodpageState();
}

class _foodpageState extends State<foodpage> {
  @override
  var indexnav = 0;
  Widget build(BuildContext context) {

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: _test,
        child: Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon:indexnav==0? Icon(Icons.menu_book,color: Colors.teal,):Icon(Icons.shopping_cart,color: Colors.grey,),
            label : 'Menu',

          ),
          BottomNavigationBarItem(
            icon: indexnav==1? Icon(Icons.shopping_cart,color: Colors.teal,):Icon(Icons.shopping_cart,color: Colors.grey,),
            label : 'Your Order',
          )
        ],
        currentIndex: indexnav,
        onTap: (index) {
          setState(() {
           indexnav = index;

          });
        },

      ),
      body: Container(
       child: _buildSubPage()

      ),

    );
  }
  Widget _buildSubPage() {
    switch (indexnav) {
      case 0:
        return menu() ;

      case 1:
        return orderpage();

      default:
        return Center(
          child: Text(
            'THIS IS A HOMEPAGE',
            style: GoogleFonts.roboto(fontSize: 35.0),
            textAlign: TextAlign.center,
          ),
        );
    }
  }
  Future<void> _test() async {
    var url = Uri.parse("https://cpsu-test-api.herokuapp.com/login");
        var response = await http.get(url);
    //var response = await http.post(url,body:{
    //'pin' : '123456'
    //});

    if (response.statusCode == 200) {
      Map<String, dynamic> jsonBody = json.decode(response.body);
      String status = jsonBody['status'];
      String? message = jsonBody['message'];
      List<dynamic> data = jsonBody['data'];

      print('STATUS: $status');
      print('MESSAGE: $message');
      //print('data: $data');

      var foodList = data.map((element) => FoodItem(
        id: element['id'],
        name: element['name'],
        price: element['price'],
        image: element['image'],
      )).toList();

      /* data.forEach((element) {
      FoodItem(
        id: element['id'],
        name:  element['name'],
        price: element['price'],
        image: element['image'],


      );
      });*/

    }
  }

}

