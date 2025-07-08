import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../data/controllers/get_api_controller.dart';


class GetApiScreen extends StatelessWidget {
  GetApiScreen({super.key});

  final GetApiController controller = Get.put(GetApiController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Get API Offline Posts')),
      floatingActionButton: FloatingActionButton(
        onPressed: () => controller.fetchPosts(),
        child: const Icon(Icons.refresh),
      ),
      body: FutureBuilder(
        future: controller.fetchPosts(),
        builder: (context, snapshot) {
          return Obx(() {
            if (controller.isLoading.value) {
              return const Center(child: CircularProgressIndicator());
            }

            if (controller.errorMessage.isNotEmpty) {
              return Center(
                child: Text(controller.errorMessage.value,
                    style: const TextStyle(color: Colors.red)),
              );
            }

            if (controller.posts.isEmpty) {
              return const Center(child: Text("No posts available."));
            }

            return ListView.builder(
              itemCount: controller.posts.length,
              itemBuilder: (context, index) {
                final post = controller.posts[index];
                return Card(
                  elevation: 3,
                  margin:
                  const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('User ID: ${post.userId}',
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.blue)),
                        const SizedBox(height: 8),
                        Text(post.title,
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w600)),
                        const SizedBox(height: 6),
                        Text(post.body,
                            style: const TextStyle(
                                fontSize: 15, color: Colors.black87)),
                      ],
                    ),
                  ),
                );
              },
            );
          });
        },
      ),
    );
  }
}
