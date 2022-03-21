import 'package:aunjai/model/review_post.model.dart';
import 'package:aunjai/utils/helper.dart';
import 'package:aunjai/utils/widgets/appbar.dart';
import 'package:aunjai/utils/widgets/reviews/review_section.dart';
import 'package:flutter/material.dart';

class ReviewPage extends StatefulWidget {
  const ReviewPage({required this.posts, Key? key}) : super(key: key);

  final List<ReviewPostModel> posts;

  @override
  // ignore: no_logic_in_create_state
  State<ReviewPage> createState() => _ReviewPageState(posts);
}

class _ReviewPageState extends State<ReviewPage> {
  final List<ReviewPostModel> posts;

  _ReviewPageState(this.posts);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context, title: "Reviews"),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal:  Helper.layoutPadding),
        width: Helper.getScreenWidth(context),
        height: Helper.getScreenHeight(context),
        child: ReviewSectionLazyLoading(
          posts: posts,
        ),
      ),
    );
  }
}
