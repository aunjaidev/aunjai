import 'package:aunjai/routes.dart';
import 'package:flutter/material.dart';
import 'package:aunjai/app_theme.dart';
import 'package:aunjai/utils/media_size.dart';
import 'package:aunjai/views/widgets/get_rating.dart';

class SlideHorizontalWidget extends StatelessWidget {
  const SlideHorizontalWidget({Key? key}) : super(key: key);

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
            margin: const EdgeInsets.symmetric(vertical: AppTheme.layoutPadding),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Popular Destinations',
                  style: AppTheme.customeStyle(
                      fontSize: 21.0,
                      fontWeight: FontWeight.w400,
                      color: Colors.black),
                ),
                InkWell(
                  onTap: () {},
                  child: Row(
                    children: [
                      Text(
                        "show all",
                        style: AppTheme.customeStyle(
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
                )
              ],
            ),
          ),
          SizedBox(
            width: Helper.getScreenWidth(context),
            height: 250,
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
        Map<String, String> args = {"id": "p001", "type": "attraction"};
        handleNavigationRoute(
            context: context, routeName: "/AttractionScreen", arguments: args);
      },
      child: Container(
        margin: const EdgeInsets.only(right: 7.5),
        width: 200,
        height: 200.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: double.infinity,
              height: 130,
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
                    child:
                        AppTheme.textActivitiesTitle(getPlaceMock()["title"]),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 1.5),
                    child:
                        AppTheme.textActivitiesContent(getPlaceMock()["type"]),
                  ),
                  GetRatingStarWidget(rating: getPlaceMock()["rating"]),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}