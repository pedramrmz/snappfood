import 'package:customer_app/Models/Restaurant.dart';
import 'package:customer_app/Models/Order.dart';
import 'package:customer_app/Screens/ActiveOrders.dart';
import 'package:customer_app/Screens/factorpage.dart';
import 'package:flutter/material.dart';
class dactiveOrders extends StatefulWidget {
  @override
  _dactiveOrdersState createState() => _dactiveOrdersState();
}
class _dactiveOrdersState extends State<dactiveOrders> {
  //var form_key=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery
        .of(context)
        .size;
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
      body:Column(
            children: [
                Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
                  TextButton(
             child: Text("سفارش های فعال",
             style: TextStyle(
               fontSize: 21,
                color: Colors.black,
             ),
             ),
          onPressed: (){
            Navigator.pushNamed(context, "/act");
                //safhe sefaresh faal
              },
    ),
            TextButton(
               child: Text("سفارش های قبلی",
                style: TextStyle(
                  fontSize: 21,
                  color: Colors.black,
                ),
              ),
              onPressed: (){

              },
            ),
          ],
        ),
              for(int i=0;i<Order.getDactiveorders().length;++i)
                eachrest(Order.getDactiveorders().elementAt(i), size,context),
      /*  ListView(
          children: List.generate(Order.getDactiveorders().length, (index){
            return Container(
              margin: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black54,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(6),
              ),
              child: ListTile(
                leading:eachrest(Order.getDactiveorders().elementAt(index)),

              ),
            );
          }
          ),
        ),*/
Spacer(),
       Row(
         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
         children: [
           IconButton(
             icon: Icon(Icons.featured_play_list_outlined),
           color: Colors.black,
             iconSize: 30,
             onPressed: (){
               //safe sefaresh
             },
           ),
           IconButton(
             icon:Icon(Icons.home_outlined),
             color: Colors.black,
             iconSize: 30,
             onPressed: (){
               Navigator.pushNamed(context, "/hp");
             },
           ),
           IconButton(
             icon:Icon(Icons.shopping_cart_outlined),
             color: Colors.black,
             iconSize: 30,
             onPressed: (){
               Navigator.pushNamed(context, "cp");
             },
           )
         ],
       ),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [

            Text("سفارش ها",
              style: TextStyle(
              color: Colors.black,
              fontSize:17,
              ),
            ),
            Text("خانه",
              style: TextStyle(
                color: Colors.black,
                fontSize:17,
              ),
            ),
            Text("سبد خرید",
              style: TextStyle(
                color: Colors.black,
                fontSize:17,
              ),
            ),
          ],
        ),      ],
      ),
      );

  }
}

Widget eachrest(Order o,Size size,BuildContext context){
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
        Text(o.restaurant.getName(),
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
           Column(
             children: [
               Row(
                 children: [
                   Text(o.getDate(),
                     style: TextStyle(
                       color: Colors.black45,
                       fontSize: 15,
                     ),
                   ) ,
                   Icon(Icons.date_range,
                   color: Colors.white10,
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
                     ),),
                   Icon(Icons.location_on_outlined,
                     color: Colors.black45,
                     size: 17,
                   ),
                 ],
               )
             ],
           ),
            Image(image:o.restaurant.getImage().image ,width:size.width/4.2 ,height:size.width/4.2),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(o.getTotalprices(),
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 17,
              ),
            ),
            Text("مجموع",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 17,
              ),
            ),

          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              child: Text("سفارش مجدد",
              style: TextStyle(
             color: Colors.white,
             fontSize: 19,
               fontWeight: FontWeight.bold,
             ),
              ),
              onPressed: (){
                o.changeisactice();
                Order.addactiveorder(o);
                 },
                ),
            OutlineButton(
              onPressed: (){
                Navigator.pushNamed(context,"/fp",arguments: o);
              },
              child: Text("مشاهده ی فاکتور",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        )
      ],
    ),
  );
}
