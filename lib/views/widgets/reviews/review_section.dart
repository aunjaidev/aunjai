import 'package:aunjai/app_theme.dart';
import 'package:aunjai/mock/review_mock.dart';
import 'package:aunjai/utils/media_size.dart';
import 'package:aunjai/views/attraction/page/review_page/review.dart';
import 'package:aunjai/views/widgets/common.dart';
import 'package:aunjai/views/widgets/reviews/post.dart';
import 'package:flutter/material.dart';

class ReviewSection extends StatefulWidget {
  const ReviewSection({Key? key}) : super(key: key);

  @override
  State<ReviewSection> createState() => _ReviewSectionState();
}

class _ReviewSectionState extends State<ReviewSection> {
  List<Widget> getReviews() {
    List<Widget> widgets = [];
    int _count = 0;
    for (var post in reviewMock) {
      if (_count == 4) {
        widgets.add(
          WidgetCommon.button(context, label:  "ดูรีวิวเพิ่มเติม (${reviewMock.length - widgets.length})",onTap: ()=>Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ReviewPage(posts: reviewMock)))),
        );
        break;
      }
      widgets.add(ReviewPost(
          avatar: post.profileImg,
          content: post.reviewTextPost,
          keyMention: post.reviewKeyMention,
          name: post.profileName,
          rating: post.reviewRating,
          writeTime: post.reviewWriteTime));

      _count++;
    }

    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Helper.getScreenWidth(context),
      child: Column(
        children: getReviews(),
      ),
    );
  }
}
