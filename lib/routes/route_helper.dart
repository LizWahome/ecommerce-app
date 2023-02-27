import 'package:ecommerce_app/screens/bottom_bar.dart';
import 'package:ecommerce_app/screens/customscroll.dart';
import 'package:ecommerce_app/screens/food_display.dart';
import 'package:get/get.dart';

class RouteHelper {
  static const String initial = "/";
  static const String popularFood = "/popular-Food";
  static const String recommendedFood = "/recommended-Food";

  static String getInitial() => '$initial';
  static String getPopularFood(int index) => '$popularFood?pageId=$index';
  static String getRecommendedFood() => '$recommendedFood';

  static List<GetPage> routes = [
    GetPage(name: initial, page: () => const BottomBar()),
    GetPage(
        name: popularFood,
        page: () {
          var index = Get.parameters['pageId'];
          return FoodDisplay(pageId: int.parse(index!));
        },
        transition: Transition.fadeIn),
    GetPage(
        name: recommendedFood,
        page: () {
          return CustomScrollPage();
        },
        transition: Transition.fadeIn),
  ];
}
