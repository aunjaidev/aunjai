
import 'package:shared_preferences/shared_preferences.dart';
import 'package:aunjai/init.dart';

String getItValue({required String key}) {
  return getItInstance<SharedPreferences>().getString("app." +
      getItInstance<SharedPreferences>().getString("app.lang").toString() +
      "." + key) ?? "null";
}