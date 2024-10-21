import 'dart:developer';
import 'dart:convert';
import 'package:fake_store_flutter/data/models/network_response.dart';
import 'package:http/http.dart';

abstract class NetworkCaller {
  /// get request method
  static Future<NetworkResponse> getRequest({required String url}) async {
    try {
      Response response = await get(Uri.parse(url));

      if (response.statusCode == 200) {
        return NetworkResponse(
          true,
          response.statusCode,
          jsonDecode(response.body),
        );
      } else {
        log('Error occurred endpoint $url');
        log('Error occurred status code ${response.statusCode}');
        return NetworkResponse(false, response.statusCode, null);
      }
    } catch (e) {
      log(e.toString());
    }
    return NetworkResponse(false, -1, null);
  }
}
