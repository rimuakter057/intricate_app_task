import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../data/controllers/offline_api_controller.dart';
import '../../data/models/offline_api_model.dart';


class GetApiScreen extends StatelessWidget {
  GetApiScreen({super.key});
  static const String name = '/get-api';
  final GetApiController controller = Get.put(GetApiController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Get API Data"),
      ),
      body: FutureBuilder(
        future: controller.fetchPosts(),
        builder: (context, snapshot) {
          return GetBuilder<GetApiController>(
            builder: (_) {
              if (controller.isLoading) {
                return const Center(child: CircularProgressIndicator());
              }

              if (controller.errorMessage.isNotEmpty) {
                return Center(child: Text(controller.errorMessage));
              }

              if (controller.posts.isEmpty) {
                return const Center(child: Text('No posts available'));
              }

              return ListView.builder(
                itemCount: controller.posts.length,
                itemBuilder: (context, index) {
                  GetApiModel post = controller.posts[index];
                  return ListTile(
                    title: Text(post.title ?? ''),
                    subtitle: Text(post.body ?? ''),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
