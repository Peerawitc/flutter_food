import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_food/pages/home/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var input = '';
  void _handleClickButton(int num) {
    //print(num);
    setState(() {
      if(num == -1 && input.length!=0){
     input= input.substring(0,input.length-1);
      }
      else if (num!=-1) {
        input = '$input$num' ;
      };
      if(input=="123456" && input.length == 6){
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );


      }
      else if(input!="123456" && input.length ==6){
        _showMaterialDialog("ERROR","รหัสผ่านผิด");
        input = "";

      }


    });
  }
  void _showMaterialDialog(String title, String msg) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(msg),
          actions: [
            // ปุ่ม OK ใน dialog
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                // ปิด dialog
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.lock_outline, size: 100.0),
                      Text(
                        'LOGIN',
                        style: Theme.of(context).textTheme.headline1,
                      ),
                      Text(
                        'Enter PIN to login',
                        style: Theme.of(context).textTheme.bodyText2,
                      ),

                      Padding(
                        padding: const EdgeInsets.only(top: 80),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            for(int i=0;i<input.length;i++)
                            Icon(Icons.circle,size: 20,color: Colors.red[300],),
                            for(int i=0;i<6-input.length;i++)
                              Icon(Icons.circle,size: 20,color: Colors.red[100],),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                // color: Colors.pink,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        for (var i = 1; i <= 3; i++)
                          LoginButton(
                            number: i,
                            onClick: _handleClickButton,
                          ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        for (var i = 4; i <= 6; i++)
                          LoginButton(number: i, onClick: _handleClickButton),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        for (var i = 7; i <= 9; i++)
                          LoginButton(number: i, onClick: _handleClickButton),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        LoginButton(number: -2, onClick: _handleClickButton),
                        LoginButton(number: 0, onClick: _handleClickButton),
                        LoginButton(number:-1, onClick: _handleClickButton),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LoginButton extends StatelessWidget {
  final int number;
  final Function(int) onClick;

  const LoginButton({
    required this.number,
    required this.onClick,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      customBorder: CircleBorder(),
      onTap:number==-2? null: () => onClick(number),
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Container(
          width: 80.0,
          height: 80.0,
          decoration:number==-2? null :BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(width: 2.0),
          ),
          child: Container(
            child: Center(
              child:number==-2? null: (number==-1?Icon(Icons.backspace_outlined) : Text(
                number.toString(),
                style: Theme.of(context).textTheme.headline6,
              )),
            ),
          ),
        ),
      ),
    );
  }
}

