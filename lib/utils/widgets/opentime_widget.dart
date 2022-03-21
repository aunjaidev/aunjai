import 'package:aunjai/utils/text.common.dart';
import 'package:flutter/material.dart';

class OpenTimeWidget extends StatefulWidget {
  const OpenTimeWidget({Key? key}) : super(key: key);

  @override
  State<OpenTimeWidget> createState() => _OpenTimeWidgetState();
}

class _OpenTimeWidgetState extends State<OpenTimeWidget> {
  late bool _open = false;

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              child: Container(
            margin: const EdgeInsets.symmetric(vertical: 15.0),
            child: Column(
              children: [
                InkWell(
                  onTap: () => setState(() => _open = !_open),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextCommon.contentHeader("OpenTime"),
                      Row(
                        children: [
                          TextCommon.normalText("Sunday 08.00-19.00",
                              color: Colors.green,
                              fontSize: 16.0,
                              fontWeight: FontWeight.w400),
                          Icon(_open
                              ? Icons.keyboard_arrow_down
                              : Icons.keyboard_arrow_up)
                        ],
                      ),
                    ],
                  ),
                ),
                _open
                    ? SizedBox(
                        width: double.infinity,
                        height: 150,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            getDateTimeUI(
                                day: "Sunday", time: "08.00AM - 08.00PM"),
                            getDateTimeUI(
                                day: "Sunday", time: "08.00AM - 08.00PM"),
                            getDateTimeUI(
                                day: "Sunday", time: "08.00AM - 08.00PM"),
                            getDateTimeUI(
                                day: "Sunday", time: "08.00AM - 08.00PM"),
                            getDateTimeUI(
                                day: "Sunday", time: "08.00AM - 08.00PM"),
                            getDateTimeUI(
                                day: "Sunday", time: "08.00AM - 08.00PM"),
                            getDateTimeUI(
                                day: "Sunday", time: "08.00AM - 08.00PM")
                          ],
                        ),
                      )
                    : const SizedBox(),
              ],
            ),
          ))
        ]);
  }

  getDateTimeUI({required String day, required String time}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextCommon.normalText(day),
        TextCommon.normalText(time),
      ],
    );
  }
}
