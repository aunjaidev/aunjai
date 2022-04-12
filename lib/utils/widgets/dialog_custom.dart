import 'package:aunjai/constant/style_constant.dart';
import 'package:aunjai/utils/helper.dart';
import 'package:aunjai/utils/widgets/card_custom/card.dart';
import 'package:aunjai/utils/widgets/horizontal.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Widget _weatherTemplate(context) {
  return SizedBox(
    width: Helper.getScreenWidth(context),
    height: 500,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          children: [
            Icon(Icons.location_pin),
            Horizontal(10.0),
            normalText("Roi-et, Thailand")
          ],
        ),
        Helper.readPngPicture("assets/images/cloudy-night.png", width: 200.0),
        normalText("25°"),
        normalText("Thunderstorm"),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              children: [
                Icon(FontAwesomeIcons.wind),
                normalText("10 km/h"),
              ],
            ),
            Row(
              children: [
                Icon(FontAwesomeIcons.cloudMoonRain),
                normalText("60%"),
              ],
            )
          ],
        ),
        SizedBox(
          width: Helper.getScreenWidth(context),
          height: 200,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              CardCustom(icon: Icon(Icons.map)),
              CardCustom(icon: Icon(Icons.map)),
              CardCustom(icon: Icon(Icons.map)),
              CardCustom(icon: Icon(Icons.map)),
              CardCustom(icon: Icon(Icons.map)),
              CardCustom(icon: Icon(Icons.map)),
              CardCustom(icon: Icon(Icons.map)),
              CardCustom(icon: Icon(Icons.map)),
            ],
          ),
        )
      ],
    ),
  );
}

Widget _openTimeTemplate(context){
  return Container(
    width: Helper.getScreenWidth(context),
    height: 500,
    child: Column(
      children: [
        Row(
          children: [
            normalText("Monday"),
            normalText("08.00PM -08.00AM"),
          ],
        ),
        Row(
          children: [
            normalText("Monday"),
            normalText("08.00PM -08.00AM"),
          ],
        ),
        Row(
          children: [
            normalText("Monday"),
            normalText("08.00PM -08.00AM"),
          ],
        ),
        Row(
          children: [
            normalText("Monday"),
            normalText("08.00PM -08.00AM"),
          ],
        ),
        Row(
          children: [
            normalText("Monday"),
            normalText("08.00PM -08.00AM"),
          ],
        ),
        Row(
          children: [
            normalText("Monday"),
            normalText("08.00PM -08.00AM"),
          ],
        ),
        Row(
          children: [
            normalText("Monday"),
            normalText("08.00PM -08.00AM"),
          ],
        ),
      ],
    ),
  );
}

Future<void> openDialog(BuildContext context, String type) async {
  Widget temp = Container();
  if (type == "weatherTemplate") {
    temp = _weatherTemplate(context);
  }else if(type == "openTimeTemplate"){
    temp =_openTimeTemplate(context);
  }

  return showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        content: SingleChildScrollView(child: temp),
      ));
}