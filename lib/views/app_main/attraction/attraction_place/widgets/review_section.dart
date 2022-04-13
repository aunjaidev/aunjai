import 'package:aunjai/constant/color_constant.dart';
import 'package:aunjai/constant/style_constant.dart';
import 'package:aunjai/model/mention_model.dart';
import 'package:aunjai/utils/helper.dart';
import 'package:aunjai/utils/widgets/get_rating_star.dart';
import 'package:aunjai/utils/widgets/horizontal.dart';
import 'package:aunjai/utils/widgets/mention_slide.dart';
import 'package:aunjai/utils/widgets/progressbar.dart';
import 'package:aunjai/utils/widgets/reviews/review_section.dart';
import 'package:aunjai/utils/widgets/vertical.dart';
import 'package:flutter/material.dart';

class ReviewSection extends StatelessWidget {
  final GlobalKey reviewKey;

  ReviewSection({Key? key, required this.reviewKey, this.mentionList})
      : super(key: key);
  Map<String, MentionModel>? mentionList;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Vertical(15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  textContentTitle("Travel Reviews"),
                  const Vertical(5.0),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          const Text(
                            "3.5",
                            style: TextStyle(fontSize: 50.0),
                          ),
                          const Vertical(5.0),
                          ratingStar(
                            score: 3.5,
                          ),
                          const Vertical(5.0),
                          SizedBox(
                              width: 100,
                              child: normalText("100000 Reviews",
                                  align: TextAlign.center, fontSize: 14))
                        ],
                      ),
                      const Horizontal(10),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30.0),
                          child: SizedBox(
                            width: Helper.getScreenWidth(context),
                            height: 100,
                            child: Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    normalText("Excellent"),
                                    normalText("VeryGood"),
                                    normalText("Average"),
                                    normalText("Poor"),
                                    normalText("Terrible"),
                                  ],
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      getRatingProgressBar(0.12),
                                      getRatingProgressBar(0.55),
                                      getRatingProgressBar(0.23),
                                      getRatingProgressBar(0.95),
                                      getRatingProgressBar(1.0),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
              const Vertical(20.0),
              MentionSlide(mentionList),
              const ReviewSectionWithMore()
            ],
          ),
        ],
      ),
    );
  }


  getRatingProgressBar(double percentage) {
    return Flexible(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5.0),
        child: progressbar(percentage),
      ),
      flex: 10,
    );
  }
}
