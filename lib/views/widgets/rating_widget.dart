import 'package:flutter/material.dart';

class Rating extends StatelessWidget {
  Rating({this.size, required this.rating, Key? key}) : super(key: key);
  final double rating;
  late double? size;
  @override
  Widget build(BuildContext context) {
    List<Widget> _buildRating(double star) {
      List<Widget> widgets = [];
      for (int i = 0; i < star.toInt(); i++) {
        widgets.add(Icon(
          Icons.star,
          size: size ?? 18.0,
        ));
      }

      if (star.toInt() != star) {
        widgets.add(Icon(Icons.star_half, size: size ?? 18.0));
      }

      for (int i = 0; i < 5 - widgets.length; i++) {
        widgets.add(Icon(Icons.star_border, size: size ?? 18.0));
      }
      return widgets;
    }

    return Row(
      children: _buildRating(rating),
    );
  }
}
