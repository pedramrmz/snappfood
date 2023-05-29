import 'package:customer_app/Models/Restaurant.dart';
import 'package:customer_app/Models/Restaurants.dart';
import 'package:flutter/material.dart';
import 'package:customer_app/Models/User.dart';
class FavoriteRestPage extends StatefulWidget {
  @override
  _FavoriteRestPageState createState() => _FavoriteRestPageState();
}
class _FavoriteRestPageState extends State<FavoriteRestPage> {
    User user;
  //var form_key=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery
        .of(context)
        .size;
    user = ModalRoute
        .of(context)
        .settings
        .arguments as User;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("رستوران های مورد علاقه",
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
          ),),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            myfavrests(),
          ],
        ),
       ),
    );
  }
    Widget myfavrests(){
      if(Restaurants.favrestaurants.isEmpty){
        return Text(" شما رستوران مورد علاقه خود را ثبت نکرده اید",
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
          ),);
      }
      else {
          return Column(children:[
            Text("روی نام رستوران موردنطر خود کلیک کنید",
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
              ),
            ),
            for (int i = 0; i < Restaurants.favrestaurants
              .length; ++i)
          restname(Restaurants.favrestaurants.elementAt(i)),
          ]);
      }

    }
    Widget restname(Restaurant r){
      return TextButton(child: Text(r.getName(),
        style: TextStyle(
          color: Colors.blue,
          fontSize: 25,
        ),),
        onPressed: (){
          Navigator.pushNamed(context, "/rp",arguments: r);
        },
      );
    }
}