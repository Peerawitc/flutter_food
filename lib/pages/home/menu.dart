import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_food/pages/home/fooditem.dart';
import 'package:flutter_food/pages/home/fooddetail.dart';
class menu extends StatefulWidget {
  const menu({Key? key}) : super(key: key);

  @override
  _menuState createState() => _menuState();
}

class _menuState extends State<menu> {
  var items = [
    FoodItem(id: 1, name: "ข้าวไข่เจียว", price: 25, image: "kao_kai_jeaw.jpg"),
    FoodItem(id: 2, name: "ข้าวหมูแดง", price: 40, image: "kao_moo_dang.jpg"),
    FoodItem(id: 3, name: "ข้าวมันไก่", price: 35, image: "kao_mun_kai.jpg"),
    FoodItem(id: 4, name: "ข้าวหน้าเป็ด", price: 45, image: "kao_na_ped.jpg"),
    FoodItem(id: 5, name: "ข้าวผัด", price: 35, image: "kao_pad.jpg"),
    FoodItem(id: 6, name: "ผัดซีอิ๊ว", price: 35, image: "pad_sie_eew.jpg"),
    FoodItem(id: 7, name: "ผัดไทย", price: 40, image: "pad_thai.jpg"),
    FoodItem(id: 8, name: "ราดหน้า", price: 40, image: "rad_na.jpg"),
    FoodItem(id: 9, name: "ส้มตำไก่ย่าง", price: 119, image: "som_tum_kai_yang.jpg"),




    // {
    // "id": 1,
    // "name": "ข้าวไข่เจียว",
    //"price": 25,
    //"image": "kao_kai_jeaw.jpg"
    //},


  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: items.length,
        itemBuilder: (BuildContext context,int index) {
          FoodItem item = items[index];


          return Card(
            margin: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: (){
                print(item);
                Navigator.pushNamed(
                  context,
                  FoodDetail.routeName,
                  arguments: item ,
                );



              },
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Image.asset("assets/images/${item.image}",
                      width : 60.0,
                      height: 60.0,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(width: 8.0),
                    Text(
                      item.name,
                      style: TextStyle(fontSize: 20.0),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}