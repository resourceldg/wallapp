import 'package:flutter/material.dart';
import 'package:walatic/UI/ORGANISM_WIDGETS/circular.dart';
import 'package:walatic/UI/PAGES/home_page.dart';
import 'package:walatic/ui/email_create_screen.dart';
import 'package:walatic/ui/email_signin_screen.dart';
import 'package:walatic/ui/home_screen.dart';
import 'package:walatic/ui/intro_screen.dart';
import 'package:walatic/ui/login.dart';
import 'package:walatic/ui/register.dart';
import 'package:walatic/ui/splash_screen.dart';

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
      case splash:
        return _buildRoute(SplashScreen.create);
      case intro:
        return _buildRoute(IntroScreen.create);
      case home:
        return _buildRoute(HomeScreen.create);
      case login:
        return _buildRoute(LoginPage.create);
      case createAccount:
        return _buildRoute(EmailCreate.create);
      case signInEmail:
        return _buildRoute(EmailSignIn.create);
      case Home_Page:
        return _buildRoute(HomePage.create);
      case register:
        return _buildRoute(Register.create);
      case circular:
        return _buildRoute(Circular.create);
      default:
        throw Exception('Route does not exists');
    }
  }

  static MaterialPageRoute _buildRoute(Function build) => MaterialPageRoute(builder: (context) => build(context));
}
