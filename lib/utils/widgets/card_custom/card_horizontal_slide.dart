import 'package:aunjai/constant/style_constant.dart';
import 'package:aunjai/utils/helper.dart';
import 'package:aunjai/utils/widgets/card_custom/card.dart';
import 'package:flutter/material.dart';

class CardHorizontalSlide extends StatelessWidget {
  const CardHorizontalSlide({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: Helper.layoutPadding),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Popular Destinations',
                style: customStyle(
                    fontSize: 18.0,
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
                        "more ...",
                        style: customStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w300,
                            color: Colors.black),
                      ),

                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        Helper.widgetSpacePadding,
        SizedBox(
            width: Helper.getScreenWidth(context),
            height: 140.0,
          child:  ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: (ctx, index) {
              return CardCustom(
                icon: Icon(Icons.ac_unit),
                  widget: [
                    const Text("Roi-et"),
                    const Text("Thailand")
                  ],
              );
            },
            itemCount: 10,
          ),
        )
      ],
    );
  }
}
