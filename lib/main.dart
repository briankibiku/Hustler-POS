import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart' hide Router;
import 'package:hustlerpos/features/login/login.dart';
import 'package:hustlerpos/router_generator.dart';
// import 'package:device_preview/device_preview.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(HustlerPOS());
}
// DevicePreview(
//   builder: (context) => HustlerPOS(), // Wrap your app
// ),

class HustlerPOS extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: Router.generateRoute,
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
      // locale: DevicePreview.locale(context), // Add the locale here
      // builder: DevicePreview.appBuilder,
    );
  }
}
