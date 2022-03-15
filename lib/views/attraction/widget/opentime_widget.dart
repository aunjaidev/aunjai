import 'package:aunjai/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/components/accordion/gf_accordion.dart';

class OpenTimeWidget extends StatelessWidget {
  const OpenTimeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              child: GFAccordion(
            collapsedTitleBackgroundColor: Colors.transparent,
            contentBackgroundColor: Colors.transparent,
            expandedTitleBackgroundColor: Colors.transparent,
            titlePadding: const EdgeInsets.symmetric(horizontal: 0),
            collapsedIcon: Row(
              children: [
                AppTheme.normalText("Sunday 08.00-19.00",
                    color: Colors.green,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w400),
                const Icon(Icons.keyboard_arrow_down)
              ],
            ),
            titleChild: Transform.translate(
              offset: const Offset(-10, 0),
              child: AppTheme.contentHeader("OpenTime"),
            ),
            expandedIcon: Row(
              children: [
                AppTheme.normalText("Sunday 08.00-19.00",
                    color: Colors.green,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w400),
                const Icon(Icons.keyboard_arrow_up)
              ],
            ),
            contentChild: SizedBox(
              width: double.infinity,
              height: 150,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  getDateTimeUI(day: "Sunday", time: "08.00AM - 08.00PM"),
                  getDateTimeUI(day: "Sunday", time: "08.00AM - 08.00PM"),
                  getDateTimeUI(day: "Sunday", time: "08.00AM - 08.00PM"),
                  getDateTimeUI(day: "Sunday", time: "08.00AM - 08.00PM"),
                  getDateTimeUI(day: "Sunday", time: "08.00AM - 08.00PM"),
                  getDateTimeUI(day: "Sunday", time: "08.00AM - 08.00PM"),
                  getDateTimeUI(day: "Sunday", time: "08.00AM - 08.00PM")
                ],
              ),
            ),
          ))
        ]);
  }

  getDateTimeUI({required String day, required String time}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AppTheme.normalText(day),
        AppTheme.normalText(time),
      ],
    );
  }
}
