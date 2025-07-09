


import '../../../../core/network_caller/network_caller.dart';

class GetApiService {
  static Future<NetworkResponse> fetchAllPosts() async {
    const String url = 'https://jsonplaceholder.typicode.com/posts';
    return await NetworkCaller.getRequest(url: url);
  }
}
