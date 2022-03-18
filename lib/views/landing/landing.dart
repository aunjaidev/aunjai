import 'package:aunjai/utils/text.common.dart';
import 'package:flutter/material.dart';
import 'package:aunjai/routes.dart';
import 'package:aunjai/utils/helper.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  void initState() {
    Future.delayed(
        const Duration(seconds: 5),
        () => handleNavigationRoute(
            context: context, routeName: "/AppHomeNavigation"));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
      width: Helper.getScreenWidth(context),
      height: Helper.getScreenHeight(context),
      child: Center(
        child: Text(
          "TripGuy",
          style:
              TextCommon.customeStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    ));
  }
}
