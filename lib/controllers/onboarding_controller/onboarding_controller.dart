
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
      Get.offAllNamed(AppRoutes.login);
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

  /// TO NAVIGATE TO PREVIOUS PAGE
  void backPage() {
    if (currentPage.value > 0) {
      pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    } else {
      Get.back();
    }
  }



  final List<Map<String, String>> onboardingData = [
    {
      "title": AppStringsAssets.onboardTitle1,
      "subtitle": AppStringsAssets.onboardSubTitle1,
      "image": AppImagesAssets.onboardingImage1,
    },
    {
      "title": AppStringsAssets.onboardTitle2,
      "subtitle": AppStringsAssets.onboardSubTitle2,
      "image": AppImagesAssets.onboardingImage2,
    },
    {
      "title": AppStringsAssets.onboardTitle3,
      "subtitle": AppStringsAssets.onboardSubTitle3,
      "image": AppImagesAssets.onboardingImage3,
    },
  ];
}