import '../../constants/app_linkers/app_linkers.dart';

class OnboardingController extends GetxController {
  final pageController = PageController();
  var currentPage = 0.obs;

  /// TO NAVIGATE TO NEXT PAGE
  void nextPage(){
    if(currentPage.value <2){
      pageController.nextPage(duration: Duration(microseconds: 300), curve: Curves.easeIn);
    }
    else{
      Get.offNamed(AppRoutes.main);
    }
  }

  /// SKIP TO MAIN SCREEN
  void skip(){
    Get.offNamed(AppRoutes.home);
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }


  void onPageChanged(int index){
    currentPage.value=index;
  }

  final List<Map<String, String>> onboardingData = [
    {
      "title": "Welcome",
      "subtitle": "Discover amazing content",
      "image": AppImagesAssets().onboardingImage1,
    },
    {
      "title": "Explore",
      "subtitle": "Find what you love",
      "image": AppImagesAssets().onboardingImage2,
    },
    {
      "title": "Start",
      "subtitle": "Let’s get started",
      "image": AppImagesAssets().onboardingImage3,
    },
  ];
}