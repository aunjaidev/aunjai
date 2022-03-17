import 'package:aunjai/views/attraction/widget/opentime_widget.dart';
import 'package:aunjai/views/widgets/rating_widget.dart';
import 'package:aunjai/views/widgets/review_card.dart';
import 'package:aunjai/views/widgets/slide_horizontal_widget.dart';
import 'package:getwidget/getwidget.dart';
import 'package:aunjai/app_theme.dart';
import 'package:aunjai/utils/media_size.dart';
import 'package:aunjai/views/widgets/get_rating.dart';
import 'package:aunjai/views/widgets/horizontal.dart';
import 'package:aunjai/views/widgets/vertical.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:webview_flutter/webview_flutter.dart';

class AttractionScreen extends StatefulWidget {
  const AttractionScreen({Key? key}) : super(key: key);

  @override
  State<AttractionScreen> createState() => _AttractionScreenState();
}

class _AttractionScreenState extends State<AttractionScreen> {
  final List<String> _thumbnailPhoto = [
    "https://cdn.pixabay.com/photo/2017/12/03/18/04/christmas-balls-2995437_960_720.jpg",
    "https://cdn.pixabay.com/photo/2017/12/13/00/23/christmas-3015776_960_720.jpg",
    "https://cdn.pixabay.com/photo/2019/12/19/10/55/christmas-market-4705877_960_720.jpg",
    "https://cdn.pixabay.com/photo/2019/12/20/00/03/road-4707345_960_720.jpg",
    "https://cdn.pixabay.com/photo/2019/12/22/04/18/x-mas-4711785__340.jpg",
    "https://cdn.pixabay.com/photo/2016/11/22/07/09/spruce-1848543__340.jpg"
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
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GFAppBar(
        titleSpacing: -15.0,
        backgroundColor: AppTheme.primaryColor,
        leading: GFIconButton(
          hoverColor: Colors.transparent,
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
          onPressed: () {},
          type: GFButtonType.transparent,
        ),
        actions: <Widget>[
          GFIconButton(
            icon: const Icon(
              Icons.ios_share,
              color: Colors.white,
            ),
            onPressed: () {},
            type: GFButtonType.transparent,
          ),
          GFIconButton(
            icon: const Icon(
              Icons.bookmark_border,
              color: Colors.white,
            ),
            onPressed: () {},
            type: GFButtonType.transparent,
          ),
        ],
      ),
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
                      onPageChanged: (p) => setState(() {
                        _currentImage = p + 1;
                      }),
                      scrollPhysics: const ClampingScrollPhysics(),
                      itemCount: _thumbnailPhoto.length,
                      builder: (ctx, index) {
                        return PhotoViewGalleryPageOptions.customChild(
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
                      AppTheme.titleAppbar("Temple Of Dawn (Wat Arun)",
                          color: Colors.white),
                      const Vertical(10.0),
                      Row(
                        children: [
                          const Icon(Icons.location_pin,
                              color: Colors.white, size: 16),
                          AppTheme.normalText("Hanoi, Vietnam",
                              color: Colors.white, fontSize: 16)
                        ],
                      ),
                      const Vertical(10.0),
                      AppTheme.normalText(
                          " Points of Interest & Landmarks • Religious Sites",
                          color: Colors.white,
                          fontSize: 16),
                      const Vertical(10.0),
                      GetRatingStarWidget(
                        rating: 3.5,
                        color: Colors.white,
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
                      decoration: AppTheme.getDecoration(
                          color: Colors.white, borderRadius: 5.0),
                      child: Center(
                        child: AppTheme.normalText(
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
                      const Vertical(2.5),
                      AppTheme.contentHeader("About"),
                      AppTheme.normalContentText(
                          "A nice quaint cafe with a good view of the lower city and mountains. Good to visit even when cloudy or raining because they have a friendly pupper to keep guests company as you."),
                      const Vertical(2.5),
                      const OpenTimeWidget(),
                      const Vertical(2.5),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppTheme.contentHeader("Location"),
                          AppTheme.normalText(
                              '2 Sanamchai Road Grand Palace Subdistrict, Pranakorn District, Bangkok 10200'),
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 10.0),
                            decoration: AppTheme.getDecoration(
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
                                    decoration: AppTheme.getDecoration(
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
                          const SlideHorizontalWidget()
                        ],
                      ),
                      const Vertical(5),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              AppTheme.contentHeader("Reviews"),
                              GFButton(
                                child:
                                    AppTheme.buttonTextWidget("Write Review"),
                                onPressed: () {},
                                shape: GFButtonShape.pills,
                                size: 30.0,
                              ),
                            ],
                          ),
                          Vertical(5.0),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    "3.5",
                                    style: TextStyle(fontSize: 50.0),
                                  ),
                                  Vertical(5.0),
                                  Rating(
                                    rating: 3.5,
                                  ),
                                  Vertical(5.0),
                                  Text(
                                    "from 1000 reviews",
                                    style: TextStyle(fontSize: 14.0),
                                  ),
                                ],
                              ),
                              const Horizontal(15),
                              Expanded(
                                child: SizedBox(
                                  width: Helper.getScreenWidth(context),
                                  height: 80,
                                  child: Row(
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          AppTheme.normalText("Excellent"),
                                          AppTheme.normalText("VeryGood"),
                                          AppTheme.normalText("Average"),
                                          AppTheme.normalText("Poor"),
                                          AppTheme.normalText("Terrible"),
                                        ],
                                      ),
                                      Expanded(
                                        child: Column(
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
                      const Vertical(10.0),

                      ReviewCard()
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  getRatingProgressBar(percentage) {
    return Row(
      children: [
        Flexible(
          child: GFProgressBar(
            percentage: percentage,
            lineHeight: 5,
            alignment: MainAxisAlignment.spaceBetween,
            backgroundColor: Colors.black26,
            progressBarColor: GFColors.INFO,
          ),
          flex: 10,
        ),
        Flexible(flex: 2, child: AppTheme.normalText("95"))
      ],
    );
  }
}
