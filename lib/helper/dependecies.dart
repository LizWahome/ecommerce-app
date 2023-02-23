import 'package:ecommerce_app/controllers/recommended_controller.dart';
import 'package:ecommerce_app/data/api/api_client.dart';
import 'package:ecommerce_app/data/api/repository/popular_product_repo.dart';
import 'package:ecommerce_app/data/api/repository/recommended_repo.dart';
import 'package:ecommerce_app/utlis/app_constants.dart';
import 'package:get/get.dart';

import '../controllers/popular_product_controller.dart';

Future<void> init() async {
  //api client
  Get.lazyPut(() => ApiClient(appBaseUrl: AppConstants.BASE_URL));

  //repos
  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => RecommendedProductRepo(apiClient: Get.find()));

  //controllers
  Get.lazyPut(() => PopolarProductController(popularProductRepo: Get.find()));
  Get.lazyPut(() => RecommendedController(recommendedProductRepo: Get.find()));
}
