import 'package:customer_app/Models/User.dart';
class Users{

  static List<User> users=List.empty(growable: true);
  static void Add(User user){
    users.add(user);
     }

  static List<User> getUsers(){
    return users;
  }

  static bool haslogedin(String tel,String pass){
    for(int i=0;i<getUsers().length;++i){
      User u=getUsers().elementAt(i);
      if(u.number==tel && u.password==pass) {
        u.islog=true;
        return true;
      }
    }
    return false;
  }
  static User finduser(String tel,String pass){
    for(int i=0;i<getUsers().length;++i){
      User u=getUsers().elementAt(i);
      if(u.number==tel && u.password==pass) {
          u.islog=true;
        return u;
      }
    }    return null;
  }

}
