import 'package:customer_app/Models/Food.dart';
import 'package:customer_app/Models/Order.dart';
import 'package:customer_app/Models/Restaurant.dart';
import 'package:flutter/material.dart';
class ActiveOrders extends StatefulWidget {
  @override
  _ActiveOrdersState createState() => _ActiveOrdersState();
}
class _ActiveOrdersState extends State<ActiveOrders> {
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
                  Navigator.pushNamed(context, "/dact");//dactiveorders
                },
              ),
            ],
          ),
         for(int i=0;i<Order.getActiveorders().length;++i)
           eachactiverest(Order.getActiveorders().elementAt(i), size),
      /*   ListView(
    children:
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
    leading:eachactiverest(Order.getActiveorders().elementAt(index)),

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
                  Navigator.pushNamed(context, "/cp");
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
              Text("غذا",
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
          ),
  ]
         ),
        );

  }
}

Widget eachactiverest(Order o,Size size) {
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
            Column(
              children: [
                Text(o.restaurant.getName(),
                  style: TextStyle(
                    fontSize: 20,
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
        for(int i=0;i<o.foods.length;++i)
          eachFood(o.foods.elementAt(i)),
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
            Text(o.getCode(),
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17
              ),
            ),
            Text("کد پیگیری",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 17,
              ),
            ),
          ],
        ),


      ],
    ),
  );
}
Widget eachFood(Food f){
     return Row(
       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(f.getPrice(),
        style: TextStyle(
          color: Colors.black45,
          fontSize: 16,
        ),),
        Text(f.getName(),
          style: TextStyle(
            color:Colors.black45,
            fontSize: 16,
          ),)
      ],
     );

}