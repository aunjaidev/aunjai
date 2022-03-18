import 'package:aunjai/utils/text.common.dart';
import 'package:aunjai/utils/widgets/reviews/review_section.dart';
import 'package:aunjai/utils/widgets/widgets.common.dart';
import 'package:aunjai/views/attraction/widget/opentime_widget.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:aunjai/app_theme.dart';
import 'package:aunjai/utils/helper.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class AttractionScreen extends StatefulWidget {
  const AttractionScreen({Key? key}) : super(key: key);

  @override
  State<AttractionScreen> createState() => _AttractionScreenState();
}

class _AttractionScreenState extends State<AttractionScreen> {
  late PhotoViewController photoViewController;
  late PageController pageController;

  final List<String> _thumbnailPhoto = [
    "https://cdn.pixabay.com/photo/2017/12/03/18/04/christmas-balls-2995437_960_720.jpg",
    "https://cdn.pixabay.com/photo/2017/12/13/00/23/christmas-3015776_960_720.jpg",
    "https://cdn.pixabay.com/photo/2019/12/19/10/55/christmas-market-4705877_960_720.jpg",
    "https://cdn.pixabay.com/photo/2019/12/20/00/03/road-4707345_960_720.jpg",
    "https://cdn.pixabay.com/photo/2019/12/22/04/18/x-mas-4711785__340.jpg",
    "https://cdn.pixabay.com/photo/2016/11/22/07/09/spruce-1848543__340.jpg"
  ];

  final List<String> mentions = [
    "reclining buddha"
        "grand palace",
    "massage school",
    "entrance fee",
    "worth a visit",
    "thai massage",
    "temple",
    "pearl",
    "complex",
    "coins",
    "shoes",
    "wat",
    "baht",
    "architecture",
    "culture",
    "clothes"
  ];
  late int _currentImage = 1;

  // Future<void> getAlbum() async {
  //   HttpClient client = HttpClient();
  //   client.autoUncompress = true;
  //
  //   final HttpClientRequest request = await client.getUrl(
  //       Uri.parse("https://jsonplaceholder.typicode.com/albums/1/photos"));
  //   request.headers
  //       .set(HttpHeaders.contentTypeHeader, "application/json; charset=UTF-8");
  //   final HttpClientResponse response = await request.close();
  //
  //   final String content = await response.transform(utf8.decoder).join();
  //   final List data = json.decode(content);
  //
  //   for (var element in data) {
  //     _thumbnailPhoto.add(element["url"]);
  //   }
  //   setState(() {});
  // }

