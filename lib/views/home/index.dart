import 'package:aunjai/utils/app_theme.dart';
import 'package:aunjai/utils/text.common.dart';
import 'package:aunjai/utils/widgets/horizontal.dart';
import 'package:aunjai/utils/widgets/media_carousel_horizontal.dart';
import 'package:aunjai/utils/widgets/textfield.dart';
import 'package:aunjai/utils/widgets/vertical.dart';
import 'package:aunjai/views/home/widget/carouse_slide_widget.dart';
import 'package:aunjai/views/search/index.dart';
import 'package:flutter/material.dart';
import 'package:aunjai/utils/helper.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentSlider = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: ListView(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          physics: const ClampingScrollPhysics(),
          children: [
            SizedBox(
              width: Helper.getScreenWidth(context),
              height: 320.0,
              child: Stack(
                children: [
                  Image.network(
                    "https://wihok.sgp1.digitaloceanspaces.com/uploads/photos/2021/02/sngine_829d7b213dc587eb14d438cc6c468398.jpg",
                    width: Helper.getScreenWidth(context),
                    height: 320.0,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                      child: Container(
                    color: AppTheme.primary2.withOpacity(0.5),
                    width: Helper.getScreenWidth(context),
                    height: 320.0,
                  )),
                  Positioned(
                      left: 0,
                      right: 0,
                      top: 50.0,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: Helper.layoutPadding),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Vertical(5.0),
                            TextCommon.normalText(
                                "Discover Your Favorite\nPlace with AunJai",
                                color: Colors.white,
                                fontSize: 30.0,
                                fontWeight: FontWeight.w500),
                            const Vertical(30.0),
                          ],
                        ),
                      )),
                  Positioned(
                      bottom: 40,
                      left: 0,
                      right: 0,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: Helper.layoutPadding),
                        child: Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                TextCommon.normalText("Roi-Et, Thailand ",
                                    fontSize: 20.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400),
                                const Horizontal(10.0),
                                const Icon(
                                  Icons.nights_stay,
                                  color: Colors.white,
                                  size: 18.0,
                                ),
                                TextCommon.normalText("17*C",
                                    color: Colors.white,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w400)
                              ],
                            ),
                            const Vertical(1.5),
                            SizedBox(
                              width: Helper.getScreenWidth(context),
                              height: 64,
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(top: 8, bottom: 8),
                                child: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                SearchPage()));
                                  },
                                  child: Container(
                                    decoration: const BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10.0)),
                                    ),
                                    child: Row(
                                      children: <Widget>[
                                        const SizedBox(
                                          width: 60,
                                          height: 60,
                                          child: Icon(Icons.search,
                                              color: AppTheme.primary3),
                                        ),
                                        Expanded(
                                          child: Container(
                                              padding: const EdgeInsets.only(
                                                  right: 16),
                                              child: TextCommon.normalText(
                                                  "Search Destination",
                                                  fontSize: 18.0,
                                                  fontWeight: FontWeight.w400,
                                                  color: AppTheme.primary3)),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: MediaCarouselHorizontalWidget(),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: MediaCarouselHorizontalWidget(),
            )
          ],
        ));
  }
}
