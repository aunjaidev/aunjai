import 'package:aunjai/utils/text.common.dart';
import 'package:aunjai/utils/widgets/widgets.common.dart';
import 'package:flutter/material.dart';
import 'package:aunjai/app_theme.dart';
import 'package:aunjai/utils/helper.dart';

class HomeHeaderBar extends StatefulWidget {
  const HomeHeaderBar({Key? key}) : super(key: key);

  @override
  State<HomeHeaderBar> createState() => _HomeHeaderBarState();
}

class _HomeHeaderBarState extends State<HomeHeaderBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: Helper.layoutPadding),
        width: Helper.getScreenWidth(context),
        height: 120.0,
        child: Column(
          children: [
            WidgetsCommon.vertical(Helper.layoutPadding),
            Row(
              children: [
                Flexible(
                    flex: 9,
                    child: WidgetsCommon.textField(context,
                        label: "Search Destination")),
                Flexible(
                    flex: 1,
                    child: WidgetsCommon.notificationBadge())
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  child: Row(
                    children: [
                      Text(
                        "Roi-et, Roi-et Thailand",
                        style: TextCommon.customeStyle(color: Colors.white),
                      ),
                      const Icon(
                        Icons.arrow_drop_down_outlined,
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
        decoration: const BoxDecoration(
            color: AppTheme.primaryColor,
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.elliptical(917, 150),
                bottomRight: Radius.elliptical(917, 150))));
  }
}
