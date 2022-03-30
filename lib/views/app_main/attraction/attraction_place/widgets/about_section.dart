import 'package:aunjai/constant/color_constant.dart';
import 'package:aunjai/constant/style_constant.dart';
import 'package:aunjai/routes.dart';
import 'package:aunjai/utils/helper.dart';
import 'package:aunjai/utils/widgets/decoration.dart';
import 'package:aunjai/utils/widgets/get_rating_star.dart';
import 'package:aunjai/utils/widgets/horizontal.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Figma Flutter Generator AboutSection - GROUP
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: Helper.layoutPadding, vertical: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          subtitle("Music Event"),
          Helper.widgetSpacePadding,
          titleActivities("Premium Staycation Package at Pan Pacific"),
          Helper.widgetSpacePadding,
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ratingStar(score: 3.5),
              const Horizontal(5.0),
              subtitle("from 10,000 reviews")
            ],
          ),
          const Divider(color: Color(0xFFF1F1F5), thickness: 1),
          Helper.widgetSpacePadding,
          getButtonDetail(
              prefixIcon: FontAwesomeIcons.cloudSun,
              label: "weather",
              subContent: "10 องศา มีฝน 10.00.-24.00",
              onTap: () {
                RouteCommon.handleNavigationRoute(context: context,routeName: "/screen/weather");
              }),
          getButtonDetail(
              prefixIcon: FontAwesomeIcons.calendar,
              label: "Open",
              subContent: "8:30 PM - 10:00 PM",
              onTap: () {}),
          getButtonDetail(
              subContent: "14 Phan Huy Ich, Ba Dinh, Hanoi",
              prefixIcon: Icons.location_pin,
              label: "Manzi Art Space and Cafe",
              subfixIcon: FontAwesomeIcons.mapMarked,
              subfixLabel: "Directions",
              onTap: () {}),
          getLocationMap(context),
        ],
      ),
    );
  }

  getLocationMap(context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: Helper.layoutPadding),
      decoration: decoration(color: Colors.cyan, borderRadius: 10.0),
      width: Helper.getScreenWidth(context),
      height: 250,
      child: Stack(
        children: [
          Positioned.fill(
              child: Align(
            alignment: Alignment.center,
            child: Container(
              width: 100,
              height: 50,
              decoration: decoration(
                  color: Colors.black.withOpacity(0.2), borderRadius: 5.0),
              child: Center(
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [Icon(Icons.fullscreen), Text("ดูแผนที่")]),
              ),
            ),
          ))
        ],
      ),
    );
  }

  getButtonDetail(
      {required IconData prefixIcon,
      required String label,
      required GestureTapCallback onTap,
      IconData? subfixIcon,
      String? subContent,
      String? subfixLabel}) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(prefixIcon),
                  const Horizontal(20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      textContentTitle(label),
                      Helper.widgetSpacePadding,
                      subtitle(subContent ?? ""),
                      Helper.widgetSpacePadding,
                    ],
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  subfixLabel == null
                      ? const SizedBox()
                      : subtitle(subfixLabel, color: primary2),
                  const Horizontal(Helper.layoutPadding),
                  Icon(subfixIcon ?? FontAwesomeIcons.angleRight,
                      size: 16, color: primary2)
                ],
              )
            ],
          ),
          const Divider(color: Color(0xFFF1F1F5), thickness: 1),
        ],
      ),
    );
  }
}
