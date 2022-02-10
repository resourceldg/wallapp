
import 'package:flutter/material.dart';
import 'package:realwallapp/navigation/routes.dart';
import 'package:realwallapp/ui/login.dart';


final _navigatorKey = GlobalKey<NavigatorState>();




class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TheGorgeousLogin',
      home: LoginPage(),
    );
  }
}
