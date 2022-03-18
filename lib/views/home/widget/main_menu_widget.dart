import 'package:aunjai/utils/text.common.dart';
import 'package:aunjai/utils/widgets/widgets.common.dart';
import 'package:flutter/material.dart';
import 'package:aunjai/app_theme.dart';
import 'package:aunjai/utils/helper.dart';

class MainMenuWidget extends StatelessWidget {
  const MainMenuWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      padding: const EdgeInsets.symmetric(horizontal: Helper.layoutPadding),
      width: Helper.getScreenWidth(context),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            children: [
              _buildBtn(context),
              WidgetsCommon.horizontal(5.0),
              _buildBtn(context),
            ],
          ),
          Row(
            children: [
              _buildBtn(context),
              WidgetsCommon.horizontal(5.0),
              _buildBtn(context),
            ],
          ),
        ],
      ),
    );
  }

  _buildBtn(context) {
    return Flexible(
      flex: 5,
      child: Container(
          width: Helper.getScreenWidth(context),
          height: 70,
          margin: const EdgeInsets.symmetric(vertical: 5.0),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: Color.fromRGBO(75, 173, 115, 0.20000000298023224),
          ),
          child: Row(
            children: [
              Container(
                  width: 55,
                  height: 55,
                  margin: const EdgeInsets.symmetric(horizontal: 10.0),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    color: Color.fromRGBO(196, 196, 196, 1),
                  )),
              Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text('Travel', textAlign: TextAlign.left),
                    Text(
                      'asdddddd',
                      textAlign: TextAlign.left,
                      style: TextCommon.subtitle,
                    ),
                  ]),
            ],
          )),
    );
  }
}
