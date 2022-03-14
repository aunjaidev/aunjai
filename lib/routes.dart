import 'package:aunjai/views/attraction/attraction.dart';
import 'package:flutter/material.dart';
import 'package:aunjai/views/home_navigation/home_navigation.dart';
import 'package:aunjai/views/landing/landing.dart';
import 'package:aunjai/views/signin/signin.dart';
import 'package:aunjai/views/signup/signup.dart';

late Map<String, WidgetBuilder> routes = {
  "/": (ctx) => const LandingPage(),
  "/AppHomeNavigation": (ctx) => const AppHomeNavigation(),
  "/SignupScreen": (ctx) => const SignupScreen(),
  "/SigninScreen": (ctx) => const SigninScreen(),
  "/AttractionScreen": (ctx) => const AttractionScreen(),
};

Future? handleNavigationRoute(
    {BuildContext? context, String? routeName, arguments}) {
  if (ModalRoute.of(context!)!.settings.name != routeName) {
    if (arguments == null) {
      return Navigator.pushNamed(context, routeName!);
    } else {
      return Navigator.pushNamed(context, routeName!, arguments: arguments);
    }
  }
  return null;
}
