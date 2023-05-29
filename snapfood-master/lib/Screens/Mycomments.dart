import 'package:customer_app/Models/Restaurant.dart';
import 'package:flutter/material.dart';
import 'package:customer_app/Models/Users.dart';
import 'package:customer_app/Models/User.dart';
class Mycomments extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    User user= ModalRoute.of(context).settings.arguments as User;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("نظرات من ",
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
          ),),
      ),
      body: Center(
        child:Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
           mycom(user),
          ],
        ),),
    );
  }
  Widget mycom(User user){
    if(user.getMycomments().isEmpty){
      return Text(" شما تاکنون نظری ثبت نکرده اید",
        style: TextStyle(
          color: Colors.black,
          fontSize: 20,
        ),);
    }
    else {

        return Column(
          children:[
          for (int i = 0; i < user
            .getMycomments()
            .length; ++i)
          com(user.getMycomments().elementAt(i))
        ]);
    }
  }
  Widget com(String s){
    return Text(s,
      style: TextStyle(
        color: Colors.black,
        fontSize: 25,
      ),);
  }
}