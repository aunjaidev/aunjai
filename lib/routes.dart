import 'package:aunjai/model/attraction.model.dart';
import 'package:aunjai/views/app_main/app.main.dart';
import 'package:aunjai/views/app_main/attraction/attraction_city/attractioncity.dart';
import 'package:aunjai/views/app_main/attraction/attraction_place/attraction_place.dart';
import 'package:aunjai/views/app_main/attraction/attraction_tripplanner/trip_planner.dart';
import 'package:aunjai/views/weather/index.dart';
import 'package:flutter/material.dart';
import 'package:aunjai/views/landing/index.dart';
import 'package:aunjai/views/signin/signin.dart';
import 'package:aunjai/views/signup/signup.dart';

class RouteCommon {
  RouteCommon._();

  static late Map<String, WidgetBuilder> routes = {
    "/": (ctx) => const LandingPage(),
    "/AppHomeNavigation": (ctx) => const AppMain(),
    "/SignupScreen": (ctx) => const SignupScreen(),
    "/SigninScreen": (ctx) => const SigninScreen(),
    "/tripPlanner": (ctx) => TripPlanner(),
    "/attractionCity": (ctx) => AttractionCity(),
    "/screen/attraction_place":(ctx)=> AttractionPlaceScreen(),
    "/screen/weather":(ctx) => Weather()
  };

  static Future? handleNavigationRoute(
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
}
