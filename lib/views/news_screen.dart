import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:api_testing/controllers/news_controller.dart';
import 'package:api_testing/models/news_model.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final NewsController controller = Get.put(NewsController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('News'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: controller.fetchNews,
            tooltip: 'Refresh News',
          )
        ],
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.error.isNotEmpty) {
          return Center(child: Text('Error: ${controller.error}'));
        }

        if (controller.articles.isEmpty) {
          return const Center(child: Text('No news found'));
        }

        return RefreshIndicator(
          onRefresh: () async => controller.fetchNews(),
          child: ListView.builder(
            physics: const AlwaysScrollableScrollPhysics(),
            itemCount: controller.articles.length,
            itemBuilder: (context, index) {
              final Article article = controller.articles[index];

              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                child: ListTile(
                  contentPadding: const EdgeInsets.all(10),
                  leading: article.urlToImage != null
                      ? Image.network(
                    article.urlToImage!,
                    width: 80,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) =>
                    const Icon(Icons.broken_image),
                  )
                      : const Icon(Icons.image_not_supported),
                  title: Text(
                    article.title ?? 'No Title',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 5),
                      Text(
                        article.description ?? 'No Description',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 5),
                      Text(
                        'Author: ${article.author ?? "Unknown"}',
                        style: const TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                  trailing: Text(
                    article.publishedAt != null
                        ? '${article.publishedAt!.toLocal()}'.split(' ')[0]
                        : 'No Date',
                    style: const TextStyle(fontSize: 10),
                  ),
                ),
              );
            },
          ),
        );
      }),
    );
  }
}
