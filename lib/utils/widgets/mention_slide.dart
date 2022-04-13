import 'package:aunjai/constant/color_constant.dart';
import 'package:aunjai/constant/style_constant.dart';
import 'package:aunjai/model/mention_model.dart';
import 'package:aunjai/utils/helper.dart';
import 'package:aunjai/utils/widgets/vertical.dart';
import 'package:flutter/material.dart';

class MentionSlide extends StatelessWidget {
  Map<String, MentionModel>? mentionList;

  MentionSlide(this.mentionList, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (mentionList != null) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          textContentTitle("Read Reviews That Mention:"),
          const Vertical(10.0),
          SizedBox(
              width: Helper.getScreenWidth(context),
              height: 35.0,
              child: ListView(
                children: _buildWidget(),
                scrollDirection: Axis.horizontal,
              )),

        ],
      );
    }

    return const SizedBox();
  }

  InkWell buildButton(label, onTap) {
    return InkWell(
          onTap: onTap,
          child: Container(
            margin: EdgeInsets.only(right: 8.0,bottom: 8.0),
            decoration: BoxDecoration(
                color: primary3.withOpacity(0.25),
                borderRadius: BorderRadius.all(Radius.circular(15.0))),
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
            child: normalText(label,fontSize: 14.0),
          ),
        );
  }

  _buildWidget() {
    int _count =0;
    List<Widget> widgets = [];

    mentionList?.forEach((key, value) {
      if(_count > 5) {
        return;
      }
      widgets.add(buildButton(value.labelEn, (){
        print(value.id);
      }));


      _count ++;
    });

    if(mentionList!.length >5){
      widgets.add(buildButton("ดูเพิ่มเติม", (){}));
    }
    return widgets;
  }
}
