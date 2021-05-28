import 'package:flutter/material.dart';
import 'package:hustlerpos/features/homepage/homepage.dart';
import 'package:hustlerpos/features/login/login.dart';
import 'package:hustlerpos/features/make_sale/make_sale.dart';
import 'package:hustlerpos/features/signup/signup.dart';
import 'package:hustlerpos/routes.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.login:
        return MaterialPageRoute(builder: (_) => LoginPage());
      case Routes.homePage:
        return MaterialPageRoute(builder: (_) => HomePage());
      case Routes.signUp:
        return MaterialPageRoute(builder: (_) => SignUpPage());
      case Routes.makeSale:
        return MaterialPageRoute(builder: (_) => MakeSalePage());
        
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
