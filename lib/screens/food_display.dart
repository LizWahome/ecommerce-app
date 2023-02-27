import 'package:ecommerce_app/screens/food_page.dart';
import 'package:ecommerce_app/screens/home_screen.dart';
import 'package:ecommerce_app/utlis/app_infolist.dart';
import 'package:ecommerce_app/utlis/app_layout.dart';
import 'package:ecommerce_app/widgets/app_column.dart';
import 'package:ecommerce_app/widgets/app_icon.dart';
import 'package:ecommerce_app/widgets/bigtext_widget.dart';
import 'package:ecommerce_app/widgets/bottom_navigation_widget.dart';
import 'package:ecommerce_app/widgets/expandable_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class FoodDisplay extends StatelessWidget {
  int pageId;
  FoodDisplay({super.key, required this.pageId});

  @override
  Widget build(BuildContext context) {
    //var product = Get.find<InfoModel>().image[pageId];
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            height: AppLayout.getHeight(350),
            child: Container(
              width: double.maxFinite,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("images/pancakes-2291908_1920.jpg"),
                      fit: BoxFit.cover)),
            ),
          ),
          Positioned(
            top: AppLayout.getHeight(45),
            left: AppLayout.getHeight(20),
            right: AppLayout.getHeight(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                    onTap: () {
                      Get.to(HomeScreen());
                    },
                    child: const AppIcon(icon: Icons.arrow_back_ios_rounded)),
                const AppIcon(icon: Icons.shopping_cart_outlined)
              ],
            ),
          ),
          Positioned(
              left: 0,
              right: 0,
              top: AppLayout.getHeight(340),
              bottom: 0,
              child: Container(
                  padding: EdgeInsets.only(
                      left: AppLayout.getWidth(20),
                      right: AppLayout.getWidth(20),
                      top: AppLayout.getHeight(20)),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(AppLayout.getHeight(20)),
                        topRight: Radius.circular(AppLayout.getHeight(20)),
                      ),
                      color: Colors.white),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const AppColumn(foodtype: 'Dessert'),
                      Gap(AppLayout.getHeight(25)),
                      BigText(text: "Introduce", fontWeight: false),
                      Gap(AppLayout.getHeight(20)),
                      const Expanded(
                          child: SingleChildScrollView(
                              child: ExpandableTextWidget(
                                  text:
                                      "Food is the substance we eat every day for energy and strength. There are many different types of food, such as fruits, vegetables, rice, and pasta. We need to eat a variety of foods to get all the essential nutrients the body needs. Not eating a healthy and balanced diet leads to weakness and deficiency diseases. Every individuals needs good foods for a healthy body . We have to take good food in a balanced ratio . Such as, fruits , green vegetables , pulse , and so on . Good food is the one that gives us the right amount of nutrients to keep ourselves healthy and fit.")))
                    ],
                  )))
        ],
      ),
      bottomNavigationBar: const BottomWidget(),
    );
  }
}
