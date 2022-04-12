import 'dart:async';
import 'package:aunjai/views/loading_page/loading.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart' show rootBundle;
import 'package:aunjai/constant/style_constant.dart';
import 'package:aunjai/mock/map_place_nearby_mock.dart';
import 'package:aunjai/model/map_place_nearby.dart';
import 'package:aunjai/utils/helper.dart';
import 'package:aunjai/utils/widgets/decoration.dart';
import 'package:aunjai/utils/widgets/get_rating_star.dart';
import 'package:aunjai/utils/widgets/horizontal.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapNearBy extends StatefulWidget {
  final CameraPosition kGooglePlex;

  MapNearBy({Key? key, required this.kGooglePlex}) : super(key: key);

  @override
  State<MapNearBy> createState() => _MapNearByState(this.kGooglePlex);
}

class _MapNearByState extends State<MapNearBy> {
  final CameraPosition kGooglePlex;
  final Completer<GoogleMapController> _controller = Completer();

  _MapNearByState(this.kGooglePlex);

  late final Set<Marker> _marSet = {};
  late String _mapStyle;

  late double zoomMap;

  @override
  initState() {
    rootBundle.loadString('assets/map_style.txt').then((string) {
      _mapStyle = string;
    });

    print("Size-->" + MapPlaceNearbyMock.length.toString());

    zoomMap = kGooglePlex.zoom;
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: Helper.getScreenWidth(context),
        height: Helper.getScreenHeight(context),
        child: Stack(
          children: [
            GoogleMap(
              onMapCreated: (GoogleMapController controller) {
                controller.setMapStyle(_mapStyle);

                for (MapPlaceNearby e in MapPlaceNearbyMock) {
                  _marSet.add(Marker(
                      icon: BitmapDescriptor.defaultMarker,
                      position: LatLng(e.lat, e.lon),
                      markerId: MarkerId(e.placeId)));
                }

                _controller.complete(controller);
                setState(() {});
              },
              markers: _marSet,
              initialCameraPosition: kGooglePlex,
              mapType: MapType.normal,
            ),
            Positioned(
                top: 40,
                left: 20,
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: decoration(color: Colors.white),
                    child: const Center(
                        child: Icon(
                      Icons.close_sharp,
                      size: 25,
                    )),
                  ),
                )),
            Positioned(
                left: 10,
                right: 10,
                bottom: 20,
                child: SizedBox(
                  width: Helper.getScreenWidth(context),
                  height: 110,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: MapPlaceNearbyMock.length,
                      itemBuilder: (ctx, index) {
                        return cardPlaceNearby(MapPlaceNearbyMock[index]);
                      }),
                ))
          ],
        ),
      ),
    );
  }

  Widget cardPlaceNearby(MapPlaceNearby mapPlaceNearby) {
    return InkWell(
      onTap: () async {
        final GoogleMapController controller = await _controller.future;

        controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
            bearing: 4.8334901395799,
            target: LatLng(mapPlaceNearby.lat, mapPlaceNearby.lon),
            tilt: 3.440717697143555,
            zoom: zoomMap)));
      },
      child: Container(
        margin: const EdgeInsets.only(right: Helper.layoutPadding),
        decoration: decoration(
          color: Colors.white,
        ),
        padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(mapPlaceNearby.image,
                    height: 100, width: 100, fit: BoxFit.cover)),
            const Horizontal(10.0),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                    width: 130,
                    child: textContentTitle(mapPlaceNearby.placeName)),
                subtitle(mapPlaceNearby.categoryLabel),
                ratingStar(score: mapPlaceNearby.rating)
              ],
            )
          ],
        ),
      ),
    );
  }
}
