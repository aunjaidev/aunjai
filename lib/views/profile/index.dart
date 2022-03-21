import 'package:aunjai/utils/app_theme.dart';
import 'package:aunjai/utils/helper.dart';
import 'package:aunjai/utils/text.common.dart';
import 'package:aunjai/utils/widgets/appbar.dart';
import 'package:aunjai/utils/widgets/horizontal.dart';
import 'package:aunjai/utils/widgets/vertical.dart';
import 'package:aunjai/views/profile/drawer/index.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => ProfileState();
}

class ProfileState extends State<Profile> {
  late int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerCustom.add(),
      appBar: appBar(context,
          backColor: Colors.white,
          leading: InkWell(
            child: Icon(
              Icons.menu,
              color: AppTheme.primary2,
            ),
            onTap: () {},
          ),
          actions: [
            Container(
              width: 50,
              height: 50,
              margin: EdgeInsets.symmetric(horizontal: 15.0),
              child: InkWell(
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
                onTap: () {
                  print("x");
                },
                child: Icon(
                  Icons.search,
                  color: AppTheme.primary2,
                ),
              ),
            )
          ]),
      body: SizedBox(
        height: Helper.getScreenHeight(context),
        width: Helper.getScreenWidth(context),
        child: ListView(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          physics: const ClampingScrollPhysics(),
          children: [
            SizedBox(
              height: 190,
              width: Helper.getScreenWidth(context),
              child: Stack(
                children: [
                  Container(
                    height: 120,
                    width: Helper.getScreenWidth(context),
                    color: AppTheme.primary2,
                  ),
                  Positioned(
                    bottom: 0,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Row(
                        children: [
                          CircleAvatar(
                            child: ClipOval(
                              child: Image.network(
                                "https://via.placeholder.com/150/92c952",
                                fit: BoxFit.fill,
                              ),
                            ),
                            backgroundColor: Colors.transparent,
                            radius: 50,
                          ),
                          Horizontal(10.0),
                          TextCommon.normalText("Nattapon .K",
                              fontWeight: FontWeight.w600, fontSize: 22.0)
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Vertical(15.0),
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
                  child: TextCommon.normalText(label,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w400,
                      color: _currentPage == order
                          ? AppTheme.primary2
                          : AppTheme.primary3,
                      align: TextAlign.center),
                ),
              ),
              _currentPage == order
                  ? Divider(
                      color: AppTheme.primary2,
                    )
                  : Divider(
                      color: AppTheme.primary3,
                    )
            ],
          ),
        ));
  }
}