  // List<Widget> getPhotos() {
  //   List<Widget> widgets = [];
  //   for (var url in _thumbnailPhoto) {
  //     widgets.add(Container(
  //       padding: const EdgeInsets.all(2.50),
  //       width: 100,
  //       height: 100,
  //       child: ClipRRect(
  //           borderRadius: BorderRadius.circular(8.0),
  //           child: Image.network(
  //             url,
  //             fit: BoxFit.fitWidth,
  //           )),
  //     ));
  //   }
  //   return widgets;
  // }
  @override
  void initState() {
    // final args =
    //     ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    // getAlbum();

    super.initState();
    photoViewController = PhotoViewController();
    pageController = PageController();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WidgetsCommon.appBar(context, actions: []),
      body: Container(
        color: Colors.white,
        width: Helper.getScreenWidth(context),
        height: Helper.getScreenHeight(context),
        child: ListView(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          physics: const ClampingScrollPhysics(),
          children: [
            Stack(
              children: [
                SizedBox(
                    width: Helper.getScreenWidth(context),
                    height: 280,
                    child: PhotoViewGallery.builder(
                      pageController: pageController,
                      onPageChanged: (p) => setState(() {
                        _currentImage = p + 1;
                      }),
                      scrollPhysics: const ClampingScrollPhysics(),
                      itemCount: _thumbnailPhoto.length,
                      builder: (ctx, index) {
                        return PhotoViewGalleryPageOptions.customChild(
                          controller: photoViewController,
                          child: InkWell(
                            onTap: () {},
                            child: Stack(
                              children: [
                                Container(
                                  width: Helper.getScreenWidth(context),
                                  height: 280,
                                  decoration: BoxDecoration(
                                      // color: Colors.black.withOpacity(0.35),
                                      // colorBlendMode: BlendMode.colorBurn
                                      image: DecorationImage(
                                          fit: BoxFit.fill,
                                          image: NetworkImage(
                                              _thumbnailPhoto[index]))),
                                ),
                                Container(
                                  width: Helper.getScreenWidth(context),
                                  height: 300,
                                  decoration: BoxDecoration(
                                      color: Colors.black.withOpacity(0.5)),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    )),
                Positioned(
                  bottom: 25,
                  left: 25,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextCommon.contentHeader("Temple Of Dawn (Wat Arun)",
                          color: Colors.white),
                      WidgetsCommon.vertical(10.0),
                      Row(
                        children: [
                          const Icon(Icons.location_pin,
                              color: Colors.white, size: 16),
                          TextCommon.normalText("Hanoi, Vietnam",
                              color: Colors.white, fontSize: 16)
                        ],
                      ),
                      WidgetsCommon.vertical(10.0),
                      TextCommon.normalText(
                          " Points of Interest & Landmarks • Religious Sites",
                          color: Colors.white,
                          fontSize: 16),
                      WidgetsCommon.vertical(10.0),
                      WidgetsCommon.rating(
                        score: 3.5,
                        size: 25.0,
                      ),
                    ],
                  ),
                ),
                Positioned(
                    top: 20,
                    right: 10,
                    child: Container(
                      width: 50,
                      height: 25,
                      decoration: WidgetsCommon.decoration(
                          color: Colors.white, borderRadius: 5.0),
                      child: Center(
                        child: TextCommon.normalText(
                          '$_currentImage / ${_thumbnailPhoto.length}',
                          fontSize: 18.0,
                        ),
                      ),
                    ))
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      WidgetsCommon.vertical(2.5),
                      TextCommon.contentHeader("About"),
                      TextCommon.normalContentText(
                          "A nice quaint cafe with a good view of the lower city and mountains. Good to visit even when cloudy or raining because they have a friendly pupper to keep guests company as you."),
                      WidgetsCommon.vertical(2.5),
                      const OpenTimeWidget(),
                      WidgetsCommon.vertical(2.5),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextCommon.contentHeader("Location"),
                          TextCommon.normalText(
                              '2 Sanamchai Road Grand Palace Subdistrict, Pranakorn District, Bangkok 10200'),
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 10.0),
                            decoration: WidgetsCommon.decoration(
                                color: Colors.cyan, borderRadius: 10.0),
                            width: Helper.getScreenWidth(context),
                            height: 250,
                            child: Stack(
                              children: [
                                Positioned.fill(
                                    child: Align(
                                  alignment: Alignment.center,
                                  child: Container(
                                    width: 100,
                                    height: 50,
                                    decoration: WidgetsCommon.decoration(
                                        color: Colors.black.withOpacity(0.2),
                                        borderRadius: 5.0),
                                    child: Center(
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: const [
                                            Icon(Icons.fullscreen),
                                            Text("ดูแผนที่")
                                          ]),
                                    ),
                                  ),
                                ))
                              ],
                            ),
                          ),
                          const MediaCarouselHorizontalWidget()
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextCommon.contentHeader("Popular mentions"),
                          SizedBox(
                            height: 50,
                            width: Helper.getScreenWidth(context),
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: getMentionWidgets(),
                            ),
                          )
                        ],
                      ),
                      WidgetsCommon.vertical(15),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextCommon.contentHeader("Reviews"),
                          WidgetsCommon.vertical(5.0),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Column(
                                children: [
                                  const Text(
                                    "3.5",
                                    style: TextStyle(fontSize: 50.0),
                                  ),
                                  WidgetsCommon.vertical(5.0),
                                  WidgetsCommon.rating(
                                    score: 3.5,
                                  ),
                                  WidgetsCommon.vertical(5.0),
                                  Container(
                                      width: 100,
                                      child: TextCommon.normalText(
                                          "from 100000000",
                                          align: TextAlign.center,
                                          fontSize: 14))
                                ],
                              ),
                              WidgetsCommon.horizontal(15),
                              Expanded(
                                child: SizedBox(
                                  width: Helper.getScreenWidth(context),
                                  height: 100,
                                  child: Row(
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          TextCommon.normalText("Excellent"),
                                          TextCommon.normalText("VeryGood"),
                                          TextCommon.normalText("Average"),
                                          TextCommon.normalText("Poor"),
                                          TextCommon.normalText("Terrible"),
                                        ],
                                      ),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            getRatingProgressBar(0.1),
                                            getRatingProgressBar(0.5),
                                            getRatingProgressBar(0.2),
                                            getRatingProgressBar(0.9),
                                            getRatingProgressBar(1.0),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                      WidgetsCommon.vertical(30.0),
                      Row(
                        children: [
                          Flexible(
                              child: WidgetsCommon.button(context,
                                  label: "Write Review", onTap: () {}))
                        ],
                      ),
                      const ReviewSection()
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.home),
            label: 'เพิ่มรูปภาพ',
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.infoCircle),
            label: 'รีวิว',
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.userAlt),
            label: 'เช็คอิน',
          ),
        ],
        // currentIndex: _selectedIndex,
        // onTap: _onItemTapped,
      ),
    );
  }

  getRatingProgressBar(percentage) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Flexible(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            child: WidgetsCommon.progressbar(95),
          ),
          flex: 10,
        ),
        Flexible(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              child: TextCommon.normalText("95"),
            ))
      ],
    );
  }

  List<Widget> getMentionWidgets() {
    List<Widget> widgets = [];
    for (var label in mentions) {
      widgets.add(Container(
        margin: const EdgeInsets.all(5.0),
        height: 35,
        padding: const EdgeInsets.symmetric(vertical: 2.5, horizontal: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: Colors.white,
          boxShadow: [
            const BoxShadow(color: Colors.grey, spreadRadius: 1.5),
          ],
        ),
        child: Center(
          child: InkWell(
            child: TextCommon.normalText(label),
          ),
        ),
      ));
    }
    return widgets;
  }
}
