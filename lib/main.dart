import 'package:ecommerce_app/routes/route_helper.dart';
import 'package:ecommerce_app/screens/bottom_bar.dart';
import 'package:ecommerce_app/screens/customscroll.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controllers/popular_product_controller.dart';
import 'controllers/recommended_controller.dart';
import 'helper/dependecies.dart' as dep;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.find<PopolarProductController>().getPopularProductList();
    Get.find<RecommendedController>().getRecommendedProductList();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      //home: FoodDisplay(),
      home: BottomBar(),
      initialRoute: RouteHelper.initial,
      getPages: RouteHelper.routes,
      //home: CustomScroll(),
    );
  }
}
