import 'package:flutter/material.dart';

class Food{
String name;
String ingredients;
double price;
Image image;
int number;

Food(String name,String ingredients,double price,Image image){
  this.name=name;
  this.ingredients=ingredients;
  this.price=price;
  this.image=image;

}
String getName(){
  return name;
}
String getIngredients(){
  return ingredients;
}

String getPrice(){
  return price.toString();
}

Image getImage(){
  return image;
}
String getNumber(){
  return number.toString();
}
}