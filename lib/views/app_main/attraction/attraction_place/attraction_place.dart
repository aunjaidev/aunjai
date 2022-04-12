import 'package:aunjai/constant/color_constant.dart';
import 'package:aunjai/constant/style_constant.dart';
import 'package:aunjai/core/map_utils.dart';
import 'package:aunjai/utils/widgets/appbar.dart';
import 'package:aunjai/utils/widgets/decoration.dart';
import 'package:aunjai/utils/widgets/get_rating_star.dart';
import 'package:aunjai/utils/widgets/horizontal.dart';
import 'package:aunjai/utils/widgets/media_carousel_horizontal.dart';
import 'package:aunjai/utils/widgets/opentime_widget.dart';
import 'package:aunjai/utils/widgets/vertical.dart';
import 'package:aunjai/utils/helper.dart';
import 'package:aunjai/views/app_main/attraction/attraction_place/widgets/about_section.dart';
import 'package:aunjai/views/app_main/attraction/attraction_place/widgets/review_section.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class AttractionPlaceScreen extends StatefulWidget {
  const AttractionPlaceScreen({Key? key}) : super(key: key);

  @override
  State<AttractionPlaceScreen> createState() => _AttractionPlaceScreenState();
}

class _AttractionPlaceScreenState extends State<AttractionPlaceScreen> {
  late PhotoViewController photoViewController;
  late PageController pageController;
  final ScrollController _controller = ScrollController();

  final GlobalKey aboutKey = GlobalKey(debugLabel: "aboutKey");
  final GlobalKey reviewKey = GlobalKey(debugLabel: "reviewKey");

  late int _currentImage = 1;
  late int _scrollPositionX = 0;

  final List<String> _thumbnailPhoto = [
    "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/1c/c2/78/15/caption.jpg?w=1200&h=-1&s=1",
    "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/1c/c2/79/27/caption.jpg?w=1200&h=-1&s=1",
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

    _controller.addListener(() {
      _scrollPositionX = _controller.offset.toInt();
      print(_scrollPositionX);
      // setState(() {});
    });

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
      appBar: null,
      body: SizedBox(
        width: Helper.getScreenWidth(context),
        height: Helper.getScreenHeight(context),
        child: ListView(
          controller: _controller,
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          physics: const ClampingScrollPhysics(),
          children: [
            Stack(
              children: [
                SizedBox(
                  height: 300.0,
                  width: Helper.getScreenWidth(context),
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
                                height: 300,
                                decoration: BoxDecoration(
                                    // color: Colors.black.withOpacity(0.35),
                                    // colorBlendMode: BlendMode.colorBurn
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: NetworkImage(
                                            _thumbnailPhoto[index]))),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Positioned(
                  top: 20,
                  left: 20,
                  right: 20,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25.0),
                          color: Colors.black.withOpacity(0.5),
                        ),
                        child: const InkWell(
                          child: Center(
                            child: Icon(
                              Icons.arrow_back,
                              size: 30.0,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25.0),
                          color: Colors.black.withOpacity(0.5),
                        ),
                        child: const InkWell(
                          child: Center(
                            child: Icon(
                              Icons.favorite_border,
                              size: 30.0,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                    bottom: 20,
                    right: 20,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        color: Colors.black.withOpacity(0.5),
                      ),
                      padding: const EdgeInsets.symmetric(
                          vertical: 5.0, horizontal: 5.0),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.photo_library_sharp,
                            color: Colors.white,
                          ),
                          const Horizontal(5.0),
                          normalText(
                              '$_currentImage / ${_thumbnailPhoto.length}',
                              color: Colors.white,
                              fontSize: 16.0,
                              fontWeight: FontWeight.w500)
                        ],
                      ),
                    ))
              ],
            ),
            SizedBox(
              width: Helper.getScreenWidth(context),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AboutSection(aboutKey: aboutKey),
                  ReviewSection(reviewKey: reviewKey),
                  MediaCarouselHorizontalWidget(
                    label: "บทความแนะนำ",
                  ),
                  MediaCarouselHorizontalWidget(
                    label: "สถานที่ท่องเที่ยวในบริเวณใกล้เคียง ",
                  )
                ],
              ),
            )
          ],
        ),
      ),
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
            child: normalText(label),
          ),
        ),
      ));
    }
    return widgets;
  }

  getActivitiesButton({required IconData icon, required String label}) {
    return Flexible(
      flex: 5,
      child: InkWell(
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 5),
          width: Helper.getScreenWidth(context),
          height: 50,
          child: Container(
            decoration: decoration(color: primary1, borderRadius: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  color: Colors.white,
                ),
                const Horizontal(5.0),
                normalText(label, color: Colors.white)
              ],
            ),
          ),
        ),
      ),
    );
  }

}
