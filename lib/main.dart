import 'package:flutter/material.dart' hide Router;
import 'package:hustlerpos/features/login/login.dart';
import 'package:hustlerpos/router_generator.dart';

void main() {
  runApp(HustlerPOS());
}

class HustlerPOS extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: Router.generateRoute,
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}
