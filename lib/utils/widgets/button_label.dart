import 'package:aunjai/constant/color_constant.dart';
import 'package:aunjai/constant/style_constant.dart';
import 'package:aunjai/utils/helper.dart';
import 'package:aunjai/utils/widgets/horizontal.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ButtonLabel extends StatelessWidget {
  ButtonLabel(
      {Key? key,
      this.child,
      required this.prefixIcon,
      this.subContent,
      required this.label,
      this.subfixLabel,
      this.subfixIcon,
      required this.onTap})
      : super(key: key);

  IconData prefixIcon;
  String label;
  GestureTapCallback onTap;
  IconData? subfixIcon;
  String? subContent;
  String? subfixLabel;
  Column? child;

  @override
  Widget build(BuildContext context) {
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
          child??const SizedBox(),
          const Divider(color: Color(0xFFF1F1F5), thickness: 1),
        ],
      ),
    );
  }
}
