import 'package:aunjai/app_theme.dart';
import 'package:aunjai/views/widgets/horizontal.dart';
import 'package:aunjai/views/widgets/vertical.dart';
import 'package:flutter/material.dart';

class ReviewCard extends StatelessWidget {
  const ReviewCard({Key? key}) : super(key: key);

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

        ],
      ),
    );
  }
}
