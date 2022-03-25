import 'package:aunjai/utils/app_theme.dart';
import 'package:aunjai/utils/text.common.dart';
import 'package:aunjai/utils/widgets/decoration.dart';
import 'package:aunjai/utils/widgets/horizontal.dart';
import 'package:aunjai/utils/widgets/media_carousel_horizontal.dart';
import 'package:aunjai/utils/widgets/textfield.dart';
import 'package:aunjai/utils/widgets/vertical.dart';
import 'package:aunjai/views/home/widget/carouse_slide_widget.dart';
import 'package:aunjai/views/search/index.dart';
import 'package:flutter/cupertino.dart';
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
                    color: AppTheme.primary2.withOpacity(0.25),
                    width: Helper.getScreenWidth(context),
                    height: 300.0,
                  )),
                  Positioned.fill(
                    bottom: 50,
                    left: 0,
                    right: 0,
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        width: 250,
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
                            TextCommon.normalText("Roi-Et, Thailand ",
                                fontSize: 25.0,
                                color: Colors.white,
                                align: TextAlign.center,
                                fontWeight: FontWeight.w400),
                          ],
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
                                    child: const Icon(
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
                              ),
                            ),
                          ],
                        ),
                      )),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: Helper.layoutPadding,
                  vertical: Helper.layoutPadding),
              child: Container(
                width: Helper.getScreenWidth(context),
                padding: EdgeInsets.all(Helper.layoutPadding),
                height: 100,
                decoration:
                    decoration(color: AppTheme.primary2, borderRadius: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.local_activity,
                          color: Colors.white,
                          size: 30,
                        ),
                        Horizontal(10.0),
                        TextCommon.normalText("Trip Me",
                            color: Colors.white, fontSize: 22.0)
                      ],
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.white,
                      size: 30,
                    )
                  ],
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(Helper.layoutPadding),
                  child: TextCommon.textContentTitle("City"),
                ),
                SizedBox(
                  width: Helper.getScreenWidth(context),
                  height: 140.0,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (ctx, index) {
                      return Container(
                        margin: EdgeInsets.symmetric(horizontal: 10.0),
                        child: Column(
                          children: [
                            Container(
                              width: 100,
                              height: 100,
                              decoration: decoration(
                                  color: Colors.black, borderRadius: 50.0),
                            ),
                            TextCommon.normalText("Bangkok",
                                color: Colors.black, fontSize: 18.0)
                          ],
                        ),
                      );
                    },
                    itemCount: 10,
                  ),
                )
              ],
            ),
            MediaCarouselHorizontalWidget(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(Helper.layoutPadding),
                  child: TextCommon.textContentTitle("Contents"),
                ),
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
        width: Helper.getScreenWidth(context) / 2 -1,
        padding: EdgeInsets.all(5.0),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(2.0),
              height: 150,
              decoration: decoration(borderRadius: 5.0,color: Colors.amber),
            )
          ],
        ),
      ));
    }
    return widgets;
  }
}
