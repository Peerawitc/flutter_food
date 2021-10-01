import 'package:flutter/material.dart';
import 'package:flutter_food/pages/home/foodpage.dart';
import 'package:flutter_food/pages/home/profile.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _subPageIndex = 0 ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Flutter Food"),backgroundColor: Colors.red[200],),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    // ไล่เฉดจากมุมบนซ้ายไปมุมล่างขวาของ Container
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    // ไล่เฉดจากสีแดงไปสีน้ำเงิน
                    colors: [
                      Colors.yellowAccent,
                      Colors.teal.shade700,
                    ],
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(35.0),
                          child: Container(
                            width: 70.0,
                            height: 70.0,
                            child: Image.asset('assets/images/test01.jpg'),
                          )),
                    ),
                    Text(
                      'Peerawit Chinawong',
                      style: GoogleFonts.roboto(
                          color: Colors.white, fontSize: 20.0),
                    ),
                    Text(
                      'Chinawong_p@silpakorn.edu',
                      style: GoogleFonts.roboto(
                          color: Colors.white70, fontSize: 13.0),
                    ),
                  ],
                )),
            ListTile(
                title: _buildDreawerItem(Icon(Icons.fastfood,color: Colors.teal,), 'Food'),
                onTap: () => _showSubPage(0)),
            ListTile(
                title: _buildDreawerItem(Icon(Icons.person,color: Colors.teal,), 'Profile'),
                onTap: () => _showSubPage(1)
              //Navigator.of(context).pushNamed(LoginPage.routeName);
            ),
          ],
        ),
      ),
      body: Container(
        child: _buildSubPage()
      ),

    );
  }
  Row _buildDreawerItem(Widget icon, String title) {
    return Row(
      children: [
        icon,
        SizedBox(
          width: 8.0,
        ),
        Text('$title',style: GoogleFonts.roboto(fontSize: 20.0),),
      ],
    );
  }
  _showSubPage(int index) {
    setState(() {
      _subPageIndex = index;
    });

    Navigator.of(context).pop();
  }
  Widget _buildSubPage() {
    switch (_subPageIndex) {
      case 0:
        return foodpage() ;

      case 1:
        return profilepage();

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
