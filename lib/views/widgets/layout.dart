import 'package:flutter/material.dart';
import 'package:aunjai/app_theme.dart';
import 'package:aunjai/utils/media_size.dart';

class LayoutPageView extends StatelessWidget {
  final Widget child;
  const LayoutPageView({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const ClampingScrollPhysics(),
      child: Container(
        height: Helper.getScreenHeight(context),
        width: Helper.getScreenWidth(context),
        padding: const EdgeInsets.only(left: 20, right: 20),
        color: AppTheme.nearlyWhite,
        child: child,
      ),
    );
  }
}
