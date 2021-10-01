import 'package:flutter/material.dart';


class profilepage extends StatelessWidget {
  const profilepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     ClipRRect(
                         borderRadius: BorderRadius.circular(200.0),
                         child: Container(
                           width: 300.0,
                           height: 300.0,
                           child: Image.asset('assets/images/test01.jpg'),
                         )
                     ),


                     Text("Peerawit Chinawong"),
                     Text("chinawong_p@silpakorn.edu")

                   ],


        ),
      ),

    ),


    );
  }
}
