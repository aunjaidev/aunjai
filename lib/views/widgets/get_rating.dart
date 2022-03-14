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
        Container(
          width: 20,
          height: 20,
          decoration: AppTheme.getDecoration(
              borderRadius: 5.0, color: AppTheme.primaryColor),
          child: Center(
              child: AppTheme.normalText(rating.toString(), color: color)),
        )
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
    return star;
  }
}

Widget getRating(String rating) {
  return Container(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Icon(
          Icons.star,
          color: AppTheme.nearlyWhite,
          size: 12,
        ),
        Text(
          rating,
          style: AppTheme.customeStyle(
              fontSize: 12.0, color: AppTheme.nearlyWhite),
        )
      ],
    ),
    width: 40,
    decoration: AppTheme.getDecoration(
        borderRadius: 10.0, color: AppTheme.primaryColor),
  );
}
