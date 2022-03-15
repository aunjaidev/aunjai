import 'package:aunjai/views/widgets/horizontal.dart';
import 'package:flutter/material.dart';
import 'package:aunjai/app_theme.dart';

// ignore: must_be_immutable
class GetRatingStarWidget extends StatelessWidget {
  GetRatingStarWidget({required this.rating, this.color, size, Key? key})
      : super(key: key);
  final double rating;
  Color? color;
  double? size;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(children: _getStar()),
        const Horizontal(5.0),
        AppTheme.normalText("from 1,000 review", color: color)
      ],
    );
  }

  List<Widget> _getStar() {
    final star = <Widget>[];
    int count = 0;
    for (int i = 0; i < rating.toInt(); i++) {
      star.add(Icon(
        Icons.star,
        color: color ?? AppTheme.primaryColor,
        size: size ?? 15,
      ));
      count++;
    }

    if (rating != count) {
      star.add(Icon(
        Icons.star_half,
        color: color ?? AppTheme.primaryColor,
        size: size ?? 15,
      ));
    }

    count = rating.toInt() - count + 1;
    for (int i = 0; i < count; i++) {
      star.add(Icon(
        Icons.star_border,
        color: color ?? AppTheme.primaryColor,
        size: size ?? 15,
      ));
    }
    return star;
  }

}
