import 'package:aunjai/app_theme.dart';
import 'package:aunjai/init.dart';
import 'package:aunjai/routes.dart';
import 'package:aunjai/utils/helper.dart';
import 'package:aunjai/utils/text.common.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

class WidgetsCommon {
  WidgetsCommon._();

  static Widget horizontal(double size) => _Horizontal(size);

  static Widget vertical(double size) => _Vertical(size);

  static Widget notificationBadge() => const _NotificationBadge();

  static Widget expandableText(
          {required String text, required int trimLines}) =>
      _ExpandableText(text, trimLines: trimLines);

  static Widget rating({double? size, required double score}) {
    List<Widget> widgets = [];
    for (int i = 0; i < score.toInt(); i++) {
      widgets.add(Icon(
        Icons.star,
        size: size ?? 18.0,
        color: AppTheme.primaryColor,
      ));
    }

    if (score.toInt() != score) {
      widgets.add(Icon(
        Icons.star_half,
        size: size ?? 18.0,
        color: AppTheme.primaryColor,
      ));
    }

    for (int i = 0; i < 5 - widgets.length; i++) {
      widgets.add(Icon(
        Icons.star_border,
        size: size ?? 18.0,
        color: AppTheme.primaryColor,
      ));
    }
    return Row(
      children: widgets,
    );
  }

  static AppBar appBar(context,{String? title,List<Widget>? actions}) {
    return AppBar(
      backgroundColor: AppTheme.primaryColor,
      title: title != null?Text(title,style: const TextStyle(
          color: AppTheme.nearlyBlack,
          fontFamily: "Mitr",
          fontSize: 28.0,
          fontWeight: FontWeight.w400),):const SizedBox(),
      actions: actions ?? [],
      leading: IconButton(
        hoverColor: Colors.transparent,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        icon: const Icon(
          Icons.arrow_back_ios,
          color: Colors.white,
        ),
        onPressed: () => Navigator.pop(context),
      ),
    );
  }

  static Widget button(context,
      {required String label, required GestureTapCallback onTap}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: InkWell(
        onTap: onTap,
        child: Container(
            height: 45,
            decoration: const BoxDecoration(
                color: Color.fromARGB(255, 225, 225, 225),
                borderRadius: BorderRadius.all(Radius.circular(10.0))),
            width: Helper.getScreenWidth(context),
            child: Center(
                child: Text(
              label,
              style: TextCommon.customeStyle(fontSize: 18.0),
            ))),
      ),
    );
  }

  static Widget progressbar(double value) {
    return LinearProgressIndicator(
      backgroundColor: Colors.black26,
      valueColor: new AlwaysStoppedAnimation<Color>(Colors.red),
      value: value,
    );
  }

  static Widget textField(context, {String? label}) {
    return SizedBox(
      width: Helper.getScreenWidth(context),
      height: 64,
      child: Padding(
        padding: const EdgeInsets.only(top: 8, bottom: 8),
        child: Container(
          decoration: BoxDecoration(
            color: HexColor('#f1f2f3'),
            borderRadius: const BorderRadius.only(
              bottomRight: Radius.circular(13.0),
              bottomLeft: Radius.circular(13.0),
              topLeft: Radius.circular(13.0),
              topRight: Radius.circular(13.0),
            ),
          ),
          child: Row(
            children: <Widget>[
              const SizedBox(
                width: 60,
                height: 60,
                child: Icon(Icons.search, color: Color(0xFFB9BABC)),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.only(right: 16),
                  child: TextFormField(
                    style: const TextStyle(
                      fontFamily: 'WorkSans',
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: AppTheme.darkGrey,
                    ),
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: label ?? "",
                      border: InputBorder.none,
                      helperStyle: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Color(0xFFB9BABC),
                      ),
                      labelStyle: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        letterSpacing: 0.2,
                        color: Color(0xFFB9BABC),
                      ),
                    ),
                    onEditingComplete: () {},
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  static Decoration decoration({Color? color, borderRadius}) =>
      BoxDecoration(
          color: color ?? AppTheme.primaryColor,
          borderRadius: BorderRadius.circular(borderRadius ?? 15),
          border: Border.all(
            color: Colors.transparent,
          ),
          boxShadow: const [
            BoxShadow(
              offset: Offset(1, 1),
              blurRadius: 2.5,
              color: Colors.grey,
              spreadRadius: -2,
            )
          ]);
}

class _Horizontal extends StatelessWidget {
  const _Horizontal(this.size, {Key? key}) : super(key: key);

  final double size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
    );
  }
}

class _Vertical extends StatelessWidget {
  const _Vertical(this.size, {Key? key}) : super(key: key);

  final double size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size,
    );
  }
}

class _ExpandableText extends StatefulWidget {
  const _ExpandableText(
    this.text, {
    Key? key,
    required this.trimLines,
  }) : super(key: key);

  final String text;
  final int trimLines;

  @override
  ExpandableTextState createState() => ExpandableTextState();
}

