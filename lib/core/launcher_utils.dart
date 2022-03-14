import 'package:url_launcher/url_launcher.dart';

class LauncherUtils {
  LauncherUtils._();

  static Future<void> call(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
