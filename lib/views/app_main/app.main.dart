import 'package:aunjai/constant/color_constant.dart';
import 'package:aunjai/constant/style_constant.dart';
import 'package:aunjai/utils/helper.dart';
import 'package:aunjai/utils/widgets/bottom_navigation_travelkuy.dart';
import 'package:aunjai/utils/widgets/media_carousel_horizontal.dart';
import 'package:aunjai/utils/widgets/vertical.dart';
import 'package:aunjai/views/app_main/attraction/attraction_home/attraction_home.dart';
import 'package:aunjai/views/app_main/attraction/attraction_home/widget/carouse_slide_widget.dart';
import 'package:flutter/material.dart';

class AppMain extends StatefulWidget {
  const AppMain({Key? key}) : super(key: key);

  @override
  State<AppMain> createState() => _AppMainState();
}

class _AppMainState extends State<AppMain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mBackgroundColor,
        title: const Text("App", style: TextStyle(color: Colors.black)),
        elevation: 0,
      ),
      body: SizedBox(
        width: Helper.getScreenWidth(context),
        height: Helper.getScreenHeight(context),
        child: ListView(
          physics: const ClampingScrollPhysics(),
          children: <Widget>[
            // Promos Section
            Padding(
              padding: const EdgeInsets.only(left: 16, bottom: 24),
              child: textContentTitle(
                'Hi, Franklin 👋 This Promos for You!',
              ),
            ),
            const CarouseSlideWidget(),
            // Service Section
            const Padding(
              padding: EdgeInsets.only(left: 16, top: 24, bottom: 12),
              child: Text(
                'Let\'s Booking!',
              ),
            ),
            Container(
              height: 100,
              width: Helper.getScreenWidth(context),
              margin: const EdgeInsets.only(left: 16, right: 16),
              child: Row(
                children: <Widget>[
                  buttonService(
                      label: "แหล่งเที่ยว", onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                        builder: (context) => const AttractionHome()));
                  }, icon: Icons.hiking),
                  buttonService(
                      label: "แหล่งกิน", onTap: () {}, icon: Icons.restaurant),
                  buttonService(
                      label: "แหล่งชุมชน", onTap: () {}, icon: Icons.hiking),
                  buttonService(
                      label: "แหล่งฝากร้าน", onTap: () {}, icon: Icons.hiking),
                ],
              ),
            ),

            // Popular Destination Section
            Padding(
              padding: const EdgeInsets.only(left: 16, top: 24, bottom: 12),
              child: textContentTitle('Popular Destinations!'),
            ),
            SizedBox(
              height: 140,
              child: ListView.builder(
                itemCount: 10,
                padding: const EdgeInsets.only(left: 16, right: 16),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
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
                              decoration: BoxDecoration(
                                color: mFillColor,
                                borderRadius: BorderRadius.circular(50),
                                border:
                                    Border.all(color: mBorderColor, width: 1),
                              ),
                            ),
                            const Text("Roi-et"),
                            const Text("Thailand")
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),


            const Vertical(10.0),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationAunJai(),
    );
  }

  Widget buttonService(
      {required String label,
      required GestureTapCallback onTap,
      required IconData icon}) {
    return Flexible(
      flex: 5,
      child: InkWell(
        onTap: onTap,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 5),
          height: 100,
          width: Helper.getScreenWidth(context) / 4.0,
          decoration: BoxDecoration(
            color: mFillColor,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: mBorderColor, width: 1),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: mFillColor,
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(color: mBorderColor, width: 1),
                ),
              ),
              Helper.widgetSpacePadding,
              Text(
                label,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
