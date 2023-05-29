import 'package:customer_app/Models/Food.dart';
import 'package:customer_app/Models/Order.dart';
import 'package:customer_app/Models/Restaurant.dart';
import 'package:customer_app/Models/Restaurants.dart';
import 'package:customer_app/Models/Type.dart';
import 'package:customer_app/Screens/ActiveOrders.dart';
import 'package:customer_app/Screens/Cardpage.dart';
import 'package:customer_app/Screens/Commentspage.dart';
import 'package:customer_app/Screens/FavoriteRestPage.dart';
import 'package:customer_app/Screens/Homepage.dart';
import 'package:customer_app/Screens/IncreaseStockPage.dart';
import 'package:customer_app/Screens/LoginScreen.dart';
import 'package:customer_app/Screens/Mycomments.dart';
import 'package:customer_app/Screens/Restauranpage.dart';
import 'package:customer_app/Screens/SingnupScreen.dart';
import 'package:customer_app/Screens/dactiveOrders.dart';
import 'package:customer_app/Screens/Searchrest.dart';
import 'package:customer_app/Screens/factorpage.dart';
import 'package:flutter/material.dart';
import 'package:customer_app/Screens/Home.dart';
void main() {
    List<String> c1=["پیتزا خوب","ساندویچ متوسط"];
  Food f1=Food("پیتزا", "پنیر پیتزاو نان وسوسیس و...", 20000, Image.asset('assets/images/p1.jpg'));
  Food f2=Food("ساندویچ ژامبون","نان و ژامبون وگوجه و...",12000,Image.asset('assets/images/s1.jpg'));
  List<Food> menu1=[f1,f2];
  Restaurants.Add(Restaurant("فست فودسون","جهاد میرزاده عشقی",7,c1,menu1,Image.asset('assets/images/1.jpg',
      height: 70,
      width: 70,
      fit:BoxFit.fill,
  ),Type.fastfood));

  List<String> c2=["قرمه سبزی عالی","کباب بد بود"];
  Food f3=Food("کباب", "گوشت چرخ کرده و پیاز وماست موسیر", 40000, Image.asset('assets/images/k1.jpg'));
  Food f4=Food("قورمه سبزی","سبزی و لوبیا و گوشت و سالاد",50000,Image.asset('assets/images/q1.jpg'));
  List<Food> menu2=[f3,f4];
  Restaurants.Add(Restaurant("غذای آریایی","میدان قاعم",6,c2,menu2,Image.asset('assets/images/2.jpg',
      height: 70,
      width: 70,
      fit:BoxFit.fill,
  ),Type.persian));

  List<String> c3=["املت قابل قبول","پنکیک سوخته بود"];
  Food f5=Food("پنکیک", "شیر و ارد و عسل", 10000, Image.asset('assets/images/p11.jpg'));
  Food f6=Food("املت","تخم مرغ گوجه و سنگک",10000,Image.asset('assets/images/o1.jpg'));
  List<Food> menu3=[f5,f6];
  Restaurants.Add(Restaurant("صبونه ما","میدان قاعم",5,c3,menu3,Image.asset('assets/images/3.jpg',
  height: 70,
    width: 70,
    fit:BoxFit.fill,
  ),Type.breakfast));

  Order.adddactiveorder(Order(menu3,Restaurants.restaurants.elementAt(2),DateTime.now(),false,2626));
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
//     "/":(context)=>Homepage(),
    "/":(context)=>SignupScreen(),
        "/lp":(context)=>LoginScreen(),
       "/dact":(context)=>dactiveOrders(),
       "/act":(context)=>ActiveOrders(),
         "/hp":(context)=>Homepage(),
        "/cp":(context)=>Cardpage(),
        "/rp":(context)=>Restaurantpage(),
         "/srp":(context)=>Searchrest(),
        "/comp":(context)=>Commentspage(),
        "/fp":(context)=>factorpage(),
        "/isp":(context)=>IncreaseStockPage(),
        "/mc":(context)=>Mycomments(),
        "/frp":(context)=>FavoriteRestPage(),
      },
    );
  }
}


