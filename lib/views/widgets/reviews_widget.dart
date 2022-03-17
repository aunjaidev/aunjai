import 'dart:math';

import 'package:aunjai/app_theme.dart';
import 'package:aunjai/utils/media_size.dart';
import 'package:aunjai/views/widgets/horizontal.dart';
import 'package:aunjai/views/widgets/vertical.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'expandable_text.dart';

class ReviewsWidget extends StatefulWidget {
  const ReviewsWidget({Key? key}) : super(key: key);

  @override
  State<ReviewsWidget> createState() => _ReviewsWidgetState();
}

class _ReviewsWidgetState extends State<ReviewsWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const CircleAvatar(
                radius: 25,
                backgroundImage:
                    NetworkImage('https://via.placeholder.com/600/92c952'),
              ),
              const Horizontal(10.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppTheme.normalText("Lela Peterson",
                      fontSize: 18.0, fontWeight: FontWeight.w500),
                  const Vertical(2.5),
                  AppTheme.normalText("Posted 3 hours ago", fontSize: 12.0)
                ],
              )
            ],
          ),
          const ExpandableText(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque scelerisque efficitur posuere. Curabitur tincidunt placerat diam ac efficitur. Cras rutrum egestas nisl vitae pulvinar. Donec id mollis diam, id hendrerit neque. Donec accumsan efficitur libero, vitae feugiat odio fringilla ac. Aliquam a turpis bibendum, varius erat dictum, feugiat libero. Nam et dignissim nibh. Morbi elementum varius elit, at dignissim ex accumsan a',
            trimLines: 2,
          ),
          Container(
            width: Helper.getScreenWidth(context),
            height: 125,
            child: Row(
              children: getReviewPhoto(),
            ),
          )
        ],
      ),
    );
  }

  List<Widget> getReviewPhoto() {
    List<Widget> _widgets = [];

    for (int i = 0; i < 10; i++) {
      if(i ==3){
        _widgets.add(Container(
          width: 90,
          height: 90,
          child: Center(
            child: AppTheme.normalText("+${10-i}",fontSize: 20.0),
          ),
          color: Colors.primaries[Random().nextInt(Colors.primaries.length)],
        ));
        
        break;
      }
      _widgets.add(Container(
        width: 90,
        height: 90,
        color: Colors.primaries[Random().nextInt(Colors.primaries.length)],
      ));
    }
    return _widgets;
  }
}
