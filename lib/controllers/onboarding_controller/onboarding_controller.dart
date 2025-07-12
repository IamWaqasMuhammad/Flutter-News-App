
import '../../constants/app_barrels/app_barrels.dart';

class OnboardingController extends GetxController {
  final pageController = PageController();
  var currentPage = 0.obs;

  /// TO NAVIGATE TO NEXT PAGE
  void nextPage(){
    if(currentPage.value < 2){
      pageController.nextPage(duration: Duration(microseconds: 300), curve: Curves.easeIn);
    }
    else{
      Get.offNamed(AppRoutes.login);
    }
  }


  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }


  void onPageChanged(int index){
    currentPage.value=index;
  }

  /// ✅ TO NAVIGATE TO PREVIOUS PAGE
  void backPage() {
    if (currentPage.value > 0) {
      pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    } else {
      // Optional: Exit app or show dialog
      Get.back(); // If you want to pop the onboarding screen
    }
  }



  final List<Map<String, String>> onboardingData = [
    {
      "title": "Stay Updated, Stay Ahead",
      "subtitle": "Get breaking news, trending topics, and real-time headlines curated just for you — all in one place.",
      "image": AppImagesAssets.onboardingImage1,
    },
    {
      "title": "Your Interests, Your Feed",
      "subtitle": "Select the topics you love — from politics to plant-based diets — and we’ll tailor your news experience accordingly.",
      "image": AppImagesAssets.onboardingImage2,
    },
    {
      "title": "Fuel Your Mind and Body",
      "subtitle": "Discover nutrition tips, healthy recipes, and wellness news to help you lead a better lifestyle, one bite at a time.",
      "image": AppImagesAssets.onboardingImage3,
    },
  ];
}