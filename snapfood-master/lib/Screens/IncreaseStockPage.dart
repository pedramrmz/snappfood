import 'package:customer_app/main.dart';
import 'package:flutter/material.dart';
import 'package:customer_app/Models/User.dart';
class IncreaseStockPage extends StatefulWidget {
  @override
  _IncreaseStockPageState createState() => _IncreaseStockPageState();
}
class _IncreaseStockPageState extends State<IncreaseStockPage> {
  final stockController = TextEditingController();
  double newstock;
  User user;
  //var form_key=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery
        .of(context)
        .size;
    user = ModalRoute
        .of(context)
        .settings
        .arguments as User;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("افزایش اعتبار کیف پول",
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
          ),),
      ),
      body: Center(
        child: Column(children:[
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(user.getStock().toString(),
              style:TextStyle(
                fontSize: 20,
              )),
              Text("اعتبار قبلی",
                  style:TextStyle(
                    fontSize: 20,
                  )),
          ],),
        TextFormField(
        controller: stockController,
            decoration: InputDecoration(helperText: "اعتبار جدید را وارد کنید"),
           ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: ElevatedButton(
                onPressed:change,
                child: Text('ثبت')),
          ),
          SizedBox(
            height: 20,
          ),
        ]),),
    );
  }
  void change(){
    setState(() {
      user.changestock(stockController.text);
      Navigator.pushNamed(context, "/hp",arguments: user);
    });
  }
}