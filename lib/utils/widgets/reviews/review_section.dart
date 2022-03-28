import 'package:aunjai/mock/review_mock.dart';
import 'package:aunjai/model/review_post.model.dart';
import 'package:aunjai/utils/helper.dart';
import 'package:aunjai/utils/widgets/button.dart';
import 'package:aunjai/utils/widgets/reviews/post.dart';
import 'package:aunjai/views/app_main/attraction/attraction_place/page/review_page/review.dart';
import 'package:flutter/material.dart';

class ReviewSectionWithMore extends StatefulWidget {
  const ReviewSectionWithMore({Key? key}) : super(key: key);

  @override
  State<ReviewSectionWithMore> createState() => _ReviewSectionWithMoreState();
}

class _ReviewSectionWithMoreState extends State<ReviewSectionWithMore> {
  List<Widget> getReviews() {
    List<Widget> widgets = [];
    int _count = 0;
    for (var post in reviewMock) {
      if (_count == 4) {
        widgets.add(
          button(context,
              label: "ดูรีวิวเพิ่มเติม (${reviewMock.length - widgets.length})",
              onTap: () => Navigator.push(
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




class ReviewSectionLazyLoading extends StatefulWidget {
  const ReviewSectionLazyLoading({required this.posts, Key? key})
      : super(key: key);

  final List<ReviewPostModel> posts;

  @override
  State<ReviewSectionLazyLoading> createState() =>
      _ReviewSectionLazyLoadingState(posts);
}


class _ReviewSectionLazyLoadingState extends State<ReviewSectionLazyLoading> {
  final List<ReviewPostModel> posts;

  _ReviewSectionLazyLoadingState(this.posts);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemCount: posts.length,itemBuilder: (ctx,index)=>ReviewPost(
        avatar: posts[index].profileImg,
        content: posts[index].reviewTextPost,
        keyMention: posts[index].reviewKeyMention,
        name: posts[index].profileName,
        rating: posts[index].reviewRating,
        writeTime: posts[index].reviewWriteTime));
  }
}
