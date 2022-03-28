import 'package:aunjai/constant/color_constant.dart';
import 'package:aunjai/constant/style_constant.dart';
import 'package:aunjai/utils/helper.dart';
import 'package:aunjai/utils/widgets/appbar.dart';
import 'package:aunjai/utils/widgets/vertical.dart';
import 'package:aunjai/views/app_main/profile/drawer/index.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => ProfileState();
}

class ProfileState extends State<Profile> {
  late int _currentPage = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: appBar(context,
          backColor: Colors.white,
          leading: InkWell(
            child: const Icon(
              Icons.menu,
              color: primary2,
            ),
            onTap: () {
              _scaffoldKey.currentState!.openDrawer();
            },
          ),
          actions: [
            Container(
              width: 50,
              height: 50,
              margin: const EdgeInsets.symmetric(horizontal: 15.0),
              child: InkWell(
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
                onTap: () {
                  print("x");
                },
                child: const Icon(
                  Icons.search,
                  color: primary2,
                ),
              ),
            )
          ]),
      drawer: DrawerCustom.add(),
      body: ListView(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        children: [
          Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.bottomCenter,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      height: 150.0,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                  'https://www.sageisland.com/wp-content/uploads/2017/06/beat-instagram-algorithm.jpg'))),
                    ),
                  )
                ],
              ),
              Positioned(
                top: 50.0,
                child: Container(
                  height: 190.0,
                  width: 190,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: const DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                            'http://cdn.ppcorn.com/us/wp-content/uploads/sites/14/2016/01/Mark-Zuckerberg-pop-art-ppcorn.jpg'),
                      ),
                      border: Border.all(color: Colors.white, width: 6.0)),
                ),
              ),
            ],
          ),
          const Vertical(100),
          Center(
            child: normalText("Nattapon Kongnariang",
                fontWeight: FontWeight.w600, fontSize: 30.0),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: SizedBox(
              width: Helper.getScreenWidth(context),
              child: Row(
                children: [
                  button("Follow", () {}),
                  button("Message", () {}, btnColor: primary3)
                ],
              ),
            ),
          ),
          SizedBox(
            child: Column(
              children: [
                Row(
                  children: [],
                )
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buttonSwapPage("Feed", 0),
              buttonSwapPage("Trips", 1),
              buttonSwapPage("Photos", 2),
              buttonSwapPage("Reviews", 3),
            ],
          ),
        ],
      ),
    );
  }

  Flexible button(label, func, {Color? btnColor}) {
    return Flexible(
      flex: 5,
      child: InkWell(
        onTap: func,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 15.0),
          width: double.infinity,
          height: 40.0,
          decoration: BoxDecoration(
              color: btnColor ?? primary1,
              borderRadius: const BorderRadius.all( Radius.circular(5.0))),
          child: Center(
              child: normalText(label,
                  fontSize: 18.0, fontWeight: FontWeight.w500)),
        ),
      ),
    );
  }

  buttonSwapPage(label, order) {
    return Flexible(
        flex: 5,
        child: InkWell(
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          onTap: () {
            _currentPage = order;
            setState(() {});
          },
          child: Column(
            children: [
              SizedBox(
                height: 50,
                width: Helper.getScreenWidth(context) / 4,
                child: Center(
                  child: normalText(label,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w400,
                      color: _currentPage == order
                          ? primary2
                          : primary3,
                      align: TextAlign.center),
                ),
              ),
              _currentPage == order
                  ? const Divider(
                      color: primary2,
                    )
                  : const Divider(
                      color: primary3,
                    )
            ],
          ),
        ));
  }
}
