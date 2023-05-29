import 'package:customer_app/Models/Restaurant.dart';
import 'package:flutter/material.dart';
import 'package:customer_app/Models/Users.dart';
class Commentspage extends StatefulWidget {
  _CommentspageState createState() => _CommentspageState();
}
class _CommentspageState extends State<Commentspage> {
  final commentController = TextEditingController();
  Restaurant restaurant;
  @override
  Widget build(BuildContext context) {
    restaurant= ModalRoute.of(context).settings.arguments as Restaurant;
    return Scaffold(
        appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        title: Text("نظرات و انتقادات ",
        style: TextStyle(
          color: Colors.white,
          fontSize: 30,
        ),),
    ),
    body: Center(
    child:Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        for(int i=0;i<restaurant.getComments().length;++i)
          eachcom(restaurant.getComments().elementAt(i)),

        TextFormField(
          controller: commentController,
          decoration: InputDecoration(helperText: "نظر جدید"),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: ElevatedButton(
              onPressed:change,
              child: Text('ثبت')),
        ),
        SizedBox(
          height: 20,
        ),
      ],
    ),),
    );
  }
  void change(){
    setState(() {
      restaurant.comments.add(commentController.text);
      Navigator.pushNamed(context, "/rp",arguments: restaurant);
    });
  }
  Widget eachcom(String s){
  return  Text(s,
      style: TextStyle(
        color: Colors.black,
        fontSize: 25,
      ),);
  }
}