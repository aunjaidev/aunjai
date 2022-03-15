import 'package:aunjai/app_theme.dart';
import 'package:aunjai/views/widgets/review_card.dart';
import 'package:aunjai/views/widgets/vertical.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class AttractionReview extends StatefulWidget {
  const AttractionReview({Key? key}) : super(key: key);

  @override
  State<AttractionReview> createState() => _AttractionReviewState();
}

class _AttractionReviewState extends State<AttractionReview> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15.0),
            child: Column(
              children: [
                AppTheme.normalText(
                  "Your rating",
                  fontSize: 22.0,
                ),
                const Vertical(5.5),
                RatingBar.builder(
                  initialRating: 0,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  unratedColor: Colors.black12,
                  glowColor: Colors.transparent,
                  itemCount: 5,
                  itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                  itemBuilder: (context, _) => const Icon(
                    Icons.star,
                    color: AppTheme.primaryColor,
                  ),
                  onRatingUpdate: (rating) {
                    print(rating);
                  },
                ),
                const Vertical(15),
                const Divider()
              ],
            ),
          ),
        ),
        const ReviewCard()
      ],
    );
  }

}
