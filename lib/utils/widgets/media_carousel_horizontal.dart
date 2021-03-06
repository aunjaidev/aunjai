import 'package:aunjai/constant/style_constant.dart';
import 'package:aunjai/routes.dart';
import 'package:aunjai/utils/helper.dart';
import 'package:aunjai/utils/widgets/get_rating_star.dart';
import 'package:aunjai/utils/widgets/horizontal.dart';
import 'package:flutter/material.dart';

class MediaCarouselHorizontalWidget extends StatelessWidget {
  const MediaCarouselHorizontalWidget({Key? key,required this.label}) : super(key: key);

  final String label;

  Map<String, dynamic> getPlaceMock() => {
        "id": "p001",
        "title": "Temple Of Dawn (Wat Arun)",
        "coverImage":
            "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/17/ee/e6/a5/wat-arun-is-an-ancient.jpg?w=900&h=-1&s=1",
        "type": "Points of Interest & Landmarks • Religious Sites",
        "distance": 25,
        "rating": 2.5
      };

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            width: Helper.getScreenWidth(context),
            margin:
                const EdgeInsets.only(top: 20, bottom: 10, right: 10, left: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  label,
                  style: customStyle(
                      fontSize: 21.0,
                      fontWeight: FontWeight.w400,
                      color: Colors.black),
                ),
                InkWell(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Row(
                      children: [
                        Text(
                          "show all",
                          style: customStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.w300,
                              color: Colors.black),
                        ),
                        const Icon(
                          Icons.arrow_forward_ios,
                          size: 10.0,
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            width: Helper.getScreenWidth(context),
            height: 220,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                _card(context),
                _card(context),
                _card(context),
                _card(context),
                _card(context),
                _card(context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _card(context) {
    return InkWell(
      onTap: () {
        Map<String, String> args = {"id": "p001", "type": "attraction_place"};
        RouteCommon.handleNavigationRoute(
            context: context, routeName: "/screen/attraction_place", arguments: args);
      },
      child: Container(
        margin: const EdgeInsets.only(left: 10.0),
        width: 220,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: double.infinity,
              height: 124,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(
                  getPlaceMock()["coverImage"],
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 5.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 1.5),
                    child: textContentTitle(getPlaceMock()["title"]),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 1.5),
                    child: normalText(getPlaceMock()["type"], fontSize: 14.0),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ratingStar(size: 14,score: getPlaceMock()["rating"]),
                      const Horizontal(5.0),
                      subtitle(" from 1000 reviews")
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
