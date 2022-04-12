import 'dart:async';

import 'package:aunjai/constant/color_constant.dart';
import 'package:aunjai/constant/style_constant.dart';
import 'package:aunjai/core/map_utils.dart';
import 'package:aunjai/routes.dart';
import 'package:aunjai/utils/helper.dart';
import 'package:aunjai/utils/widgets/button.dart';
import 'package:aunjai/utils/widgets/button_label.dart';
import 'package:aunjai/utils/widgets/card_custom/card.dart';
import 'package:aunjai/utils/widgets/decoration.dart';
import 'package:aunjai/utils/widgets/dialog_custom.dart';
import 'package:aunjai/utils/widgets/get_rating_star.dart';
import 'package:aunjai/utils/widgets/horizontal.dart';
import 'package:aunjai/views/map_overview/map_nearby.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AboutSection extends StatefulWidget {
  final GlobalKey aboutKey;

  const AboutSection({Key? key, required this.aboutKey}) : super(key: key);

  @override
  State<AboutSection> createState() => _AboutSectionState();
}

class _AboutSectionState extends State<AboutSection> {
  @override
  Widget build(BuildContext context) {
    // Figma Flutter Generator AboutSection - GROUP
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: Helper.layoutPadding, vertical: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          subtitle("หอศิลป์"),
          Helper.widgetSpacePadding,
          titleActivities("หอศิลปวัฒนธรรมแห่งกรุงเทพมหานคร"),
          Helper.widgetSpacePadding,
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ratingStar(score: 3.5),
              const Horizontal(5.0),
              subtitle(" 10,000 รีวิว")
            ],
          ),
          const Divider(color: Color(0xFFF1F1F5), thickness: 1),
          Helper.widgetSpacePadding,
          ButtonLabel(
              prefixIcon: FontAwesomeIcons.cloudSun,
              label: "สภาพอากาศ",
              subContent: "10 องศา มีฝน 10.00.-24.00",
              onTap: () {
                openDialog(context, "weatherTemplate");
              }),
          ButtonLabel(
              prefixIcon: FontAwesomeIcons.calendar,
              label: "เวลาเปิดทำการ",
              subContent: "8:30 - 24:00",
              subfixLabel: "เปิดอยู่จนถึง 24.00",
              onTap: () {
                openDialog(context, "openTimeTemplate");
              }),
          ButtonLabel(
              subContent: "14 Phan Huy Ich, Ba Dinh, Hanoi",
              prefixIcon: Icons.location_pin,
              label: "Manzi Art Space and Cafe",
              subfixIcon: FontAwesomeIcons.mapMarked,
              subfixLabel: "ดูเส้นทาง",
              onTap: () {}),
          getLocationMap(context),
          ButtonLabel(
              subContent: "ที่จอดรถ, Wi-Fi, ATM, ร้านอาหาร, ...",
              prefixIcon: FontAwesomeIcons.info,
              label: "สิ่งอำนวยความสะดวก",
              onTap: () {}),
        ],
      ),
    );
  }

  getLocationMap(context) {
    Set<Marker> marset = {
      Marker(markerId: MarkerId("this"), position: LatLng(13.74676, 100.530326))
    };
    CameraPosition _kGooglePlex = CameraPosition(
      target: LatLng(13.74676, 100.530326),
      zoom: 15.0,
    );
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
            margin: const EdgeInsets.only(
                left: Helper.layoutPadding,
                right: Helper.layoutPadding,
                bottom: Helper.layoutPadding),
            width: Helper.getScreenWidth(context),
            height: 180,
            child: GoogleMap(
              padding: EdgeInsets.all(10.0),
              markers: marset,
              initialCameraPosition: _kGooglePlex,
            )),
        Positioned(
          child: button(context,
              label: "ดูแผนที่่",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MapNearBy(kGooglePlex: _kGooglePlex,)),
                );
              },
              width: 120.0,
              color: Colors.black38,
              fontColor: Colors.white,
              iconPrefix: const Padding(
                padding:  EdgeInsets.only(right: 10.0),
                child: Icon(
                  FontAwesomeIcons.map,
                  size: 20.0,
                  color: Colors.white,
                ),
              )),
        )
      ],
    );
  }
}
