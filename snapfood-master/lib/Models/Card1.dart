import 'package:customer_app/Models/Order.dart';
class Card1{
  static List<Order> orders=List.empty(growable: true);
  Card1(Order o){
    for(int i=0;i<orders.length;++i){
      if(orders.elementAt(i).restaurant==o.restaurant)
        orders.remove(orders.elementAt(i));
    }
    orders.add(o);
    print(orders);
    print("*");
  }

}
