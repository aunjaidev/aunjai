import 'package:aunjai/model/review_post.model.dart';
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
    return Scaffold();
  }
}
