import 'dart:io';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:customer_app/Models/func.dart';
import 'package:customer_app/Screens/SingnupScreen.dart';
import 'package:customer_app/Screens/SingnupScreen.dart';
import 'package:customer_app/Models/Users.dart';
import 'package:customer_app/Models/User.dart';
import 'package:customer_app/main.dart';

class LoginScreen extends StatefulWidget {
  //const LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var _formkey = GlobalKey<FormState>();
  final telController = TextEditingController();
  final passwordController = TextEditingController();
  bool issugnup;
  bool _obscureText = true;
  Socket socket;
  String show;
  User user;

  @override
  Widget build(BuildContext context) {
       return Scaffold(
        appBar: AppBar(
          title: Text('اسنپ فود - مشتری'),
        ),
        body: SingleChildScrollView(
          child: Container(
              padding: EdgeInsets.all(60),
              child: Center(
                child: Form(
                    key: _formkey,
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          controller: telController,
                          decoration: InputDecoration(
                              border: const OutlineInputBorder(),
                              labelText: 'تلفن',
                              hintText: 'تلفن'),
                          validator: (value) {
                            return validateTel(
                                value, false);
                          },
                          /* onSaved: (String value){
                              tel=value;
                          },*/
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: passwordController,
                          decoration: InputDecoration(
                              border: const OutlineInputBorder(),
                              labelText: 'کلمه عبور',
                              hintText: 'کلمه عبور',
                              suffixIcon: GestureDetector(
                                dragStartBehavior: DragStartBehavior.down,
                                onTap: () {
                                  setState(() {
                                    _obscureText = !_obscureText;
                                  });
                                },
                                child: Icon(
                                  _obscureText
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                ),
                              )),
                          obscureText: _obscureText,
                          validator: (value) {
                            return validatePassword(value);
                          },
                          /* onSaved: (String value){
                            password=value;
                          },*/
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: ElevatedButton(
                              onPressed: _sendMessage,
                              child: Text('ورود')),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextButton(
                            onPressed: _pushSignup,
                            child: Text('مشتری جدید؟ ثبت نام کنید'))
                      ],
                    )),
              )),
        ));
  }

  void _pushSignup() {
    Navigator.pushNamed(context, "/");
    // Navigator.push(
    //    context, MaterialPageRoute(builder: (context) => SignupScreen()));
  }

  void doLogin(String response) {
    if(response=="true"){
            Navigator.pushNamed(context, "/hp", arguments: user);
    }
    else {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('نام کاربری یا کلمه عبور نادرست است')));
    }
  }

  void _sendMessage() async {
    String name,lastname,address;
    if (telController.text.isNotEmpty && passwordController.text.isNotEmpty) {
      await Socket.connect('10.0.2.2', 1302)
          .then((serverSocket) {
        print('connected');
        serverSocket.writeln("Login");
        serverSocket.writeln(passwordController.text);
        serverSocket.writeln(telController.text);
        String response;
        serverSocket.listen((socket) {
          response = String.fromCharCodes(socket).trim();
          var natije=response.split(" ");
          print("result is: " + natije.elementAt(0));
          if(natije.elementAt(0)=="true"){
            name=natije.elementAt(1);
            lastname=natije.elementAt(2);
            address=natije.elementAt(3);
            user=new User(name, lastname, telController.text, address, passwordController.text, 100000);
          }doLogin(natije.elementAt(0));

            });
        /*  if(response=="true"){
          serverSocket.listen((socket) {
              name=String.fromCharCodes(socket).trim();
              print("name is:"+name);
              String lastname=String.fromCharCodes(socket).trim();
              String address=String.fromCharCodes(socket).trim();
              user=new User(name, lastname, telController.text, address, passwordController.text, 100000);
           });
          serverSocket.listen((socket) {
           lastname=String.fromCharCodes(socket).trim();
            print("lastname is:"+lastname);
             });
          serverSocket.listen((socket) {
        address=String.fromCharCodes(socket).trim();
           print("address is:"+address);
          });
          }*/
          // show = String.fromCharCodes(socket).trim();
          // print(show);
        });


    }
  }
}

