import 'package:aunjai/app_theme.dart';
import 'package:aunjai/views/widgets/vertical.dart';
import 'package:flutter/material.dart';

class AttractionOverview extends StatefulWidget {
  const AttractionOverview({Key? key}) : super(key: key);

  @override
  State<AttractionOverview> createState() => _AttractionOverviewState();
}

class _AttractionOverviewState extends State<AttractionOverview> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppTheme.contentHeader("About"),
          AppTheme.normalContentText(
              "A nice quaint cafe with a good view of the lower city and mountains. Good to visit even when cloudy or raining because they have a friendly pupper to keep guests company as you."),
          const Vertical(15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppTheme.contentHeader("OpenTime"),
              InkWell(
                child: AppTheme.normalText("Open 08.00-19.00",
                    color: Colors.green, fontSize: 16.0),
              )
            ],
          )
        ],
      ),
    );
  }
}
