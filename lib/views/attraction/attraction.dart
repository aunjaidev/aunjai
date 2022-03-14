import 'dart:convert';
import 'dart:io';

import 'package:aunjai/app_theme.dart';
import 'package:aunjai/utils/media_size.dart';
import 'package:aunjai/views/attraction/page/overview.dart';
import 'package:aunjai/views/attraction/page/photos.dart';
import 'package:aunjai/views/attraction/page/review.dart';
import 'package:aunjai/views/widgets/get_rating.dart';
import 'package:aunjai/views/widgets/vertical.dart';
import 'package:flutter/material.dart';
import 'package:sticky_headers/sticky_headers.dart';

class AttractionScreen extends StatefulWidget {
  const AttractionScreen({Key? key}) : super(key: key);

  @override
  State<AttractionScreen> createState() => _AttractionScreenState();
}

class _AttractionScreenState extends State<AttractionScreen> {
  late int _currentSwitchPage = 0;
  late final ScrollController _scrollController = ScrollController();
  late int _offsetScollY =0;
  @override
  void initState() {
    _scrollController.addListener(() {
      setState(()=>_offsetScollY = _scrollController.offset.toInt());
    });

    // final args =
    //     ModalRoute.of(context)!.settings.arguments as Map<String, String>;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    List<Widget> pages = [
      const AttractionOverview(),
      const AttractionReview(),
      const AttractionPhotos(),
      Column(
        children: [const Text("Community")],
      ),
    ];

    return Scaffold(
      body: Container(
        color: Colors.white,
        width: Helper.getScreenWidth(context),
        height: Helper.getScreenHeight(context),
        child: ListView(
          controller: _scrollController,
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          physics: const ClampingScrollPhysics(),
          children: [
            headerSection(context),
            // switchPageWidget(context),
            // pages[_currentSwitchPage]
            StickyHeader(
                header: switchPageWidget(context),
                content: pages[_currentSwitchPage])
          ],
        ),
      ),
    );
  }

  Widget switchPageWidget(BuildContext context) {
    return Column(
      children: [
        Container(
          height: _offsetScollY> 306?100:60,
          padding: EdgeInsets.only(top: _offsetScollY >306 ? 60.0:20.0),
          width: Helper.getScreenWidth(context),
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20.0), topLeft: Radius.circular(20.0))),
          child: Row(
            children: [
              buttonSwitchPage(
                  "Overview",
                  0,
                  () => setState(() {
                        _currentSwitchPage = 0;
                      })),
              buttonSwitchPage(
                  "Review",
                  1,
                  () => setState(() {
                        _currentSwitchPage = 1;
                      })),
              buttonSwitchPage(
                  "Photo",
                  2,
                  () => setState(() {
                        _currentSwitchPage = 2;
                      })),
              buttonSwitchPage(
                  "Community",
                  3,
                  () => setState(() {
                        _currentSwitchPage = 3;
                      }))
            ],
          ),
        ),
      ],
    );
  }

  Widget buttonSwitchPage(label, int page, GestureTapCallback func) {
    return Flexible(
      flex: 3,
      child: InkWell(
        onTap: func,
        splashColor: Colors.transparent,
        hoverColor: Colors.transparent,
        focusColor: Colors.transparent,
        highlightColor: Colors.transparent,
        child: SizedBox(
          width: Helper.getScreenWidth(context),
          height: 40,
          child: AppTheme.normalText(label,
              fontSize: 20.0,
              align: TextAlign.center,
              color: _currentSwitchPage == page ? Colors.black : Colors.grey),
        ),
      ),
    );
  }

  Stack headerSection(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: Helper.getScreenWidth(context),
          height: 280,
          child: Image.network(
              "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/17/ee/e6/a5/wat-arun-is-an-ancient.jpg?w=900&h=-1&s=1",
              fit: BoxFit.fitWidth,
              color: Colors.black.withOpacity(0.35),
              colorBlendMode: BlendMode.colorBurn),
        ),
        Positioned(
            top: 70,
            left: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () => Navigator.pop(context),
                  child: const Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                  ),
                ),
                const Vertical(50),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: AppTheme.titleHeader("Temple Of Dawn (Wat Arun)",
                      color: Colors.white),
                ),
                Padding(
                  padding: const EdgeInsets.all(2.5),
                  child: Row(
                    children: [
                      const Icon(Icons.location_pin, color: Colors.white),
                      AppTheme.normalText("Hanoi, Vietnam", color: Colors.white)
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(2.5),
                  child: AppTheme.normalText(
                      " Points of Interest & Landmarks • Religious Sites",
                      color: Colors.white),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 2.5, left: 5),
                  child: GetRatingStarWidget(
                    rating: 3.5,
                    color: Colors.white,
                    size: 25.0,
                  ),
                )
              ],
            ))
      ],
    );
  }
}

// color: Colors.black.withOpacity(0.45),
//                   colorBlendMode: BlendMode.overlay
