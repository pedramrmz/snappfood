import 'dart:io';

import 'package:customer_app/Models/User.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:customer_app/Models/func.dart';
import 'package:customer_app/Models/Users.dart';
import 'package:customer_app/Screens/LoginScreen.dart';
class SignupScreen extends StatefulWidget {

  //const SignupScreen({Key key}) : super(key: key);

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final titleController = TextEditingController();
  final lastnameController=TextEditingController();
  final addressController = TextEditingController();
  final telController = TextEditingController();
  final passwordController = TextEditingController();
  var _formKey=GlobalKey<FormState>();
  Socket socket;
    bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ثبت نام'),
      ),
      body: Container(
          padding: EdgeInsets.all(60),
          child: Center(
            child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                            controller: titleController,
                            decoration: InputDecoration(
                                border: const OutlineInputBorder(),
                                labelText: 'نام مشتری',
                                hintText: 'نام مشتری'),
                            /*onSaved: (String value){
                              name=value;
                            },*/
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'نام مشتری الزامی است';
                              }
                              return null;
                            },

                            ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                           controller: lastnameController,
                            decoration: InputDecoration(
                                border: const OutlineInputBorder(),
                                labelText: 'نام خانوادگی',
                                hintText: 'نام خانوادگی'),
                          /*onSaved: (String value){
                            setState(() {
                              lastname=value;
                            });
                          },*/
                          validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'نام خانوادگی الزامی است';
                              }
                              return null;
                            },

                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                           controller: addressController,
                            decoration: InputDecoration(
                                border: const OutlineInputBorder(),
                                labelText: 'آدرس ',
                                hintText: 'آدرس'),
                               /* onSaved: (String value) {
                                  setState(() {
                                    address = value;
                                  });*/
                                  validator:
                                      (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'آدرس الزامی است';
                                    }
                                    return null;
                                  },

                             ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                            controller: telController,
                            decoration: InputDecoration(
                                border: const OutlineInputBorder(),
                                labelText: 'تلفن',
                                hintText: 'تلفن'),
                         /* onSaved: (String value){
                            setState(() {
                              tel=value;
                            });

                          },*/
                          validator: (value) {
                              return validateTel(value, true);
                            },

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
                            obscureText: true,
                        /*  onSaved: (String value){
                            setState(() {
                              password=value;
                            });

                          },*/
                          validator: (value) {
                              return validatePassword(value);
                            },

                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: ElevatedButton(
                              onPressed:   doSignup,
                              child: Text('ثبت نام')),
                        ),
                      ],
                    ))),
          )),
    );

  }

  void doSignup() {

    if (_formKey.currentState.validate()) {
      _sendMessage();

 User user=new User(titleController.text,lastnameController.text,telController.text,addressController.text,passwordController.text,100000
 );
  Users.Add(user);

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('ثبت نام با موفقیت انجام شد'),
        backgroundColor: Colors.green,
      ));

     // Navigator.pop(context);
      Navigator.pushNamed(context, "/lp",arguments: user);
    // Navigator.pushReplacement(
      //  context, MaterialPageRoute(builder: (context) => LoginScreen()));
   }
  }

  void _sendMessage() async {
          await Socket.connect('10.0.2.2', 1302)
          .then((serverSocket) {
        print('connected');
        serverSocket.writeln("Signup");
        serverSocket.writeln(titleController.text);
        serverSocket.writeln(lastnameController.text);
        serverSocket.writeln(addressController.text);
        serverSocket.writeln(telController.text);
        serverSocket.writeln(passwordController.text);
        serverSocket.listen((socket) {
          String response = String.fromCharCodes(socket).trim();
          print("response is: " + response);
                    // show = String.fromCharCodes(socket).trim();
          // print(show);
        });
      });
  }
}
