import 'package:customer_app/Models/Food.dart';
import 'package:customer_app/Models/Restaurant.dart';

class Order{
  List<Food> foods=List.empty(growable: true);
  Restaurant restaurant;
  DateTime date;
  double totalprices;
  bool isactive;
  int code;
  Order(List<Food> foods,Restaurant restaurant,DateTime dateTime,bool isactive,int code){
    this.foods=foods;
    this.restaurant=restaurant;
    this.date=dateTime;

    this.isactive=isactive;
    this.code=code;
  }
  List<Food> getFoods(){
    return foods;
  }
  String getTotalprices(){
    double sum=0;
    for(int i=0;i<foods.length;++i)
      sum+=foods.elementAt(i).price;
    totalprices=sum;
    return totalprices.toString();
  }
  String getDate(){
    return date.toString();
  }
  bool getIsactive(){
    return isactive;
  }
  void changeisactice(){
    isactive=!isactive;
  }
  String getCode(){
    return code.toString();
  }

  static List<Order> activeorders=List.empty(growable: true);
  static void addactiveorder(Order o){
      activeorders.add(o);
  }
  static List<Order> getActiveorders(){
    return activeorders;
  }
  static List<Order> dactiveorders=List.empty(growable: true);
  static void adddactiveorder(Order o){
    o.isactive=false;
    dactiveorders.add(o);
  }
  static List<Order> getDactiveorders(){
    return dactiveorders;
  }
}