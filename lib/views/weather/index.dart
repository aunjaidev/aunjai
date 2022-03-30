import 'package:aunjai/constant/color_constant.dart';
import 'package:aunjai/constant/style_constant.dart';
import 'package:aunjai/utils/helper.dart';
import 'package:aunjai/utils/widgets/appbar.dart';
import 'package:aunjai/utils/widgets/decoration.dart';
import 'package:flutter/material.dart';


class Weather extends StatefulWidget {
  const Weather({ Key? key }) : super(key: key);

  @override
  State<Weather> createState() => _WeatherState();
}

class _WeatherState extends State<Weather> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context),
      body: SingleChildScrollView(
        child: SizedBox(
          width: Helper.getScreenWidth(context),
          height: Helper.getScreenHeight(context),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 20.0),
                margin: const EdgeInsets.symmetric(horizontal: Helper.layoutPadding,vertical: 20.0),
                width: Helper.getScreenWidth(context),
                height: 250.0,
                decoration: decoration(color: primary1,borderRadius: 20.0),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        normalText("ToDay",fontSize: 40.0),
                        normalText("29 Mach",fontSize: 18.0),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        normalText("25°C",fontSize: 18.0),
                        normalText("29 Mach",fontSize: 18.0),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
          // color: mBackgroundColor,
        ),
      ),
    );
  }
}