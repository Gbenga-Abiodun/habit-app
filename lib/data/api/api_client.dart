import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiClient extends GetConnect implements GetxService {
  final String appBaseUrl;

  late SharedPreferences sharedPreferences;

  late Map<String, String> _mainHeaders;

  ApiClient({
    required this.sharedPreferences,
    required this.appBaseUrl,
  }) {
    baseUrl = appBaseUrl;
    timeout = const Duration(
      seconds: 30,
    );
    _mainHeaders = {
      'Content-type': 'application/json; charset=UTF-8',
      // 'Authorization': 'Bearer $token'
    };
  }

  Future<Response> getData(
    String uri, {
    Map<String, String>? headers,
  }) async {
    try {
      Response response = await get(
        uri,
        headers: headers,
      );
      print(
        response.body.toString(),
      );
      return response;
    } catch (e) {
      print(
        e.toString(),
      );
      return Response(
        statusText: e.toString(),
        statusCode: 1,
      );
    }
  }

  // Future<Response> deleteData(
  //   String uri, {
  //   Map<String, String>? headers,
  // }) async{
  //   try {
  //     Response response = await delete(uri, headers: headers,)
  //
  //   } catch (e) {
  //
  //   }
  // }
}
