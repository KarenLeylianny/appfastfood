import 'package:hola_mundo/Providers/UserPrv.dart';
import 'package:hola_mundo/screens/loggin.dart';
import 'package:hola_mundo/screens/login.dart';
import 'package:hola_mundo/screens/splash.dart';
import 'package:hola_mundo/screens/welcome.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Providers/UserPrv.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => UserPrv()),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fast Food App',
      //home: Welcome(),
      home: Scaffold(
        body: PageView(physics: BouncingScrollPhysics(), children: <Widget>[
          Splash(),
          Welcome(),
          Login(),
          Loggin(),
        ]),
      ),
    );
  }
}
