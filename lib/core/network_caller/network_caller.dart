import 'dart:convert';

import 'package:http/http.dart';

class NetworkResponse {
  final int statusCode;
  final dynamic responseData;
  final String errorMessage;
  final bool isSuccess;

  NetworkResponse({
    required this.statusCode,
    required this.isSuccess,
    this.responseData,
    this.errorMessage = 'Something went wrong',
  });
}

class NetworkCaller {
  static Future<NetworkResponse> getRequest({required String url}) async {
    try {
      Uri uri = Uri.parse(url);
      Response response = await get(uri);

      if (response.statusCode == 200) {
        final decodedData = jsonDecode(response.body);
        return NetworkResponse(
          isSuccess: true,
          statusCode: response.statusCode,
          responseData: decodedData,
        );
      } else {
        return NetworkResponse(
          isSuccess: false,
          statusCode: response.statusCode,
          errorMessage: response.body,
        );
      }
    } catch (e) {
      return NetworkResponse(
          statusCode: -1, isSuccess: false, errorMessage: e.toString());
    }
  }
}
