import 'package:flutter/material.dart';
import 'package:customer_app/Models/Restaurants.dart';
import 'package:customer_app/Models/Restaurant.dart';
class Searchrest extends StatefulWidget {
  Searchrest({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _SearchrestState createState() => new _SearchrestState();
}

class _SearchrestState extends State<Searchrest> {
  TextEditingController editingController = TextEditingController();

  //final duplicateItems = List<String>.generate(10000, (i) => "Item $i");
  //var items = List<String>();
  var items=List<String>();

  @override
  void initState() {
    items.addAll(Restaurants.getURestaurantsname());
    super.initState();
  }

  void filterSearchResults(String query) {
    List<String> dummySearchList = List<String>();
    dummySearchList.addAll(Restaurants.getURestaurantsname());
    if(query.isNotEmpty) {
      List<String> dummyListData = List<String>();
      dummySearchList.forEach((item) {
        if(item.contains(query)) {
          dummyListData.add(item);
        }
      });
      setState(() {
        items.clear();
        items.addAll(dummyListData);
      });
      return;
    } else {
      setState(() {
        items.clear();
        items.addAll(Restaurants.getURestaurantsname());
      });
    }

  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("رستوران"),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                onChanged: (value) {
                  filterSearchResults(value);
                },
                controller: editingController,
                decoration: InputDecoration(
                    hintText: "نام رستوران مورد نظر را تایپ کنید",
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25.0)))),
              ),
            ),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: GestureDetector(
                      child:Text(Restaurants.getURestaurantsname().elementAt(index),
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      onTap: (){
                        Ontapname(Restaurants.getURestaurantsname().elementAt(index),context);
                        //Navigator.pushNamed(context, "/task",arguments: index);
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

void Ontapname(String name,BuildContext context){
    Restaurant r;
    for(int i=0;i<Restaurants.getURestaurants().length;++i) {
      if (Restaurants.getURestaurants().elementAt(i).getName()==name) {
        r = Restaurants.getURestaurants().elementAt(i);
        //go restaurantpage
        Navigator.pushNamed(context, "/rp",arguments: r);
        break;
      }
    }

}
}