class ExpandableTextState extends State<_ExpandableText> {
  bool _readMore = true;

  void _onTapLink() {
    setState(() => _readMore = !_readMore);
  }

  @override
  Widget build(BuildContext context) {
    const colorClickableText = Colors.blue;
    TextSpan link = TextSpan(
        text: _readMore ? "... read more" : " read less",
        style: const TextStyle(
          color: colorClickableText,
        ),
        recognizer: TapGestureRecognizer()..onTap = _onTapLink);
    Widget result = LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        assert(constraints.hasBoundedWidth);
        final double maxWidth = constraints.maxWidth;
        // Create a TextSpan with data
        final text = TextSpan(
          text: widget.text,
        );
        // Layout and measure link
        TextPainter textPainter = TextPainter(
          text: link,
          textDirection: TextDirection.rtl,
          //better to pass this from master widget if ltr and rtl both supported
          maxLines: 5,
          ellipsis: '...',
        );
        textPainter.layout(minWidth: constraints.minWidth, maxWidth: maxWidth);
        final linkSize = textPainter.size;
        // Layout and measure text
        textPainter.text = text;
        textPainter.layout(minWidth: constraints.minWidth, maxWidth: maxWidth);
        final textSize = textPainter.size;
        // Get the endIndex of data
        int endIndex;
        final pos = textPainter.getPositionForOffset(Offset(
          textSize.width - linkSize.width,
          textSize.height,
        ));
        endIndex = textPainter.getOffsetBefore(pos.offset)!;
        TextSpan textSpan;
        if (textPainter.didExceedMaxLines) {
          textSpan = TextSpan(
            text: _readMore ? widget.text.substring(0, endIndex) : widget.text,
            style: TextCommon.customeStyle(
                fontSize: 16.0, fontWeight: FontWeight.w200, height: 1.35),
            children: <TextSpan>[link],
          );
        } else {
          textSpan = TextSpan(
            style: TextCommon.customeStyle(
              fontSize: 16.0,
            ),
            text: widget.text,
          );
        }

        return RichText(
          softWrap: true,
          overflow: TextOverflow.clip,
          text: textSpan,
        );
      },
    );
    return result;
  }
}

class _NotificationBadge extends StatelessWidget {
  final VoidCallback? onTap;
  final int notificationCount;

  const _NotificationBadge({
    Key? key,
    this.onTap,
    this.notificationCount = 5,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 64,
      child: Stack(children: <Widget>[
        IconButton(
            icon: const Icon(
              Icons.notifications_none,
              color: Colors.white,
              size: 40,
            ),
            onPressed: onTap),
        notificationCount != 0
            ? Positioned(
                right: 5,
                top: 11,
                child: Container(
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(18),
                  ),
                  constraints: const BoxConstraints(
                    minWidth: 18,
                    minHeight: 18,
                  ),
                  child: Text(
                    '$notificationCount',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              )
            : Container()
      ]),
    );
  }
}


class MediaCarouselHorizontalWidget extends StatelessWidget {
  const MediaCarouselHorizontalWidget({Key? key}) : super(key: key);

  Map<String, dynamic> getPlaceMock() => {
    "id": "p001",
    "title": "Temple Of Dawn (Wat Arun)",
    "coverImage":
    "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/17/ee/e6/a5/wat-arun-is-an-ancient.jpg?w=900&h=-1&s=1",
    "type": "Points of Interest & Landmarks • Religious Sites",
    "distance": 25,
    "rating": 2.5
  };

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            width: Helper.getScreenWidth(context),
            margin:
            const EdgeInsets.only(top: Helper.layoutPadding, bottom: 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Popular Destinations',
                  style: TextCommon.customeStyle(
                      fontSize: 21.0,
                      fontWeight: FontWeight.w400,
                      color: Colors.black),
                ),
                InkWell(
                  onTap: () {},
                  child: Row(
                    children: [
                      Text(
                        "show all",
                        style: TextCommon.customeStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w300,
                            color: Colors.black),
                      ),
                      const Icon(
                        Icons.arrow_forward_ios,
                        size: 10.0,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            width: Helper.getScreenWidth(context),
            height: 260,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                _card(context),
                _card(context),
                _card(context),
                _card(context),
                _card(context),
                _card(context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _card(context) {
    return InkWell(
      onTap: () {
        Map<String, String> args = {"id": "p001", "type": "attraction"};
        handleNavigationRoute(
            context: context, routeName: "/AttractionScreen", arguments: args);
      },
      child: Container(
        margin: const EdgeInsets.only(right: 7.5),
        width: 200,
        height: 150,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: double.infinity,
              height: 130,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(
                  getPlaceMock()["coverImage"],
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 5.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 1.5),
                    child:
                    TextCommon.textActivitiesTitle(getPlaceMock()["title"]),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 1.5),
                    child:
                    TextCommon.textActivitiesContent(getPlaceMock()["type"]),
                  ),
                  WidgetsCommon.rating(score: getPlaceMock()["rating"]),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}