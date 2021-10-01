
import 'package:flutter/material.dart';
import 'package:flutter_food/pages/home/menu.dart';
import 'package:flutter_food/pages/home/order.dart';
import 'package:google_fonts/google_fonts.dart';

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
        return menupage() ;

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

}
