import 'package:flutter/material.dart';
import 'package:flutter_food/pages/home/foodpage.dart';
import 'package:flutter_food/pages/home/profile.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/foundation.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  static const routeName = '/home';
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _subPageIndex = 0;
  var _selectedDrawerItemIndex = 0;
  final _pageDataList = [
    {
      'icon': Icons.fastfood,
      'title': 'Food',
      'page': foodpage(),
    },
    {
      'icon': Icons.person,
      'title': 'Profile',
      'page':  profilepage(),
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pageDataList[_selectedDrawerItemIndex]['title'] as String),
        backgroundColor: Colors.red[200],
      ),
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
            for (var item in _pageDataList)
              ListTile(
                  title: Row(
                    children: [
                      Icon(
                        item['icon'] as IconData,
                        color: item == _pageDataList[_selectedDrawerItemIndex]
                            ? Theme.of(context).accentColor
                            : null,
                      ),
                      SizedBox(width: 8.0),
                      Text(item['title'] as String),
                    ],
                  ),

                onTap: () {
                  setState(() {
                    _selectedDrawerItemIndex =
                        _pageDataList.indexWhere((element) => item == element);
                  });
                  Navigator.of(context).pop();
                },
                selected: item == _pageDataList[_selectedDrawerItemIndex],
                  ),
          ],
        ),
      ),
      body: Container( child: _pageDataList[_selectedDrawerItemIndex]['page'] as Widget,),
    );
  }

  Row _buildDreawerItem(Widget icon, String title) {
    return Row(
      children: [
        icon,
        SizedBox(
          width: 8.0,
        ),
        Text(
          '$title',
          style: GoogleFonts.roboto(fontSize: 20.0),
        ),
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
        return foodpage();

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
