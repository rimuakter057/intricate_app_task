

import '../../../../core/network_caller/network_caller.dart';

class ApiService {
  static const String baseUrl = 'https://fakestoreapi.com';

  static Future<NetworkResponse> fetchAllProducts() async {
    final String url = '$baseUrl/products';
    return await NetworkCaller.getRequest(url: url);
  }
}

