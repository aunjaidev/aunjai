import 'package:aunjai/constant/color_constant.dart';
import 'package:aunjai/constant/style_constant.dart';
import 'package:aunjai/utils/helper.dart';
import 'package:aunjai/utils/widgets/get_rating_star.dart';
import 'package:aunjai/utils/widgets/horizontal.dart';
import 'package:aunjai/utils/widgets/progressbar.dart';
import 'package:aunjai/utils/widgets/reviews/review_section.dart';
import 'package:aunjai/utils/widgets/vertical.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ReviewSection extends StatelessWidget {
  const ReviewSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Padding(
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
                  textContentTitle("Reviews"),
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
                              child: normalText(
                                  "from 100000000",
                                  align: TextAlign.center,
                                  fontSize: 14))
                        ],
                      ),
                      const Horizontal(15),
                      Expanded(
                        child: SizedBox(
                          width: Helper.getScreenWidth(context),
                          height: 100,
                          child: Row(
                            children: [
                              Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.end,
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
                                    getRatingProgressBar(0.1),
                                    getRatingProgressBar(0.5),
                                    getRatingProgressBar(0.2),
                                    getRatingProgressBar(0.9),
                                    getRatingProgressBar(1.0),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
              const Vertical(30.0),
              Center(
                child: Column(
                  children: [
                    const CircleAvatar(),
                    normalText("ให้คะแนนสำหรับสถานที่นี้"),
                    RatingBar.builder(
                      initialRating: 0,
                      minRating: 0,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      unratedColor: Colors.black12,
                      glow: false,
                      itemPadding:
                      const EdgeInsets.symmetric(horizontal: 4.0),
                      itemBuilder: (context, _) => const Icon(
                        Icons.star,
                        color: primary1,
                      ),
                      onRatingUpdate: (rating) {
                        print(rating);
                      },
                    )
                  ],
                ),
              ),
              const ReviewSectionWithMore()
            ],
          ),
        ],
      ),
    );
  }

  getRatingProgressBar(percentage) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Flexible(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            child: progressbar(95),
          ),
          flex: 10,
        ),
        Flexible(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              child: normalText("95"),
            ))
      ],
    );
  }
}


