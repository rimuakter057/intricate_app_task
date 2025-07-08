import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../db/get_db_helper.dart';
import '../models/get_api_model.dart';

class GetApiController extends GetxController {
  RxBool isLoading = false.obs;
  RxList<GetApiModel> posts = <GetApiModel>[].obs;
  RxString errorMessage = ''.obs;

  Future<void> fetchPosts() async {
    isLoading.value = true;
    errorMessage.value = '';

    try {
      final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

      if (response.statusCode == 200) {
        final List data = jsonDecode(response.body);
        final fetchedPosts = data.map((e) => GetApiModel.fromJson(e)).toList();

        posts.value = fetchedPosts;
        await GetDBHelper.insertPosts(fetchedPosts);
      } else {
        await loadCachedPosts();
        errorMessage.value = 'API error: ${response.statusCode}';
      }
    } catch (e) {
      await loadCachedPosts();
      errorMessage.value = 'Failed to load from internet. Showing cached data.';
    }

    isLoading.value = false;
  }

  Future<void> loadCachedPosts() async {
    final cached = await GetDBHelper.getPosts();
    posts.value = cached;
  }
}
