import 'package:get/get.dart';

import '../models/news_model.dart';
import '../services/news_services.dart';

class NewsController extends GetxController {
  var isLoading = true.obs;
  var articles = <Article>[].obs;
  var error = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchNews();
  }

  void fetchNews() async {
    try {
      isLoading(true);
      error('Error');
      final result = await NewsServices().getNews();
      articles.assignAll(result);
    } catch (e) {
      error(e.toString());
    } finally {
      isLoading(false);
    }
  }
}
