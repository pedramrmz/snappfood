import 'package:customer_app/Models/Food.dart';
import 'package:customer_app/Models/Restaurant.dart';
import 'package:flutter/material.dart';
import 'package:customer_app/Models/Users.dart';
import 'package:customer_app/Models/Order.dart';
class factorpage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Order order= ModalRoute.of(context).settings.arguments as Order;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("فاکتور",
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
          ),),
      ),
      body: Center(
        child:Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            for(int i=0;i<order.getFoods().length;++i)
              eachfood2(order.getFoods().elementAt(i)),
          ],
        ),),
    );
  }
  Widget eachfood2(Food food){
    return Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(food.getPrice(),
          style: TextStyle(
            color: Colors.black,
            fontSize: 25,
          ),),
        Text(food.getName(),
          style: TextStyle(
            color:Colors.black,
            fontSize: 25,
          ),)
      ],
    );
  }
}