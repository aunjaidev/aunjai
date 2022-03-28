 import 'package:aunjai/constant/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:aunjai/mock/carousel_model.dart';
import 'package:aunjai/utils/helper.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class CarouseSlideWidget extends StatefulWidget {
  const CarouseSlideWidget({Key? key}) : super(key: key);

  @override
  State<CarouseSlideWidget> createState() => _CarouseSlideWidgetState();
}

class _CarouseSlideWidgetState extends State<CarouseSlideWidget> {

  late int _currentSlider = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: Helper.layoutPadding),
      width: Helper.getScreenWidth(context),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 210,
            child: Swiper(
              onIndexChanged: (index) {
                setState(() {
                  _currentSlider = index;
                });
              },
              autoplay: true,
              layout: SwiperLayout.DEFAULT,
              itemCount: carousels.length,
              itemBuilder: (BuildContext context, index) {
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: DecorationImage(
                        image: AssetImage(
                          carousels[index].image,
                        ),
                        fit: BoxFit.cover),
                  ),
                );
              },
            ),
          ),
          Helper.widgetSpacePadding,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: List.generate(
                    carousels.length, (index) => buildDotNav(index: index)),
              ),
              const Text(
                'More...',
              )
            ],
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
      width: _currentSlider == index ? 25 : 7,
      decoration: BoxDecoration(
          color: _currentSlider == index
              ? primary1
              : primary1.withAlpha(70),
          borderRadius: BorderRadius.circular(3)),
    );
  }
}
