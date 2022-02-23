import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sabzavotlar/screens/SignIn.dart';
import 'package:sabzavotlar/screens/splashscreen.dart';

class MyRouter {
  Route? onGenerateroute(RouteSettings settings) {
    var args = settings.arguments;

    switch (settings.name) {
      case "/":
        return MaterialPageRoute(builder: (context) => SplashScreenPage());
      case "signin":
        return MaterialPageRoute(builder: (context) => SignInPage());
    }
  }
}
