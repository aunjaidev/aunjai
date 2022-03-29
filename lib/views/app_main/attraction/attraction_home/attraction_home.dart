import 'package:aunjai/constant/color_constant.dart';
import 'package:aunjai/constant/style_constant.dart';
import 'package:aunjai/routes.dart';
import 'package:aunjai/utils/widgets/card_custom/card_horizontal_slide.dart';
import 'package:aunjai/utils/widgets/decoration.dart';
import 'package:aunjai/utils/widgets/horizontal.dart';
import 'package:aunjai/utils/widgets/media_carousel_horizontal.dart';
import 'package:aunjai/views/search/index.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:aunjai/utils/helper.dart';

class AttractionHome extends StatefulWidget {
  const AttractionHome({Key? key}) : super(key: key);

  @override
  _AttractionHomeState createState() => _AttractionHomeState();
}

class _AttractionHomeState extends State<AttractionHome> {
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
              height: 250.0,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Image.network(
                    "https://images.unsplash.com/photo-1563492065599-3520f775eeed?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1074&q=80",
                    width: Helper.getScreenWidth(context),
                    height: 250.0,
                    fit: BoxFit.fill,
                  ),
                  Positioned(
                      child: Container(
                    color: primary2.withOpacity(0.25),
                    width: Helper.getScreenWidth(context),
                    height: 300.0,
                  )),
                  Positioned.fill(
                    bottom: 50,
                    left: 0,
                    right: 0,
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: InkWell(
                        onTap: (){
                          RouteCommon.handleNavigationRoute(context: context, routeName: "/attractionCity");
                        },
                        child: Container(
                          padding: const EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.black.withOpacity(0.5),
                          ),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.near_me,
                                color: Colors.white,
                              ),
                              const Horizontal(10.0),
                              normalText("Roi-Et, Thailand ",
                                  fontSize: 25.0,
                                  color: Colors.white,
                                  align: TextAlign.center,
                                  fontWeight: FontWeight.w400),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned.fill(
                      left: 10,
                      right: 10,
                      top: 10,
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: Row(
                          children: [
                            InkWell(
                              child: Container(
                                width: 35,
                                height: 35,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25.0),
                                  color: Colors.black.withOpacity(0.5),
                                ),
                                child: const InkWell(
                                  child: Center(
                                    child: Icon(
                                      Icons.arrow_back,
                                      size: 30.0,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const Horizontal(10.0),
                            Flexible(
                              child: SizedBox(
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
                                                  const SearchPage()));
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
                                                color: primary3),
                                          ),
                                          Expanded(
                                            child: Container(
                                                padding: const EdgeInsets.only(
                                                    right: 16),
                                                child: normalText(
                                                    "Search Destination",
                                                    fontSize: 18.0,
                                                    fontWeight: FontWeight.w400,
                                                    color: primary3)),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: Helper.layoutPadding,
                  vertical: Helper.layoutPadding),
              child: Container(
                width: Helper.getScreenWidth(context),
                padding: const EdgeInsets.all(Helper.layoutPadding),
                decoration: BoxDecoration(
                  color: mFillColor,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: mBorderColor, width: 1),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.manage_accounts),
                        Padding(
                            padding: EdgeInsets.only(left: 16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                normalText('Trip planner', fontSize: 22.0),
                                Helper.widgetSpacePadding,
                                subtitle("manage trips for you")
                              ],
                            )),
                      ],
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 20,
                    )
                  ],
                ),
              ),
            ),
            const MediaCarouselHorizontalWidget(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                textContentTitle("Contents"),
                Wrap(
                  spacing: 2.0,
                  children: getContents(),
                )
              ],
            )
          ],
        ));
  }

  List<Widget> getContents() {
    List<Widget> widgets = [];
    for (int i = 0; i < 20; i++) {
      widgets.add(Container(
        width: Helper.getScreenWidth(context) / 2 - 1,
        padding: const EdgeInsets.all(5.0),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(2.0),
              height: 150,
              decoration: decoration(borderRadius: 5.0, color: Colors.amber),
            )
          ],
        ),
      ));
    }
    return widgets;
  }
}
