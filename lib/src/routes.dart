import 'package:farmers_market/src/screens/landing.dart';
import 'package:farmers_market/src/screens/login.dart';
import 'package:farmers_market/src/screens/signup.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract class Routes{
  
  static MaterialPageRoute materialRoutes(RouteSettings settings) {
    switch(settings.name){
      case "/": 
      return MaterialPageRoute(builder: (context) => const Landing());
      case "/signup": 
      return MaterialPageRoute(builder: (context) => const Signup());
      case "/login": 
      return MaterialPageRoute(builder: (context) => const Login());
      default: 
      return MaterialPageRoute(builder: (context) => const Login());
    }
  }

  static CupertinoPageRoute cupertinoRoutes(RouteSettings settings) {
    switch(settings.name){
      case "/": 
      return CupertinoPageRoute(builder: (context) => const Landing());
      case "/signup": 
      return CupertinoPageRoute(builder: (context) => const Signup());
      case "/login": 
      return CupertinoPageRoute(builder: (context) => const Login());
      default: 
      return CupertinoPageRoute(builder: (context) => const Login());
    }
  }
}