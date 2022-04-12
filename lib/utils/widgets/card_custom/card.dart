import 'package:aunjai/constant/color_constant.dart';
import 'package:flutter/material.dart';

class CardCustom extends StatelessWidget {

  CardCustom({this.padding,this.width,this.height,required this.icon,this.widget, Key? key}) : super(key: key);
  double ?width,height;
  final Widget icon;
  List<Widget>? widget;
   EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Container(
        height: height??140,
        width: width??120,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: mBorderColor, width: 1),
        ),
        child: Padding(
          padding: padding ?? const EdgeInsets.only(top: 8.0, bottom: 16),
          child: Column(
            children: <Widget>[
              icon,

              Column(
                children: _getWidget(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _getWidget() {
    List<Widget> ws = [];

    for (var value in widget??[]) {
      ws.add(value);
    }
    return ws;
  }
}
