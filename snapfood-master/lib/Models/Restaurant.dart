import 'package:customer_app/Models/Food.dart';
import 'package:flutter/cupertino.dart';
import 'package:customer_app/Models/Type.dart';
import 'package:customer_app/Models/Restaurants.dart';

class Restaurant{
  String name;
  String address;
  bool isfave;//false
  double avgscore;
  List<String> comments;
  List<Food> menue;
  Image image;
//  bool isactive;
  double code;
  Type type;


  Restaurant(String name,String address,double avgscore,List<String> comments,List<Food> menue,Image image,Type type){
    this.name=name;
    this.address=address;
    this.avgscore=avgscore;
    this.comments=comments;
    this.menue=menue;
    this.image=image;
    this.isfave=false;
    this.type=type;
  }
  String getName(){
    return name;
  }
  String getAddress(){
    return address;
  }
  bool getIsfave(){
    return isfave;
  }
  double getAvgscore(){
    return avgscore;
  }
  List<String> getComments(){
    return comments;
  }
  List<Food> getMenue(){
    return menue;
  }
  void changeisfave(){
    isfave=!isfave;
    if(isfave)
      Restaurants.favrestaurants.add(this);
    else
      Restaurants.favrestaurants.remove(this);
  }

  Image getImage(){
    return image;
  }

  String getType(){
    if(type==Type.breakfast)
      return "صبحانه";
    if(type==Type.fastfood)
      return "فست فود";
    if(type==Type.persian)
      return "ایرانی";
    else
      return "سوخاری";
  }

}