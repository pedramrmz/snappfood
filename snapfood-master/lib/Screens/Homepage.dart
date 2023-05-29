import 'package:customer_app/Models/Restaurants.dart';
import 'package:flutter/material.dart';
import 'package:customer_app/Models/User.dart';
import 'package:customer_app/Models/Users.dart';
class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}
class _HomepageState extends State<Homepage> {
  User user;
  //var form_key=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final Size size=MediaQuery.of(context).size;
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
      drawer:Drawer(
        child:
        ListView(

          padding: EdgeInsets.only(bottom: 1),
          children: <Widget> [
            DrawerHeader(
              child:Text("پروفایل کاربری",//user.getName(),//getusername
                style: TextStyle(
                  fontSize: 21,
                  color: Colors.blue,
                ),
              ),
            ),
            ListTile(
              title: Text(user.getName()+" "+user.lastname,
                style: TextStyle(
                  fontSize: 21,
                  color: Colors.black,
                ),
              ),
               ),
            ListTile(
              title: Text("افزایش اعتبار کیف پول",
                style: TextStyle(
                  fontSize: 21,
                  color: Colors.black,
                ),
              ),
              onTap: (){
                Navigator.pushNamed(context, "/isp",arguments: user);
              },
            ),
            ListTile(
              title: Text("نظرات من",
                style: TextStyle(
                  fontSize: 21,
                  color: Colors.black,
                ),
              ),
              onTap: (){
                Navigator.pushNamed(context, "/mc",arguments: user);
              },
            ),
            ListTile(
              title: Text("رستوران های مورد علاقه",
                style: TextStyle(
                  fontSize: 21,
                  color: Colors.black,
                ),
              ),
              onTap: (){
                Navigator.pushNamed(context, "/frp",arguments: user);
                //liste favrestha
                //ontap harkodam varede safe rest mishi
              },
            ),
            ListTile(
              title: Text("خروج",
                style: TextStyle(
                  fontSize: 21,
                  color: Colors.black,
                ),
              ),
              onTap: (){
                Navigator.pop(context, "/up");
              },
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                icon:Icon(Icons.search_rounded),
                color: Colors.black,
                iconSize: 30,
                onPressed: (){
                  Navigator.pushNamed(context, "/srp");
                  //search rest
                },
              ),
             Container(
               width: size.width/1.5,
           height: 27,
           color: Colors.black26,
           child:  Text(user.getAddress(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize:17 ,
                ),)),
              //Text(User.getAddress),
            ],
          ),
         Row(
            children: [
              Column(
                children: [
                  Image(image:Restaurants.getURestaurants().elementAt(0).getImage().image,width: size.width/2,height: size.height/5),
                  //imagewid(size, Restaurants.getURestaurants().elementAt(0).getImage()),
                  TextButton(
                    child: Text(Restaurants.getURestaurants().elementAt(0).getName(),
                    style: TextStyle(
                      fontSize: 21,
                      color: Colors.black,
                    ),),
                    onPressed: (){
                      Navigator.pushNamed(context, "/rp",arguments: Restaurants.getURestaurants().elementAt(0));
                      //safhe sefaresh faal
                    },
                  ),

                  Text(Restaurants.getURestaurants().elementAt(0).getType()),
                  Text(Restaurants.getURestaurants().elementAt(0).getAvgscore().toString()),
                ],
              ),
      Column(
      children: [
        Image(image:Restaurants.getURestaurants().elementAt(1).getImage().image,width: size.width/2,height: size.height/5),
        //imagewid(size, Restaurants.getURestaurants().elementAt(0).getImage()),
      TextButton(
        child: Text(Restaurants.getURestaurants().elementAt(1).getName(),
          style: TextStyle(
            fontSize: 21,
            color: Colors.black,
          ),),
        onPressed: (){
          Navigator.pushNamed(context, "/rp",arguments: Restaurants.getURestaurants().elementAt(1));
          //safhe sefaresh faal
        },
      ),
      Text(Restaurants.getURestaurants().elementAt(1).getType()),
        Text(Restaurants.getURestaurants().elementAt(1).getAvgscore().toString()),
      ],
    ),
              ],
         ),
              Row(
                children:[
              Column(
                children: [
                  Image(image:Restaurants.getURestaurants().elementAt(2).getImage().image,width: size.width/2,height: size.height/5),
                  //imagewid(size, Restaurants.getURestaurants().elementAt(0).getImage()),
                  TextButton(
                    child: Text(Restaurants.getURestaurants().elementAt(2).getName(),
                      style: TextStyle(
                        fontSize: 21,
                        color: Colors.black,
                      ),),
                    onPressed: (){
                      Navigator.pushNamed(context, "/rp",arguments: Restaurants.getURestaurants().elementAt(2));
                      //safhe sefaresh faal
                    },
                  ),
                  Text(Restaurants.getURestaurants().elementAt(2).getType()),
                  Text(Restaurants.getURestaurants().elementAt(2).getAvgscore().toString()),
                ],
              ),
                  ],),

          /*Expanded(
          child:ListView(

            scrollDirection: Axis.horizontal,
            children: List.generate(Restaurants.getURestaurants().length, (index) {
              return Container(
                //  margin: EdgeInsets.symmetric(vertical: 2, horizontal:2),
              decoration: BoxDecoration(
              border: Border.all(
              color: Colors.black54,
              //width: 1,
              ),
              borderRadius: BorderRadius.circular(6),
              ),
                child: ListTile(

                   title: GestureDetector(
                    child:Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                         imagewid(size, Restaurants.getURestaurants().elementAt(index).getImage()),
                         Text(Restaurants.getURestaurants().elementAt(index).getName()),
                        Text(Restaurants.getURestaurants().elementAt(index).getType()),
                        Text(Restaurants.getURestaurants().elementAt(index).getAvgscore().toString()),
                      ],
                    ),
                    /*Text(Restaurants.getURestaurants().elementAt(index).getTitle(),
                      TextStyle(
                        fontSize: style: 22,
                        fontWeight: FontWeight.w500,
                      ),
                    ),*/
                   /* onTap: (){
                      Navigator.pushNamed(context, "/task",arguments: index);
                    },
                  ),
                  leading: GestureDetector(
                    child: Icon(icon,
                      color: Colors.lightGreenAccent,
                    ),
                    onTap: () {
                      setState(() {
                        Tasks.getTasks().elementAt(index).changeisdone();
                      });
                    },*/
                  ),
                ),

              );
            }
          ),
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
                  Navigator.pushNamed(context, "/dact");
                },
              ),
              IconButton(
                icon:Icon(Icons.home_outlined),
                color: Colors.black,
                iconSize: 30,
                onPressed: (){
                  //safe khane
                },
              ),
              IconButton(
                icon:Icon(Icons.shopping_cart_outlined),
                color: Colors.black,
                iconSize: 30,
                onPressed: (){
                  Navigator.pushNamed(context, "/cp",arguments: user);
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
                  fontSize:18,
                ),
              ),
              Text("خانه",
                style: TextStyle(
                  color: Colors.black,
                  fontSize:18,
                ),
              ),
              Text("سبد خرید",
                style: TextStyle(
                  color: Colors.black,
                  fontSize:18,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
 Widget imagewid(Size size,Image image){
    return Container(
      color: Colors.green,
      height: size.height/5,
      width: size.width/3,
        child:image,
    );

 }
}