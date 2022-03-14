import 'package:aunjai/app_theme.dart';
import 'package:aunjai/utils/media_size.dart';
import 'package:aunjai/views/widgets/get_rating.dart';
import 'package:aunjai/views/widgets/vertical.dart';
import 'package:flutter/material.dart';

class AttractionScreen extends StatefulWidget {
  const AttractionScreen({Key? key}) : super(key: key);

  @override
  State<AttractionScreen> createState() => _AttractionScreenState();
}

class _AttractionScreenState extends State<AttractionScreen> {
  late int _currentSwitchPage = 0;
  @override
  Widget build(BuildContext context) {
    // final args =
    //     ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    List<Widget> pages = [
      Column(
        children: [Text("About")],
      ),
      Column(
        children: [Text("Review")],
      ),
      Column(
        children: [Text("Photo")],
      ),
      Column(
        children: [Text("Community")],
      ),
    ];
    return Scaffold(
      body: SizedBox(
        width: Helper.getScreenWidth(context),
        height: Helper.getScreenHeight(context),
        child: ListView(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          physics: const ClampingScrollPhysics(),
          children: [
            headerSection(context),
            switchPageWidget(context),
            pages[_currentSwitchPage]
          ],
        ),
      ),
    );
  }

  Widget switchPageWidget(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      width: Helper.getScreenWidth(context),
      height: 50,
      child: ListView(
        scrollDirection: Axis.horizontal,
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
    );
  }

  Widget buttonSwitchPage(label, int page, GestureTapCallback func) {
    return InkWell(
      onTap: func,
      splashColor: Colors.transparent,
      hoverColor: Colors.transparent,
      focusColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: SizedBox(
        width: Helper.getScreenWidth(context) / 4,
        child: Column(
          children: [
            AppTheme.normalText(label, fontSize: 18.0),
            const Vertical(5),
            _currentSwitchPage == page
                ? const Divider(
                    color: AppTheme.primaryColor,
                    thickness: 2.5,
                  )
                : const SizedBox()
          ],
        ),
      ),
    );
  }

  Stack headerSection(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: Helper.getScreenWidth(context),
          height: 300,
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
                backbutton(),
                const Vertical(50),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: AppTheme.titleHeader("Temple Of Dawn (Wat Arun)",
                      color: Colors.white),
                ),
                Padding(
                  padding: const EdgeInsets.all(2.5),
                  child: addresswidget(),
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

  Row addresswidget() {
    return Row(
      children: [
        const Icon(Icons.location_pin, color: Colors.white),
        AppTheme.normalText("Hanoi, Vietnam", color: Colors.white)
      ],
    );
  }

  InkWell backbutton() {
    return InkWell(
      onTap: () => Navigator.pop(context),
      child: const Icon(
        Icons.arrow_back_ios,
        color: Colors.white,
      ),
    );
  }
}


// color: Colors.black.withOpacity(0.45),
//                   colorBlendMode: BlendMode.overlay