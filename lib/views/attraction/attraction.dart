import 'dart:convert';
import 'dart:io';

import 'package:aunjai/app_theme.dart';
import 'package:aunjai/utils/media_size.dart';
import 'package:aunjai/views/widgets/get_rating.dart';
import 'package:aunjai/views/widgets/horizontal.dart';
import 'package:aunjai/views/widgets/vertical.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:webview_flutter/webview_flutter.dart';

class AttractionScreen extends StatefulWidget {
  const AttractionScreen({Key? key}) : super(key: key);

  @override
  State<AttractionScreen> createState() => _AttractionScreenState();
}

class _AttractionScreenState extends State<AttractionScreen> {
  final List<String> _thumbnailPhoto = [];

  Future<void> getAlbum() async {
    HttpClient client = HttpClient();
    client.autoUncompress = true;

    final HttpClientRequest request = await client.getUrl(
        Uri.parse("https://jsonplaceholder.typicode.com/albums/1/photos"));
    request.headers
        .set(HttpHeaders.contentTypeHeader, "application/json; charset=UTF-8");
    final HttpClientResponse response = await request.close();

    final String content = await response.transform(utf8.decoder).join();
    final List data = json.decode(content);

    var d = data.sublist(0, 4);
    for (var element in d) {
      _thumbnailPhoto.add(element["url"]);
    }
    setState(() {});
  }

  @override
  void initState() {
    // final args =
    //     ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    getAlbum();
    super.initState();
  }

  List<Widget> getPhotos() {
    List<Widget> widgets = [];
    for (var url in _thumbnailPhoto) {
      widgets.add(Container(
        padding: const EdgeInsets.all(2.50),
        width: 100,
        height: 100,
        child: ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.network(
              url,
              fit: BoxFit.fitWidth,
            )),
      ));
    }

    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        width: Helper.getScreenWidth(context),
        height: Helper.getScreenHeight(context),
        child: ListView(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          physics: const ClampingScrollPhysics(),
          children: [
            headerSection(context),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppTheme.contentHeader("About"),
                  AppTheme.normalContentText(
                      "A nice quaint cafe with a good view of the lower city and mountains. Good to visit even when cloudy or raining because they have a friendly pupper to keep guests company as you."),
                  const Vertical(10),
                  getOpenTimeWidget(),
                  const Vertical(10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          AppTheme.contentHeader("Photos"),
                          InkWell(
                            onTap: () {},
                            child: AppTheme.normalText("All Photos",
                                fontSize: 16.0, fontWeight: FontWeight.w400),
                          )
                        ],
                      ),
                      SizedBox(
                        width: Helper.getScreenWidth(context),
                        height: 100,
                        child: Row(children: getPhotos()),
                      ),
                      const Vertical(10),
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              AppTheme.contentHeader("Location"),
                              Row(
                                children: [
                                  Icon(
                                    Icons.near_me_sharp,
                                    size: 18,
                                  ),
                                  AppTheme.normalText("12.k",
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w400)
                                ],
                              )
                            ],
                          ),
                          Container(
                              color: Colors.transparent,
                              height: 200,
                              width: Helper.getScreenWidth(context),
                              child: Stack(
                                children: [
                                  Positioned(
                                    child: WebView(
                                      initialUrl: Uri.dataFromString(
                                              '<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d15336.581080757918!2d103.64784909999999!3d16.057949649999998!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3117fe7454e1758d%3A0x1c7acfbdf4a30f32!2sRoi%20Et%20Golf%20Club!5e0!3m2!1sen!2sth!4v1647272821553!5m2!1sen!2sth" width="1500" height="700" style="style="position:fixed; top:0; left:0; bottom:0; right:0; width:100%; height:100%; border:none; margin:0; padding:0; overflow:hidden; z-index:999999;"" allowfullscreen="true" loading="lazy"></iframe>',
                                              mimeType: 'text/html')
                                          .toString(),
                                      javascriptMode:
                                          JavascriptMode.unrestricted,
                                    ),
                                  ),
                                  Positioned(
                                      top: 50,
                                      child: Container(
                                        height: 50,

                                        width:
                                            Helper.getScreenWidth(context) / 2,
                                        child: Center(
                                            child: AppTheme.normalText(
                                                "navigate")),
                                      )),
                                ],
                              )),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
            // switchPageWidget(context),
            // pages[_currentSwitchPage]
            // StickyHeader(
            // header: switchPageWidget(context),
            // content: pages[_currentSwitchPage])
          ],
        ),
      ),
    );
  }

  Stack headerSection(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: Helper.getScreenWidth(context),
          height: 280,
          child: Image.network(
              "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/17/ee/e6/a5/wat-arun-is-an-ancient.jpg?w=900&h=-1&s=1",
              fit: BoxFit.fitWidth,
              color: Colors.black.withOpacity(0.35),
              colorBlendMode: BlendMode.colorBurn),
        ),
        Positioned(
            top: 70,
            left: 20,
            right: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: Helper.getScreenWidth(context),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () => Navigator.pop(context),
                        child: const Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                        ),
                      ),
                      Row(
                        children: [
                          Container(
                            width: 35,
                            height: 35,
                            child: const Center(
                                child: Icon(FontAwesomeIcons.shareSquare,
                                    size: 20)),
                            decoration: AppTheme.getDecoration(
                                color: Colors.white, borderRadius: 10.0),
                          ),
                          const Horizontal(5),
                          Container(
                            width: 35,
                            height: 35,
                            child: const Center(
                                child: Icon(
                              FontAwesomeIcons.bookmark,
                              size: 20,
                            )),
                            decoration: AppTheme.getDecoration(
                                color: Colors.white, borderRadius: 10.0),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                const Vertical(30),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: AppTheme.titleHeader("Temple Of Dawn (Wat Arun)",
                      color: Colors.white),
                ),
                Padding(
                  padding: const EdgeInsets.all(2.5),
                  child: Row(
                    children: [
                      const Icon(Icons.location_pin, color: Colors.white),
                      AppTheme.normalText("Hanoi, Vietnam", color: Colors.white)
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(2.5),
                  child: AppTheme.normalText(
                      " Points of Interest & Landmarks • Religious Sites",
                      color: Colors.white),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 2.5, left: 5),
                  child: GetRatingStarWidget(
                    rating: 3.5,
                    color: Colors.white,
                    size: 25.0,
                  ),
                )
              ],
            ))
      ],
    );
  }

  getOpenTimeWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AppTheme.contentHeader("OpenTime"),
        InkWell(
          child: AppTheme.normalText("Open 08.00-19.00",
              color: Colors.green, fontSize: 16.0, fontWeight: FontWeight.w400),
        )
      ],
    );
  }
}
