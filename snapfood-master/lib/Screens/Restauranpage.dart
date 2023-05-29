import 'package:customer_app/Models/Restaurant.dart';
import 'package:flutter/material.dart';
import 'package:customer_app/Models/Food.dart';
import 'package:customer_app/Models/User.dart';
import 'package:customer_app/Models/Order.dart';
import 'package:customer_app/Models/Card1.dart';
class Restaurantpage extends StatefulWidget {
  @override
  _RestaurantpageState createState() => _RestaurantpageState();
}
class _RestaurantpageState extends State<Restaurantpage> {
    var form_key=GlobalKey<FormState>();
    var formkey2=GlobalKey<FormState>();
    Order order;
    List<Food> foods=List.empty(growable: true);
      @override
  Widget build(BuildContext context) {
    final Size size=MediaQuery.of(context).size;
       Restaurant restaurant=ModalRoute.of(context).settings.arguments as Restaurant;
    var icon = restaurant.getIsfave() ? Icons.favorite: Icons.favorite_border;
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
      body: Column(
        children: [
          /*Container(
            height: size.height/9,
            width: size.width,
            child: Image(image: restaurant.getImage().image,
             // height: size.height/9,
             // width: size.width,
             // Box
                         ),
          ),*/
          //ax va icon hash
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
            IconButton(icon: Icon(icon,size: 25),
                onPressed:() {
              setState(() {
                restaurant.changeisfave();
              });
            }),
            Text(restaurant.getName(),
              style: TextStyle(
                fontSize: 21,
                color: Colors.black,
              ),)
          ],),
          Row(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(icon: Icon(Icons.restaurant,size:60), onPressed: (){
                    Navigator.pushNamed(context, "/comp",arguments: restaurant);
         }),
        Container(
         width: 50,
          height: 20,
        ),
        Text("اطلاعات و نظرات",
        style: TextStyle(
        fontSize: 18,
        color: Colors.black,
        ),)
         ],
         ),
              Image(image: restaurant.getImage().image,width: size.width/2,height: 80),
              Container(//koocack
        height: 60,
        width: 80,
        color: Colors.green,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
        Icon(Icons.star_border,
        color: Colors.white,
        size: 20,
        ),
        Text(restaurant.getAvgscore().toString(),
        style: TextStyle(
        fontSize: 20,
        color: Colors.white,
        ),
        ),
        ],
        ),
        ),
         ],
         ),
           Container(
             height: 1,
             width: size.width,
             color:Colors.black45,
           ),
           Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 Icon(Icons.event_note_outlined,
                   size:30,
                   color: Colors.black45,
                 ),
                 Text("منو",
                   style: TextStyle(
                     fontSize: 25,
                     color: Colors.black45,
                   ),
                 ),
               ]),
          Container(
            height: 0.5,
            width: size.width,
            color:Colors.black45,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                Image(image:restaurant.getMenue().elementAt(0).getImage().image,height: size.width/4.2,width:size.width/2.5),
                ElevatedButton(onPressed: (){
                  foods.add(restaurant.getMenue().elementAt(0));
                  Card1(Order(foods,restaurant,DateTime.now(),false,1234));
                  //afzoodan be sabad
                  },
                    child: Text("افزودن")),
              ],),
              Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                Text(restaurant.getMenue().elementAt(0).getName(),
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black45,
                  ),
                ),
                Text(restaurant.getMenue().elementAt(0).getIngredients(),
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.black45,
                  ),
                ),
              ],)
            ],
          ),
          Container(
            height: 0.3,
            width: size.width,
            color:Colors.black45,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Image(image:restaurant.getMenue().elementAt(1).getImage().image,height: size.width/4.2,width:size.width/2),
                  ElevatedButton(onPressed: (){
                    foods.add(restaurant.getMenue().elementAt(1));
                    Card1(Order(foods,restaurant,DateTime.now(),false,1234));
                    //afzoodan be sabad
                  },
                      child: Text("افزودن")),
                ],),
              Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(restaurant.getMenue().elementAt(1).getName(),
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black45,
                    ),
                  ),
                  Text(restaurant.getMenue().elementAt(1).getIngredients(),
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.black45,
                    ),
                  ),
                ],)
            ],
          ),
          Container(
            height: 0.3,
            width: size.width,
            color:Colors.black45,
          ),

        ]


      )
    );
  }
}