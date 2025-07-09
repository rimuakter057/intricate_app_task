
import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../db/offline_db_helper.dart';
import '../models/offline_api_model.dart';


class GetApiController extends GetxController {
  bool isLoading = false;
  List<GetApiModel> posts = [];
  String errorMessage = '';

  // Main fetch function with update()
  Future<void> fetchPosts() async {
    isLoading = true;
    errorMessage = '';
    update(); // Notify UI

    try {
      final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

      if (response.statusCode == 200) {
        final List data = jsonDecode(response.body);
        posts = data.map((e) => GetApiModel.fromJson(e)).toList();
        await GetDBHelper.insertPosts(posts);
      } else {
        errorMessage = 'API error: ${response.statusCode}';
        await _loadCachedPosts();
      }
    } catch (e) {
      errorMessage = 'No internet. Showing cached data.';
      await _loadCachedPosts();
    }

    isLoading = false;
    update(); // Notify UI again after done
  }

  Future<void> _loadCachedPosts() async {
    posts = await GetDBHelper.getPosts();
  }
}
