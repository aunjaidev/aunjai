import 'dart:math';

import 'package:aunjai/constant/style_constant.dart';
import 'package:aunjai/utils/helper.dart';
import 'package:aunjai/utils/widgets/expandableText.dart';
import 'package:aunjai/utils/widgets/get_rating_star.dart';
import 'package:aunjai/utils/widgets/horizontal.dart';
import 'package:aunjai/utils/widgets/vertical.dart';
import 'package:flutter/material.dart';

class ReviewPost extends StatefulWidget {
  const ReviewPost(
      {required this.avatar,
      required this.content,
      required this.keyMention,
      required this.name,
      required this.rating,
      required this.writeTime,
      Key? key})
      : super(key: key);
  final String avatar;
  final String name;
  final double rating;
  final String content;
  final String keyMention;
  final String writeTime;

  @override
  State<ReviewPost> createState() => _ReviewPostState(
      avatar: avatar,
      content: content,
      keyMention: keyMention,
      name: name,
      rating: rating,
      writeTime: writeTime);
}

class _ReviewPostState extends State<ReviewPost> {
  _ReviewPostState({
    required this.avatar,
    required this.content,
    required this.keyMention,
    required this.name,
    required this.rating,
    required this.writeTime,
  });

  final String avatar;
  final String name;
  final double rating;
  final String content;
  final String keyMention;
  final String writeTime;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 25,
                    backgroundImage: NetworkImage(avatar),
                  ),
                  Horizontal(10.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      normalText(name,
                          fontSize: 18.0, fontWeight: FontWeight.w500),
                      ratingStar(score: rating),
                    ],
                  )
                ],
              ),
              const InkWell(
                child: Icon(
                  Icons.more_vert,
                ),
              ),
            ],
          ),
          Vertical(5),
          Text(
            keyMention,
            style: customStyle(
                fontSize: 20.0, fontWeight: FontWeight.w400, height: 1.35),
          ),
          ExpandableText(content, trimLines: 3),
          SizedBox(
            width: Helper.getScreenWidth(context),
            height: 105,
            child: Row(
              children: getReviewPhoto(),
            ),
          ),
          normalText(writeTime)
        ],
      ),
    );
  }

  List<Widget> getReviewPhoto() {
    List<Widget> _widgets = [];

    for (int i = 0; i < 10; i++) {
      if (i == 3) {
        _widgets.add(Container(
          width: 90,
          height: 90,
          child: Center(
            child: normalText("+${10 - i}", fontSize: 20.0),
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
