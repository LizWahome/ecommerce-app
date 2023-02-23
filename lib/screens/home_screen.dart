import 'package:ecommerce_app/controllers/recommended_controller.dart';
import 'package:ecommerce_app/data/api/repository/recommended_repo.dart';
import 'package:ecommerce_app/screens/food_page.dart';
import 'package:ecommerce_app/utlis/app_infolist.dart';
import 'package:ecommerce_app/utlis/app_layout.dart';
import 'package:ecommerce_app/utlis/constant_colors.dart';
import 'package:ecommerce_app/widgets/buildcard_widget.dart';
import 'package:ecommerce_app/widgets/icon_text_widget.dart';
import 'package:ecommerce_app/widgets/smalltext_widget.dart';
import 'package:ecommerce_app/widgets/bigtext_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late PageController _controller = PageController(initialPage: 0);
  var currPageValue = 0.0;
  double scaleFactor = AppLayout.getHeight(0.8);
  //final double _height = AppLayout.getHeight(200);
  double currentIndexPage = 0;

  @override
  void initState() {
    super.initState();
    _controller = PageController(viewportFraction: 0.85);
    _controller.addListener(() {
      setState(() {
        currPageValue = _controller.page!;
      });
    });
    // _controller =
    //     PageController(initialPage: currPageValue, viewportFraction: 0.85);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = AppLayout.getSize(context);
    return Scaffold(
      backgroundColor: Styles.containerColor2,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: AppLayout.getWidth(30),
                  vertical: AppLayout.getHeight(40)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      BigText(
                        text: "Bangladesh",
                        color: Styles.blueColor,
                        fontWeight: true,
                      ),
                      Row(
                        children: [
                          SmallText(text: "Norway"),
                          const Icon(
                            Icons.arrow_drop_down,
                            color: Colors.black,
                          )
                        ],
                      )
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.all(AppLayout.getHeight(17)),
                    decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(AppLayout.getHeight(20)),
                        color: Styles.blueColor),
                    child: const Center(
                      child: Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
            ),
            const FoodPage(),
            Gap(AppLayout.getHeight(30)),
            Container(
              margin: EdgeInsets.symmetric(horizontal: AppLayout.getWidth(30)),
              child: Row(
                children: [
                  BigText(
                    text: "Recommended",
                    fontWeight: false,
                  ),
                  Gap(AppLayout.getHeight(20)),
                  SmallText(text: "Food pairing")
                ],
              ),
            ),
            GetBuilder<RecommendedController>(
              builder: (recommendedProduct) {
                return ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  //itemCount: recommendedProduct.recommendedProductList.length,
                  itemCount: infoList.length,
                  itemBuilder: (context, index) {
                    return FittedBox(
                      child: Row(
                        children: [
                          buildCard(infoList: infoList[index]),
                          Container(
                            width: size.width,
                            height: AppLayout.getHeight(170),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(
                                        AppLayout.getHeight(25)),
                                    bottomRight: Radius.circular(
                                        AppLayout.getHeight(25))),
                                color: Colors.white),
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  BigText(
                                      text:
                                        "Nutricious food prepared with love. Enjoy",
                                      fontWeight: false),
                                  Gap(AppLayout.getHeight(15)),
                                  BigText(
                                    text: "normal",
                                    fontWeight: true,
                                  ),
                                  Gap(AppLayout.getHeight(15)),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      IconTextWidget(
                                          text: "spicy",
                                          color: Styles.containerColor,
                                          icon: Icons.circle),
                                      IconTextWidget(
                                          text: "1.4 km",
                                          color: Styles.blueColor,
                                          icon: Icons.location_on_sharp),
                                      IconTextWidget(
                                          text: "45 mins",
                                          color: Styles.containerColor,
                                          icon: Icons.access_time)
                                    ],
                                  )
                                ],
                              ),
                            ),
                          )
                          //ContainerWidget(stacklist: stackList[index])
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (context, _) =>
                      Gap(AppLayout.getHeight(10)),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
