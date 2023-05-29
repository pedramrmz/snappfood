import 'Restaurant.dart';
class Restaurants{

  static List<Restaurant> restaurants=List.empty(growable: true);
  static List<Restaurant> favrestaurants=List.empty(growable: true);
  static void Add(Restaurant restaurant){
    restaurants.add(restaurant);
  }

  static List<Restaurant> getURestaurants(){
     //restaurants.sort((a,b)=>a.avgscore.compareTo(b.avgscore));
    // restaurants=List.from(restaurants.reversed);
    return restaurants;
      }

  static List<String> getURestaurantsname(){
    List<String> restaurantsname=List.empty(growable: true);
    for(int i=0 ; i<restaurants.length;++i)
      restaurantsname.add(restaurants.elementAt(i).name);
    return restaurantsname;
  }
}