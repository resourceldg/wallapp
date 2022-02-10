import 'package:flutter/material.dart';
import 'package:realwallapp/UI/ORGANISM_WIDGETS/circular.dart';

import 'package:realwallapp/ui/login.dart';

import 'package:realwallapp/ui/splash_screen.dart';

class Routes {
  static const splash = '/';
  static const intro = '/intro';
  static const createAccount = '/createAccount';
  static const signInEmail = '/signInEmail';
  static const home = '/home';
  static const login = 'ui/login';
  static const Home_Page = 'UI/PAGES/home_page';
  static const circular = 'UI/ORGANISM_WIDGETS/circular';
  static const register = 'ui/register';

  static Route routes(RouteSettings routeSettings) {
    print('Route name: ${routeSettings.name}');

    switch (routeSettings.name) {
  
      case login:
        return _buildRoute(LoginPage.create);
      case createAccount:
     /*  case Home_Page:
        return _buildRoute(HomePage.create);  */
  
      case circular:
        return _buildRoute(Circular.create);
      default:
        throw Exception('Route does not exists');
    }
  }

  static MaterialPageRoute _buildRoute(Function build) => MaterialPageRoute(builder: (context) => build(context));
}
