import 'package:aunjai/model/review_post.model.dart';
import 'package:aunjai/utils/helper.dart';
import 'package:aunjai/utils/widgets/widgets.common.dart';
import 'package:flutter/material.dart';

class ReviewPage extends StatefulWidget {
  const ReviewPage({required this.posts,Key? key}) : super(key: key);

  final List<ReviewPostModel> posts;
  @override
  State<ReviewPage> createState() => _ReviewPageState();
}

class _ReviewPageState extends State<ReviewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: WidgetsCommon.appBar(context,title: "Reviews"),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: Helper.layoutPadding),
        width: Helper.getScreenWidth(context),
        height: Helper.getScreenHeight(context),
        child: ListView(),
      ),
    );
  }
}
