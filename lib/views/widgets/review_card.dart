import 'package:aunjai/app_theme.dart';
import 'package:flutter/material.dart';

class ReviewCard extends StatelessWidget {
  const ReviewCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const CircleAvatar(
              radius: 30,
              backgroundColor: Color(0xffFDCF09),
              child: CircleAvatar(
                radius: 30,
                backgroundImage:
                NetworkImage('https://via.placeholder.com/600/92c952'),
              ),
            ),
            Column(
              children: [
                AppTheme.normalText("Lela Peterson",fontSize: 18.0),
                AppTheme.normalText("Posted 3 hours ago")
              ],
            )
          ],
        )
      ],
    );
  }
}
