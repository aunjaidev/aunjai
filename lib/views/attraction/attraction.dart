import 'package:aunjai/utils/app_theme.dart';
import 'package:aunjai/utils/text.common.dart';
import 'package:aunjai/utils/widgets/appbar.dart';
import 'package:aunjai/utils/widgets/decoration.dart';
import 'package:aunjai/utils/widgets/get_rating_star.dart';
import 'package:aunjai/utils/widgets/horizontal.dart';
import 'package:aunjai/utils/widgets/media_carousel_horizontal.dart';
import 'package:aunjai/utils/widgets/progressbar.dart';
import 'package:aunjai/utils/widgets/reviews/review_section.dart';
import 'package:aunjai/utils/widgets/opentime_widget.dart';
import 'package:aunjai/utils/widgets/vertical.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
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
      appBar: appBar(context, actions: []),
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
                      const Vertical(10.0),
                      Row(
                        children: [
                          const Icon(Icons.location_pin,
                              color: Colors.white, size: 16),
                          TextCommon.normalText("Hanoi, Vietnam",
                              color: Colors.white, fontSize: 16)
                        ],
                      ),
                      const Vertical(10.0),
                      TextCommon.normalText(
                          " Points of Interest & Landmarks • Religious Sites",
                          color: Colors.white,
                          fontSize: 16),
                      const Vertical(10.0),
                      ratingStar(
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
                      decoration:
                          decoration(color: Colors.white, borderRadius: 5.0),
                      child: Center(
                        child: TextCommon.normalText(
                          '$_currentImage / ${_thumbnailPhoto.length}',
                          fontSize: 18.0,
                        ),
                      ),
                    ))
              ],
            ),
            getAboutContent(),
            const Padding(
              padding:  EdgeInsets.only(left: 10,),
              child:  MediaCarouselHorizontalWidget(),
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

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [



                    const Vertical(15),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextCommon.contentHeader("Reviews"),
                        const Vertical(5.0),
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
                                const Vertical(5.0),
                                ratingStar(
                                  score: 3.5,
                                ),
                                const Vertical(5.0),
                                Container(
                                    width: 100,
                                    child: TextCommon.normalText(
                                        "from 100000000",
                                        align: TextAlign.center,
                                        fontSize: 14))
                              ],
                            ),
                            const Horizontal(15),
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
                    const Vertical(30.0),
                    Center(
                      child: Column(
                        children: [
                          CircleAvatar(),
                          TextCommon.normalText("ให้คะแนนสำหรับสถานที่นี้"),
                          RatingBar.builder(
                            initialRating: 0,
                            minRating: 0,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            unratedColor: Colors.black12,
                            glow: false,
                            itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                            itemBuilder: (context, _) => const Icon(
                              Icons.star,
                              color: AppTheme.primary1,
                            ),
                            onRatingUpdate: (rating) {
                              print(rating);
                            },
                          )
                        ],
                      ),
                    ),
                    const ReviewSectionWithMore()
                  ],
                ),
              ],
            )
          ],
        ),
      ),
      bottomSheet: Container(
        width: Helper.getScreenWidth(context),
        height: 60,
        color: Colors.transparent,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            getActivitiesButton(icon: Icons.star_rate,label: "Add Photo"),
            getActivitiesButton(icon: Icons.reviews,label: "Review"),
            getActivitiesButton(icon: Icons.my_location,label: "Check-In")
          ],
        ),
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
            child: progressbar(95),
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

  getActivitiesButton({required IconData icon,required String label}) {
    return Flexible(
      flex: 5,
      child: InkWell(
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 5),
          width: Helper.getScreenWidth(context),
          height: 50,
          child: Container(
            decoration:
                decoration(color: AppTheme.primary1, borderRadius: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  color: Colors.white,
                ),
                const Horizontal(5.0),
                TextCommon.normalText(label, color: Colors.white)
              ],
            ),
          ),
        ),
      ),
    );
  }

  getLocationMap() {
    return  Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      decoration: decoration(
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
                  decoration: decoration(
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
    );
  }

  getAboutContent() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Vertical(2.5),
          TextCommon.contentHeader("About"),
          TextCommon.normalContentText(
              "A nice quaint cafe with a good view of the lower city and mountains. Good to visit even when cloudy or raining because they have a friendly pupper to keep guests company as you."),
          const Vertical(2.5),
          const OpenTimeWidget(),
          const Vertical(2.5),
          TextCommon.contentHeader("Location"),
          TextCommon.normalText(
              '2 Sanamchai Road Grand Palace Subdistrict, Pranakorn District, Bangkok 10200'),
          getLocationMap(),
        ],
      ),
    );
  }
}
