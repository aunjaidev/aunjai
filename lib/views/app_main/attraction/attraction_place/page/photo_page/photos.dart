import 'dart:convert';
import 'dart:io';

import 'package:aunjai/utils/helper.dart';
import 'package:flutter/material.dart';

class AttractionPhotos extends StatefulWidget {
  const AttractionPhotos({Key? key}) : super(key: key);

  @override
  State<AttractionPhotos> createState() => _AttractionPhotosState();
}

class _AttractionPhotosState extends State<AttractionPhotos> {

  @override
  void initState() {
    getAlbum();
    super.initState();
  }

  late List<String> photos = [];

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

    for (var element in data) {
      photos.add(element["url"]);
    }
    setState(() {});
  }


  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.spaceBetween,
      direction: Axis.horizontal,
      children: getPhotos(),
    );
  }

  List<Widget> getPhotos() {
    List<Widget> widgets = [];
    for (var url in photos) {
      widgets.add(Container(
        padding: const EdgeInsets.all(2.50),
        width: Helper.getScreenWidth(context) / 2,
        height: Helper.getScreenWidth(context) / 2.5,
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
}
