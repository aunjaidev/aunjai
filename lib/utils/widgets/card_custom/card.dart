import 'package:aunjai/constant/color_constant.dart';
import 'package:flutter/material.dart';

class CardCustom extends StatelessWidget {
  CardCustom({this.icon,this.widget, Key? key}) : super(key: key);
  Widget ?icon;
  List<Widget>? widget;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Container(
        height: 140,
        width: 120,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: mBorderColor, width: 1),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 8.0, bottom: 16),
          child: Column(
            children: <Widget>[
              Container(
                width: 60,
                height: 60,
                margin: const EdgeInsets.symmetric(vertical: 10.0),
                child: icon,
                decoration: BoxDecoration(
                  color: mFillColor,
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(color: mBorderColor, width: 1),
                ),
              ),
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
