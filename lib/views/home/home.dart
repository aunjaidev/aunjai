import 'package:flutter/material.dart';
import 'package:aunjai/app_theme.dart';
import 'package:aunjai/utils/media_size.dart';
import 'package:aunjai/views/home/widget/carouse_slide_widget.dart';
import 'package:aunjai/views/home/widget/home_headbar.dart';
import 'package:aunjai/views/home/widget/main_menu_widget.dart';
import 'package:aunjai/views/widgets/slide_horizontal_widget.dart';

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
          children: [
            Container(
              height: 300,
              width: Helper.getScreenWidth(context),
              margin: const EdgeInsets.only(bottom: AppTheme.layoutPadding),
              child: Stack(
                children: const [
                  Positioned(
                    child: HomeHeaderBar(),
                  ),
                  Positioned(bottom: 0, child: MainMenuWidget())
                ],
              ),
            ),
            const CarouseSlideWidget(),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: AppTheme.layoutPadding),
              child: Column(children: [const SlideHorizontalWidget()]),
            )
          ],
        ));
  }
}
