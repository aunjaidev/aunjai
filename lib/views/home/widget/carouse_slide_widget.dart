 import 'package:flutter/material.dart';
import 'package:aunjai/utils/app_theme.dart';
import 'package:aunjai/mock/carousel_model.dart';
import 'package:aunjai/utils/helper.dart';

class CarouseSlideWidget extends StatefulWidget {
  const CarouseSlideWidget({Key? key}) : super(key: key);

  @override
  State<CarouseSlideWidget> createState() => _CarouseSlideWidgetState();
}

class _CarouseSlideWidgetState extends State<CarouseSlideWidget> {

  late int currentSlider = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Helper.getScreenWidth(context),
      height: 220,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
              flex: 3,
              child: PageView.builder(
                  onPageChanged: (value) {
                    setState(() {
                      currentSlider = value;
                    });
                  },
                  controller:
                  PageController(viewportFraction: 0.95, initialPage: 0),
                  itemCount: carousels.length,
                  itemBuilder: (context, index) => Container(
                    padding: const EdgeInsets.only(left: 5, right: 5),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15.0),
                      child: Image.asset(
                        carousels[index].image,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ))),
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 2.5),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: List.generate(
                  carousels.length, (index) => buildDotNav(index: index)),
            ),
          )
        ],
      ),
    );
  }

  AnimatedContainer buildDotNav({required int index}) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 100),
      margin: const EdgeInsets.only(right: 5),
      height: 5,
      width: currentSlider == index ? 25 : 7,
      decoration: BoxDecoration(
          color: currentSlider == index
              ? AppTheme.primary1
              : AppTheme.primary1.withAlpha(70),
          borderRadius: BorderRadius.circular(3)),
    );
  }
}
