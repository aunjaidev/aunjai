import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

class CallApi {
  CallApi._();

  static final _dio = Dio();

  static Future<http.Response> fetchFormData(
      String url, Map<String, dynamic> body) async {
    _dio.post(url, data: FormData.fromMap(body));

    return http.post(
      Uri.parse(url),
      body: body,
    );
  }
}
