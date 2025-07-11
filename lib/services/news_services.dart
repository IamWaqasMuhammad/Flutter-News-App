import 'package:http/http.dart' as http;

import '../models/news_model.dart';

class NewsServices {
  final String baseUrl = 'https://newsapi.org/v2/';
  final String apiKey = 'f14fbddfc28a44bbb5bffac4833bd7eb';

  // ✅ Return type declared properly
  Future<List<Article>> getNews() async {
    Uri url = Uri.parse(
      "${baseUrl}top-headlines?country=us&category=business&apiKey=$apiKey",
    );

    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final data = newApiFromJson(response.body);
        return data.articles ?? [];
      } else {
        print("Error: ${response.statusCode}");
        return [];
      }
    } catch (e) {
      print("Exception: $e");
      return [];
    }
  }
}
