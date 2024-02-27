import 'package:flutter/widgets.dart';
import 'package:ai_journey/pages/home/home_page.dart';
import 'package:ai_journey/pages/signup/signup_screen.dart';
import 'pages/login/login_screen.dart';

final Map<String, WidgetBuilder> routes = {
  LoginScreen.routeName: (context) => const LoginScreen(),
  Signup.routeName: (context) => const Signup(),
  HomePage.routeName: (context) => const HomePage(),
};
