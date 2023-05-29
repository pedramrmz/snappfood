import 'package:customer_app/Models/Order.dart';
import 'package:customer_app/Models/Restaurant.dart';
class User{
  String name;
  String lastname;
  String number;
  List<String> addresses=List.empty(growable: true);
  String address;
  String password;
  bool islog;//false
  double stock;
  List<String> mycomments=List.empty(growable: true);
  List<Restaurant> favrestaurants;
  List<Order> orderslist;

  User(String name,String lastname,String number,String address,String password,double stock){
    this.name=name;
    this.lastname=lastname;
    this.number=number;
    this.address=address;
    this.password=password;
    this.stock=20000;
    this.address=address;
    this.addresses.add(address);
     }

  String getName(){
    return this.name;
  }
  String getLastname(){
    return this.lastname;
  }
  String getPassword(){
    return this.password;
  }
  String getNumber(){
    return number;
  }
  String getAddress(){
    return address;
  }
  double getStock(){
    return stock;
  }
  List<String> getMycomments(){
    return mycomments;
  }
  List<Restaurant> getFavrestaurants(){
    return favrestaurants;
  }
  List<Order> getFOrderlist(){
    return orderslist;
  }
  String nameandlastname(){
    String s=name;
    return s;
  }
  void changestock(String stock){
    this.stock=double.parse(stock);
  }
}
