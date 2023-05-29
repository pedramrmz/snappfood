import 'package:customer_app/Models/Card1.dart';
import 'package:customer_app/Models/Restaurant.dart';
import 'package:customer_app/Models/Order.dart';
import 'package:customer_app/Screens/ActiveOrders.dart';
import 'package:flutter/material.dart';
import 'package:customer_app/Models/User.dart';
class Cardpage extends StatefulWidget {
  @override
  _CardpageState createState() => _CardpageState();
}
class _CardpageState extends State<Cardpage> {
  User user;

  //var form_key=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery
        .of(context)
        .size;
    user= ModalRoute.of(context).settings.arguments as User;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text("غذا",
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.black,
                ),
              ),
              Container(
                width: 150,
              ),
              Icon(Icons.home_outlined,
                size: 25,
                color: Colors.black,
              ),
            ],
          ),
        ],
      ),
      body: Center(child: Column(
          children: [
            for(int i=0;i<Card1.orders.length;++i)
            eachrestcard(Card1.orders.elementAt(i),size),

          ]
      ),
      ),
    );
  }
Widget eachrestcard(Order o,Size size){
  return Container(
    decoration: BoxDecoration(
      border: Border.all(
        color: Colors.black,
        width: 0.4,
      ),
        borderRadius: BorderRadius.circular(7),
    ),
    width: size.width-7,
    height: size.height/3.2,
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(children: [
              Text(o.restaurant.name,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                  children: [
                    Text(o.getDate(),
                      style: TextStyle(
                        color: Colors.black45,
                        fontSize: 15,
                      ),
                    ),
                    Icon(Icons.date_range,
                      color: Colors.black45,
                      size: 17,
                    ),

                  ],
                ),
              Row(
                children: [
                  Text(o.restaurant.getAddress(),
                    style: TextStyle(
                      color: Colors.black45,
                      fontSize: 15,
                    ),
                  ) ,
                  Icon(Icons.location_on_outlined,
                    color: Colors.black45,
                    size: 17,
                  ),
                ],
              )
            ],),
         Image(image:o.restaurant.getImage().image ,width:size.width/4.2 ,height:size.width/4.2),
          ],
        ),
         Row(
         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
         children:[
           Text(o.foods.elementAt(0).getPrice(),
             style: TextStyle(
               color: Colors.black,
               fontSize: 17,
             ),
           ),
           Text(o.foods.elementAt(0).getName(),
             style: TextStyle(
               color: Colors.black,
               fontSize: 17,
             ),
           ),
         ],
       ),
        orelse(o),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
         children: [
          ElevatedButton(onPressed:(){
            setState(() {
              Card1.orders.remove(o);
            });
          },
            style:ElevatedButton.styleFrom(

              primary: Colors.white,
            ),
              child: Text("حذف سبد",
                style: TextStyle(
                  fontSize: 19,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
          ),
           ElevatedButton(onPressed:(){
             if(o.foods.elementAt(0).price>user.stock || (o.foods.length>1 && (o.foods.elementAt(0).price+o.foods.elementAt(1).price>user.stock))) {
                    Navigator.pushNamed(context, "/isp", arguments: user);
                  } else {
  if(o.foods.elementAt(0).price>user.stock || (o.foods.length>1 && (o.foods.elementAt(0).price+o.foods.elementAt(1).price>user.stock))) {
    user.stock = user.stock - o.foods
        .elementAt(0)
        .price-o.foods.elementAt(1).price;
  }else {
                      user.stock = user.stock - o.foods.elementAt(0).price;
                    }
                    Order.activeorders.add(o);
               Navigator.pushNamed(context, "/hp", arguments: user);
             }
           },
             style:ElevatedButton.styleFrom(
              primary: Colors.blue,
  ),        child: Text("ادامه خرید",
               style: TextStyle(
                 fontSize: 19,
                 color: Colors.white,
                 fontWeight: FontWeight.bold,
               ),
             ),
           ),
        ],)

      ],
    ),
  );
}
Widget orelse(Order o){
    if(o.foods.length>1){
   return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children:[
          Text(o.foods.elementAt(1).getPrice(),
            style: TextStyle(
              color: Colors.black,
              fontSize: 17,
            ),
          ),
          Text(o.foods.elementAt(1).getName(),
            style: TextStyle(
              color: Colors.black,
              fontSize: 17,
            ),
          ),
        ],
      );
    }
    else
     return Row(
       children: [],
      );
}
  }