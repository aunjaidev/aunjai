import 'package:flutter/material.dart';
import 'package:aunjai/app_theme.dart';
import 'package:aunjai/utils/media_size.dart';
import 'package:aunjai/views/widgets/get_textfilecustome.dart';
import 'package:aunjai/views/widgets/notification_badge.dart';
import 'package:aunjai/views/widgets/vertical.dart';

class HomeHeaderBar extends StatefulWidget {
  const HomeHeaderBar({Key? key}) : super(key: key);

  @override
  State<HomeHeaderBar> createState() => _HomeHeaderBarState();
}

class _HomeHeaderBarState extends State<HomeHeaderBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(
            horizontal: AppTheme.layoutPadding),
        width: Helper.getScreenWidth(context),
        height: 120.0,
        child: Column(
          children: [
            const Vertical(AppTheme.layoutPadding),
            Row(
              children: [
                Flexible(
                    flex: 9,
                    child: getTextFieldCustome(context,
                        label: "Search Destination")),
                Flexible(
                    flex: 1,
                    child: NotificationBadge(
                      onTap: () {},
                      text: "x",
                      notificationCount: 4,
                      iconData: Icons.notifications,
                    ))
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
                        style:
                        AppTheme.customeStyle(color: Colors.white),
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
