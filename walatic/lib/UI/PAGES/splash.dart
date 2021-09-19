
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:walatic/ui/login.dart';

import 'home_page.dart';


class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds:4 ), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => LoginPage(),
            //builder: (context) => HomePage(),
          ));
    });
  }
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: 
        RiveAnimation.asset('assets/octocat.riv'),
        
      
    );
  }
}